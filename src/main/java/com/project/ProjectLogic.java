package com.project;

import java.io.IOException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.management.RuntimeErrorException;

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
import blockchain.Transaction;
import blockchain.Wallet;
import blockchain.util.Base64Conversion;
import blockchain.util.CommonSet;
import exe.util.Path;
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
			String blockchain64 = Base64Conversion.importChain("FTBC", Path.SERVER_CHAIN_PATH);
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
						if(transaction.recipient.equals(publicKey)) {
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
				logger.info("펀딩 금액"+fundedMoney);
				// end of projectWallets keys for
				pVO.setFundedMoney(fundedMoney);
			}
			// end of projectList for
			return projectList;
		}
		// end of putFundedMoney
		
	//펀딩금액 집어넣기	
	public List<ProjectVO> getFundedMoney(List<ProjectVO> vergeofProjects) {
		BlockChain blockChain = getBlockChain();
		int value = 0;
		Map<String,Integer> code = new HashMap<String, Integer>();
		for(int z=0;z<vergeofProjects.size();z++) {
			if(vergeofProjects.get(z).getProject_code()!=null) {
				PublicKey project_key = null; 
				try { 
					project_key =
							(PublicKey)Base64Conversion.decodeBase64(vergeofProjects.get(z).getPj_publickey());
				}catch (Exception e) { 
					e.printStackTrace(); 
				}
				int sup_num = 0;
				for(int i=0;i<blockChain.blockChain.size();i++) {
					Block block = blockChain.blockChain.get(i);
					for(int j=0;j<block.transactions.size();j++){
						Transaction transaction = block.transactions.get(j);
						if(project_key.equals(transaction.recipient)) {
							value += transaction.value;
							sup_num ++;
						}
					}
				}
				String target = (vergeofProjects.get(z).getFd_targetMoney()).replace(",", "");
				vergeofProjects.get(z).setFundedMoney(value);;
				vergeofProjects.get(z).setFd_targetMoney(target);
				vergeofProjects.get(z).setSupport_num(sup_num);
				int success = (int)((Double.valueOf(value)/Integer.parseInt(target))*100);
				vergeofProjects.get(z).setSuccessMoney(success);
				
				value = 0;
			}
		}
		vergeofProjects = getOutLint(vergeofProjects);
		return vergeofProjects;
	}
	//남은 날짜 집어 넣기
	public List<ProjectVO> getOutLint(List<ProjectVO> pjoList){
		Map<String,Integer> code = new HashMap<String, Integer>();
		for(int i=0;i<pjoList.size();i++) {
			if(pjoList.get(i).getFd_deadLine()!=null) {
				  
		        String proDate = pjoList.get(i).getFd_deadLine();
		        String strFormat = "yyyy-MM-dd";    //strStartDate 와 strEndDate 의 format
		        Date time = new Date();
		        //SimpleDateFormat 을 이용하여 startDate와 endDate의 Date 객체를 생성한다.
		        SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
		        String nowDate = sdf.format(time);
		        long diffDay = 0;
		        try{
		            Date startDate = sdf.parse(proDate);
		            Date endDate = sdf.parse(nowDate);
		            
		            //두날짜 사이의 시간 차이(ms)를 하루 동안의 ms(24시*60분*60초*1000밀리초) 로 나눈다.
		            diffDay = (startDate.getTime() - endDate.getTime()) / (24*60*60*1000);
		        }catch(ParseException e){
		            e.printStackTrace();
		        }	 
		        pjoList.get(i).setOutLine(diffDay);
			}
		}
		return pjoList;
	}
	//메인 페이지에 뿌릴 프로젝트들 가져오기 
	public Map<String, Object>getMainProjects() {
		Map<String, Object> mainProjects = new HashMap<>();
		List<Map<String,Object>> proCodes = projectDao.getProjectCodes();
		SortProject st = new SortProject();
		//인기 프로젝트 가져오기
		List<ProjectVO> popularProjects =st.SortbySupNum(popularProjects(proCodes,4));
		//마감 임박순 프로젝트
		List<ProjectVO> recommnadProjects = st.SortbyOut(recommnadProjects(proCodes,4)); 
		//펀딩 완료 임박 프로젝트
		List<ProjectVO> vergeofProjects = st.SortbySuccess(vergeofProjects(proCodes,4));
		
		mainProjects.put("popularProject", popularProjects);
		mainProjects.put("recommnadProject", recommnadProjects);
		mainProjects.put("vergeofProject", vergeofProjects);
		return mainProjects;
	}
	//성공 임박순 비교
	private List<ProjectVO> vergeofProjects(List<Map<String, Object>> proCodes, int k) {
		BlockChain blockChain = getBlockChain();
		int value = 0;
		Map<String,Integer> code = new HashMap<String, Integer>();
		for(int z=0;z<proCodes.size();z++) {
			if(proCodes.get(z).get("PJ_PUBLICKEY")!=null) {
				PublicKey project_key = null; 
				try { 
					project_key =
							(PublicKey)Base64Conversion.decodeBase64(proCodes.get(z).get("PJ_PUBLICKEY").toString());
				}catch (Exception e) { 
					e.printStackTrace(); 
				}
				for(int i=0;i<blockChain.blockChain.size();i++) {
					Block block = blockChain.blockChain.get(i);
					for(int j=0;j<block.transactions.size();j++){
						Transaction transaction = block.transactions.get(j);
						if(project_key.equals(transaction.recipient)) {
							value += transaction.value;
						}
					}
				}
				String target = (proCodes.get(z).get("FD_TARGETMONEY").toString()).replace(",", "");
				int success = (int)((Double.valueOf(value)/Integer.parseInt(target))*100);
				if(success>0) {
					code.put(proCodes.get(z).get("PROJECT_CODE").toString(),success);
				}
				value = 0;
			}
		}
		List<Map.Entry<String, Integer>> list = new LinkedList<>(code.entrySet());
        
        Collections.sort(list, new Comparator<Map.Entry<String, Integer>>() {
            @Override
            public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
                int comparision = (o2.getValue() - o1.getValue()) * -1;
                return comparision == 0 ? o2.getKey().compareTo(o1.getKey()) : comparision;
            }
        });
        
        // 순서유지를 위해 LinkedHashMap을 사용
        List<String> sorteList = new LinkedList<String>();
        for(Iterator<Map.Entry<String, Integer>> iter = list.iterator(); iter.hasNext();){
            Map.Entry<String, Integer> entry = iter.next();
            sorteList.add(entry.getKey());
        }
        if(k>1) {
	        for(int i=3;i<sorteList.size();i++) {
	        	sorteList.remove(4);
	        }
        }
        List<ProjectVO> vergeofProjects =projectDao.getProject(sorteList);
        vergeofProjects = getFundedMoney(vergeofProjects);
        return vergeofProjects;
	}
	//마감 임박순 프로젝트 나열
	private List<ProjectVO> recommnadProjects(List<Map<String, Object>> proCodes, int k) {
		BlockChain blockChain = getBlockChain();
		Map<String,Integer> code = new HashMap<String, Integer>();
		for(int i=0;i<proCodes.size();i++) {
			if(proCodes.get(i).get("FD_DEADLINE")!=null) {
				logger.info("날짜 : "+proCodes.get(i).get("FD_DEADLINE"));
				  
		        String proDate = proCodes.get(i).get("FD_DEADLINE").toString();
		        String strFormat = "yyyy-MM-dd";    //strStartDate 와 strEndDate 의 format
		        Date time = new Date();
		        //SimpleDateFormat 을 이용하여 startDate와 endDate의 Date 객체를 생성한다.
		        SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
		        String nowDate = sdf.format(time);
		        long diffDay = 0;
		        try{
		            Date startDate = sdf.parse(proDate);
		            Date endDate = sdf.parse(nowDate);
		            
		            //두날짜 사이의 시간 차이(ms)를 하루 동안의 ms(24시*60분*60초*1000밀리초) 로 나눈다.
		            diffDay = (startDate.getTime() - endDate.getTime()) / (24*60*60*1000);
		        }catch(ParseException e){
		            e.printStackTrace();
		        }	 
		        code.put(proCodes.get(i).get("PROJECT_CODE").toString(),(int) diffDay);
			}
		}
		List<Map.Entry<String, Integer>> list = new LinkedList<>(code.entrySet());
        
        Collections.sort(list, new Comparator<Map.Entry<String, Integer>>() {
            @Override
            public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
                int comparision = (o1.getValue() - o2.getValue()) * -1;
                return comparision == 0 ? o1.getKey().compareTo(o2.getKey()) : comparision;
            }
        });
        
        // 순서유지를 위해 LinkedHashMap을 사용
        List<String> sorteList = new LinkedList<String>();
        for(Iterator<Map.Entry<String, Integer>> iter = list.iterator(); iter.hasNext();){
            Map.Entry<String, Integer> entry = iter.next();
            sorteList.add(entry.getKey());
        }
        if(k>1) {
	        for(int i=3;i<sorteList.size();i++) {
	        	sorteList.remove(4);
	        }
        }
        logger.info("sort 뭐야? : "+sorteList);
        List<ProjectVO> recommnadProjects =projectDao.getProject(sorteList);
        recommnadProjects = getFundedMoney(recommnadProjects);
		return recommnadProjects;
		}

	////////////////////인기있는 프로젝트 4개 뽑기
	///////pj_publickey null체크하고 넘길것
	private List<ProjectVO> popularProjects(List<Map<String, Object>> proCodes, int k) {
		BlockChain blockChain = getBlockChain();
		int sup_num = 0;
		Map<String,Integer> code = new HashMap<String, Integer>();
		for(int z=0;z<proCodes.size();z++) {
			if(proCodes.get(z).get("PJ_PUBLICKEY")!=null) {
				PublicKey project_key = null; 
				try { 
					project_key =
							(PublicKey)Base64Conversion.decodeBase64(proCodes.get(z).get("PJ_PUBLICKEY").toString());
				}catch (Exception e) { 
					e.printStackTrace(); 
				}
				for(int i=0;i<blockChain.blockChain.size();i++) {
					Block block = blockChain.blockChain.get(i);
					for(int j=0;j<block.transactions.size();j++){
						Transaction transaction = block.transactions.get(j);
						if(project_key.equals(transaction.recipient)) {
							sup_num ++;
						}
					}
				}
				code.put(proCodes.get(z).get("PROJECT_CODE").toString(),sup_num);
				sup_num = 0;
			}
		}
	    List<Map.Entry<String, Integer>> list = new LinkedList<>(code.entrySet());
        
        Collections.sort(list, new Comparator<Map.Entry<String, Integer>>() {
            @Override
            public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
                int comparision = (o1.getValue() - o2.getValue()) * -1;
                return comparision == 0 ? o1.getKey().compareTo(o2.getKey()) : comparision;
            }
        });
        
        // 순서유지를 위해 LinkedHashMap을 사용
        List<String> sorteList = new LinkedList<String>();
        for(Iterator<Map.Entry<String, Integer>> iter = list.iterator(); iter.hasNext();){
            Map.Entry<String, Integer> entry = iter.next();
           	logger.info("key set : "+entry.getKey());
            sorteList.add(entry.getKey());
        }
        if(k>1) {
	        for(int i=3;i<sorteList.size();i++) {
	        	sorteList.remove(4);
	        }
        }
        logger.info("????"+sorteList);
        List<ProjectVO> popularProjects =projectDao.getProject(sorteList);
        popularProjects = getFundedMoney(popularProjects);
        return popularProjects;
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
					funded_publicKey = transaction.recipient;
					Object keys[] = commonset.projectWallets.keySet().toArray();
					for(int k=0;k<keys.length;k++) {
						if(funded_publicKey.equals(commonset.projectWallets.get(keys[k]))) {
							String projectCode = commonset.projectWallets.get(keys[k]).toString();
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
	
	public ProjectVO getProjectDetail(String projectCode) {
		ProjectVO projectDetail =null;
		projectDetail = projectDao.getProjectDetail(projectCode);
		//상세보기할 프로젝트의 공개키
		
		PublicKey project_key = null; 
		try { 
			project_key =
		(PublicKey)Base64Conversion.decodeBase64(projectDetail.getPj_publickey());
		}catch (Exception e) { 
			e.printStackTrace(); 
		}
		logger.info("프로젝트 키  :  "+project_key);
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
		
		logger.info("block : "+blockChain.blockChain.get(0).transactions.get(0).recipient);
		for(int i=0;i<blockChain.blockChain.size();i++) {
			Block block = blockChain.blockChain.get(i);
			for(int j=0;j<block.transactions.size();j++){
				Transaction transaction = block.transactions.get(j);
				if(project_key.equals(transaction.recipient)) {
					sup_num ++;
				}
			}
		}
		logger.info("펀딩한 인원: "+sup_num);
		List<Map<String,Object>> giftList = new ArrayList<>();
		giftList = projectDao.getGift(projectCode);
		List<String> giftCode = new ArrayList<>();
		for(int i = 0 ; i < giftList.size();i++) {
			Map<String,Object> gift = new HashMap<String, Object>();
			gift = giftList.get(i);
			giftCode.add(gift.get("GIFT_CODE").toString());
		}
		if(giftCode.size()>0) {
			logger.info("gift : "+giftCode);
			List<Map<String,Object>> giftOptionList = new ArrayList<>();
			giftOptionList = projectDao.getGiftOption(giftCode);
		}
		projectDetail.setSupport_num(sup_num);
		
		return projectDetail;
	}
	
	//모든, 인기 등등 
	public List<ProjectVO> getDiscoverProjects(String sort) {
		List<ProjectVO> projectList = null;
		List<Map<String,Object>> proCodes = projectDao.getProjectCodes();
		SortProject st = new SortProject();
		if(sort.equals("all")) {
			projectList = projectDao.getAllProject();
			projectList = getFundedMoney(projectList);
			//projectList = getVergeofProejcts(projectList);
		}else if(sort.equals("popular")) {//인기순
			projectList = st.SortbySupNum(popularProjects(proCodes,0));
		}else if(sort.equals("recommnad")) {//마감 임박
			projectList = st.SortbyOut(recommnadProjects(proCodes,0));
		}else if(sort.equals("vergeof")) {
			projectList = st.SortbySuccess(vergeofProjects(proCodes,0));
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
	public List<ProjectVO> getCategoryProjects(Map<String, Object> pMap) {
		List<ProjectVO> projectList = null;
		projectList = putFundedMoney(projectDao.getCategoryProjects(pMap));
		return projectList;
	}
	
	public List<ProjectVO> getVergeofProejcts(List<ProjectVO> plist){
		 List<ProjectVO> rlist = new ArrayList<>();
		/*
		 * 파라미터로 받아온 프로젝트에 현재 모인금액까지 넣어둠.
		 */
		/*
		 * for(int i=0; i<plist.size();i++) { ProjectVO pVO = plist.get(i); double
		 * percentage = pVO.getFundedMoney()/pVO.getFd_targetMoney(); if(percentage >=
		 * 0.9) { //90퍼센트 이상일 경우 rlist.add(pVO); } }
		 */
		return rlist;
	}
	public List<ProjectVO> getPopularProjects(List<ProjectVO> plist){
	    SortProject sortProject = new SortProject();
	    //리스트 전체 넣어서 후원자 많은 순으로 10개만 넣음.
	    plist = sortProject.SortbySupNum(plist); 
		return plist;
		
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor= {Exception.class})
	   @Pointcut(value="execution(* com.project.*Logic.*(..)")
	   public int CreateProject(Map<String, Object> pMap) throws Exception{
	      int result = 0;
	      logger.info("email :"+pMap.get("mem_email").toString());
	      try {
	         projectDao.projectCode(pMap);
	         String publickey =null;
	         CommonSet commonset = CommonSet.getInstance();
	         publickey = commonset.createProject(pMap.get("PROJECT_CODE").toString());
	         pMap.put("PJ_PUBLICKEY",publickey); 
	         projectDao.projectcreate(pMap); 
	         projectDao.storytellinginsert(pMap);
	         projectDao.pjoutlineinsert(pMap); 
	         projectDao.fundinginsert(pMap); 
	         projectDao.giftinsert(pMap);
	         projectDao.giftupdate(pMap);
	         projectDao.gopCodeInsert(pMap);
	         projectDao.gopInsert(pMap);
	         projectDao.projectcreate(pMap);//일단 무결성띄워서 롤백시키도록 하려고.
	      } catch (Exception e) {
	         throw e;
	      }
	      return result;
	   }
	
}
