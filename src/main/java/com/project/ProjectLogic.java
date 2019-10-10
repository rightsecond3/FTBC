package com.project;

import java.security.PublicKey;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.util.SortProject;

import blockchain.Block;
import blockchain.BlockChain;
import blockchain.Output;
import blockchain.Project;
import blockchain.Transaction;
import blockchain.Wallet;
import blockchain.util.Base64Conversion;
import blockchain.util.CommonSet;
import vo.ProjectVO;
/*
 * 성공임박 - 모인금액/목표금액
 * 추천  - 오늘날짜/d-7안에인 프로젝트? 기준은 정해야함.
 * 인기 - 펀딩한 사람들 명 수로 
 * 
 */
@Service
public class ProjectLogic {
	private static final Logger logger = LoggerFactory.getLogger(ProjectLogic.class);
	@Autowired
	ProjectDao projectDao = null;
	
	public BlockChain getBlockChain() {
		BlockChain blockChain = null;
		try {
			String blockchain64 = Base64Conversion.importChain("FTBCChain","C:\\Users\\kosmo_03\\Desktop\\FTBC\\test (1)\\");
			blockChain = (BlockChain) Base64Conversion.decodeBase64(blockchain64);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blockChain;
		
	}
	
	//프로젝트 별 펀딩인원 넣기
		public List<ProjectVO> putSupporterNum(List<ProjectVO> projectList) {
			BlockChain blockChain = getBlockChain();
			int sup_num = 0;
			
			/*
			 * 1. 받아온 프로젝트 리스트 사이즈만큼 for문 돌림
			 * 2. import해온 블록체인 사이즈만큼 다시 for문 돌림
			 * 3. 2번에서 돌려서 나온 block의 transactions 사이즈만틈 다시 for문 돌림.
			 * 4. pVO의 publicKey와 transaction의 recepient의 퍼블릭키를 대조.
			 * 5. 4번에서 같을경우 변수 sup_num ++
			 * 6. 다 돌리면 pVO에 set.
			 */
			for(int i=0; i < projectList.size();i++) {
				ProjectVO pVO = projectList.get(i);
				for(int j=0;j<blockChain.blockChain.size();j++) {
					Block block = blockChain.blockChain.get(j);
					for(int k=0;k<block.transactions.size();k++) {
						Transaction transaction = block.transactions.get(k);
						PublicKey publicKey = null;
						try {
							publicKey = (PublicKey) Base64Conversion.decodeBase64(pVO.getPj_publickey());
						} catch (Exception e) {
							e.printStackTrace();
						}
						if(transaction.reciepient.equals(publicKey)) {
							sup_num ++;
						}
					}
				}
				pVO.setSupport_num(sup_num);
			}
			return projectList;
		
		}
		
		//프로젝트 별 펀딩 금액 넣기
		public List<ProjectVO> putFundedMoney(List<ProjectVO> projectList) {
			CommonSet commonset = CommonSet.getInstance();
			//금액까지 넣은 map을 넣을 리스트
			//List<ProjectVO> tempList = new Vector();
			//펀딩 금액
			long fundedMoney = 0;
			
			/*
			 * 1. 파라미터로 받아온 프로젝트 리스트만큼 for문 돌려서 프로젝트 코드들 가져옴
			 * 2. CommonSet에 있는 projectWallets 크기 만큼 for문 돌려서 1번에서 가져온
			 *    프로젝트코드로 해당 프로젝트의 projectWallet 가져옴
			 * 3. 2번에서 가져온 projectWallet의 UTXOs 만큼 for문 돌려서 
			 * 	  UTXO의 output의 value를 FundedMoney변수에 ++
			 * 4. 1번에서 가져온 tempProject에 FundedMoney추가		
			 */
			for(int i=0; i<projectList.size();i++) {
				ProjectVO pVO = projectList.get(i);
				String projectCode = pVO.getProject_code();
				Map<String, Wallet> projectWallets = commonset.projectWallets;
				
				Object keys[] = projectWallets.keySet().toArray();
				for(int j=0;j<keys.length;j++) { 
					if(projectCode.equals(keys[j].toString())){
						Wallet projectWallet = projectWallets.get(keys[j]);
						Map<String, Output> UTXOs = projectWallet.UTXOs;
						Object UTXO_keys[] = UTXOs.keySet().toArray();
						for(int k=0;k<UTXO_keys.length;k++) {
							Output output = UTXOs.get(UTXO_keys[k]);
							fundedMoney =+ output.value;
						}
						//end of UTXO_keys for
					}
					// end of if
				}
				// end of projectWallets keys for
				pVO.setFundedMoney(fundedMoney);
			}
			// end of projectList for
			return projectList;
		}
		// end of putFundedMoney
		
		
	//메인 페이지에 뿌릴 프로젝트들 가져오기 
	public Map<String, Object>getMainProjects() {
		Map<String, Object> mainProjects = new HashMap<>();
		
		//VO로 바꾸거나 그냥 Map 쓰거나
		// DB에서 가져와야할 것 프로젝트명, 프로젝트 올린사람 닉네임, 목표금액, 마감일
		List<ProjectVO> popularProjects = getPopularProjects(projectDao.allProjects());//인기 프로젝트
		List<ProjectVO> recommnadProjects = projectDao.recommnadProjects(); //추천 프로젝트 
		List<ProjectVO> vergeofProjects = getVergeofProejcts(projectDao.allProjects()); //성공임박 프로젝트
		
		List<ProjectVO> bannerProjects = new ArrayList<>();
		bannerProjects.add(popularProjects.get(0));
		bannerProjects.add(recommnadProjects.get(0));
		bannerProjects.add(recommnadProjects.get(1));
		bannerProjects.add(vergeofProjects.get(0));
		
		/*
		 * DB에서 가져온 정보로 BlockChain에 있는 데이터 가져와야함.
		 * 블록체인에서 가져와야할 정보: 프로젝트 모인 금액
		 */
		
		//프로젝트 리스트들로 putFundedMoney돌려서 블록체인에있는 펀딩금액 데이터 넣어서 Map에 담아줌.
		mainProjects.put("popularProject", putFundedMoney(popularProjects));
		mainProjects.put("recommnadProject", putFundedMoney(recommnadProjects));
		mainProjects.put("vergeofProject", putFundedMoney(vergeofProjects));
		
		return mainProjects;
	}
			
	//내가 펀딩한 프로젝트들 가져오기 
	public List<ProjectVO> getFundedProjects(String mem_email) {
		//내가 펀딩한 프로젝트 담을 리스트
		List<ProjectVO> fundedProjects = new ArrayList<>();
		//내가 펀딩한 프로젝트의 프로젝트 코드들
		List<String> projectCodes = new ArrayList<>();
		//내 퍼블릭키 
		PublicKey my_publicKey = null;;
		try {
			my_publicKey = (PublicKey) Base64Conversion.decodeBase64(projectDao.getPublicKey(mem_email));
		} catch (Exception e) {
			e.printStackTrace();
		}
		CommonSet commonset = CommonSet.getInstance();
		BlockChain blockChain = getBlockChain();
		/*
		 * 1. 로컬에서 가져온 블록체인의 사이즈 만큼 for문 돌려서 Block을 뽑아냄
		 * 2. 블럭의 transactions 사이즈만큼 for문을 돌려서 트랜잭션을 뽑아냄
		 * 3. 트랜잭션의 sender가 내 공개키와 같을경우 reciepient을 가져옴 
		 * 4. 3번에서 가져온 reciepient(PublicKey)로 CommonsSet의 projects에서
		 * 	  프로젝트 코드를 가져온다음 proejectCodes 리스트에 담음.
		 * 5. proejectCodes를 파라미터로 보내서 DB에서 해당 프로젝트의 정보들을 가져옴.
		 */
		for(int i=0;i<blockChain.blockChain.size();i++) {
			Block block = blockChain.blockChain.get(i);
			for(int j=0;j<block.transactions.size();j++){
				Transaction transaction = block.transactions.get(j);
				PublicKey funded_publicKey = null;
				if(my_publicKey.equals(transaction.sender)){
					funded_publicKey = transaction.reciepient;
					Object keys[] = commonset.projects.keySet().toArray();
					for(int k=0;k<keys.length;k++) {
						if(funded_publicKey.equals(commonset.projects.get(keys[k]).projectPublicKey)) {
							String projectCode = commonset.projects.get(keys[k]).projectCode;
							projectCodes.add(projectCode);
						}
					}
				}
			}
		}
		
		fundedProjects = putFundedMoney(projectDao.getFundedProject(projectCodes));
		
		return fundedProjects;
	}
	
	//내가 만든 프로젝트들 가져오기
	public List<ProjectVO> getMyProjects(String mem_email) {
		List<ProjectVO> myProjects = new ArrayList<>();
		myProjects = putFundedMoney(projectDao.getMyProjects(mem_email));
		return myProjects;
	}
	
	//프로젝트 상세보기 
	public ProjectVO getProjectDetail(String projectCode) {
		ProjectVO projectDetail = projectDao.getProjectDetail(projectCode);
		//상세보기할 프로젝트의 공개키
		PublicKey project_key = null;
		try {
			project_key = (PublicKey)Base64Conversion.decodeBase64(projectDetail.getPj_publickey());
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 상세보기할 프로젝트의 후원자 수 담을 변수
		int sup_num = 0;
		BlockChain blockChain = getBlockChain();
		/*
		 * 후원자 명수 가져오기
		 * 1. 로컬에서 가져온 블록체인의 사이즈 만큼 for문 돌려서 Block을 뽑아냄
		 * 2. 블럭의 transactions 사이즈만큼 for문을 돌려서 트랜잭션을 뽑아냄
		 * 3. 트랜잭션의 reciepient가 DB에서 가져온 프로젝트의 공개키와 같을경우
		 *    후원자 명 수 ++
		 * 4. projectDetail 맵에 후원자 수 도 put
		 */
		for(int i=0;i<blockChain.blockChain.size();i++) {
			Block block = blockChain.blockChain.get(i);
			for(int j=0;j<block.transactions.size();j++){
				Transaction transaction = block.transactions.get(j);
				if(project_key.equals(transaction.reciepient)) {
					sup_num ++;
				}
			}
		}
		projectDetail.setSupport_num(sup_num);
		
		
		return projectDetail;
	}
	
	//모든, 인기 등등 
	public List<ProjectVO> getDiscoverProjects(String sort) {
		List<ProjectVO> projectList = null;
		if(sort.equals("all")) {
			projectList = putFundedMoney(projectDao.allProjects());
			projectList = getVergeofProejcts(projectList);
		}else if(sort.equals("popular")) {
			projectList = putSupporterNum(projectDao.allProjects());
			projectList = getPopularProjects(projectList);
		}else if(sort.equals("recommnad")) {
			projectList = putFundedMoney(projectDao.recommnadProjects());
		}else if(sort.equals("vergeof")) {
			projectList = putFundedMoney(projectDao.allProjects());
		}else if(sort.equals("new")) {
			projectList = putFundedMoney(projectDao.newProjects());
		}
		return projectList;
	}
	
	//키워드 별로 
	public List<ProjectVO> getKeywordProjects(String keyword) {
		List<ProjectVO> projectList = null;
		projectList = putFundedMoney(projectDao.getKeywordProjects(keyword));
		return projectList;
	}
	
	//카테고리 별로
	public List<ProjectVO> getCategoryProjects(String category) {
		List<ProjectVO> projectList = null;
		projectList = putFundedMoney(projectDao.getCategoryProjects(category));
		return projectList;
	}
	
	public List<ProjectVO> getVergeofProejcts(List<ProjectVO> plist){
		 List<ProjectVO> rlist = new ArrayList<>();
		/*
		 * 파라미터로 받아온 프로젝트에 현재 모인금액까지 넣어둠.
		 */
		for(int i=0; i<plist.size();i++) {
			ProjectVO pVO = plist.get(i);
			double percentage = pVO.getFundedMoney()/pVO.getFd_targetMoney();
			if(percentage >= 0.9) { //90퍼센트 이상일 경우
				rlist.add(pVO);
			}
		}
		return rlist;
	}
	public List<ProjectVO> getPopularProjects(List<ProjectVO> plist){
	    SortProject sortProject = new SortProject();
	    //리스트 전체 넣어서 후원자 많은 순으로 10개만 넣음.
	    plist = sortProject.SortbySupNum(plist); 
		return plist;
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={Exception.class})
	@Pointcut(value="execution(* com.project.*Logic.*(..)")
	public int CreateProject(Map<String, Object> pMap) {
		int result = 0;
		try {
			logger.info(pMap.get("pjo_category_select_result").toString());
			projectDao.projectCode(pMap);
			logger.info(pMap.get("PROJECT_CODE").toString());
			result = projectDao.projectcreate(pMap);
			result = projectDao.storytellinginsert(pMap);
			result = projectDao.pjoutlineinsert(pMap);
			result = projectDao.fundinginsert(pMap);
			//String gift_code = projectDao.giftCode(pMap);
			//logger.info(gift_code);
			result = projectDao.giftinsert(pMap);
			String gop_code = projectDao.giftOptionCode(pMap);
			logger.info(gop_code);
			result = projectDao.giftoptioninsert(pMap);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}
	
}
