package com.project;

import java.security.PublicKey;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ProjectVO;

/*
 * 
 */
@Repository
public class ProjectDao {
	private static final Logger logger = LoggerFactory.getLogger(ProjectDao.class);
	
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate = null;
	

	//퍼블릭키 가져오기
	public String getPublicKey(String mem_email) {
		String publicKey = sqlSessionTemplate.selectOne("getPublicKey",mem_email);
		return publicKey;
	}
	
	//모든 프로젝트 
	public List<ProjectVO> allProjects() {
		List<ProjectVO> allProjects = new ArrayList<>();
		allProjects = sqlSessionTemplate.selectList("allProjects");
		return allProjects;
	}
	
	//키워드별 프로젝트
	public List<ProjectVO> getKeywordProjects(String keyword) {
		List<ProjectVO> keywordProjects = new ArrayList<>();
		keywordProjects = sqlSessionTemplate.selectList("keywordProjects",keyword);
		return keywordProjects;
	}
	//카테고리별 프로젝트
	public List<ProjectVO> getCategoryProjects(String category) {
		List<ProjectVO> categoryProjects = new ArrayList<>();
		categoryProjects = sqlSessionTemplate.selectList("categoryProjects",category);
		return categoryProjects;
	}

	//내가 펀딩한 프로젝트
	public List<ProjectVO> getFundedProject(List<String> projectCodes) {
		List<ProjectVO> fundedProject = new ArrayList<>();
		fundedProject = sqlSessionTemplate.selectList("fundedProject",projectCodes);
		return fundedProject;
	}
	//내가 만든 프로젝트
	public List<ProjectVO> getMyProjects(String mem_email) {
		List<ProjectVO> myProjects = new ArrayList<>();
		myProjects = sqlSessionTemplate.selectList("myProjects",mem_email);
		return myProjects;
	}
	//프로젝트 상세보기
	public ProjectVO getProjectDetail(String projectCode) {
		ProjectVO pVO = new ProjectVO();
		pVO = sqlSessionTemplate.selectOne("projectDetail", projectCode);
		return pVO;
	}
	
	//프로젝트 생성하기
	public int projectcreate(Map<String, Object> pMap) {
		int result = 0;
		pMap.put("pjo_category_select_result", "A01");
		sqlSessionTemplate.update("projectcreate",pMap);
		return result;
	}

	//스토리텔링부분 INSERT
	public int storytellinginsert(Map<String, Object> pMap) {
		int result = 0;
		sqlSessionTemplate.update("storytellinginsert",pMap);
		return result;
	}
	
	//아웃라인부분 INSERT
	public int pjoutlineinsert(Map<String, Object> pMap) {
		int result = 0;
		sqlSessionTemplate.update("pjoutlineinsert",pMap);
		return result;
	}
	
	//펀딩부분 INSERT
	public int fundinginsert(Map<String, Object> pMap) {
		int result = 0;
		sqlSessionTemplate.update("fundinginsert",pMap);
		return result;
	}
	//선물부분 INSERT
	public int giftinsert(Map<String, Object> pMap) {
		int result = 0;
		Map<String,Object> paramMap = new HashMap<>();
		List<Map<String,Object>> lMap = new ArrayList<>();
		Map<String,Object> rMap = new HashMap<>();
		for(int i=0;i<10;i++) {
			if(pMap.get("minDonationMoneyOutput"+i)!=null) {
		rMap.put("PROJECT_CODE", pMap.get("PROJECT_CODE").toString());
		sqlSessionTemplate.selectOne("proc_giftcode",pMap);
		rMap.put("gift_code",pMap.get("gift_code").toString());
		rMap.put("minDonationMoneyOutput", pMap.get("minDonationMoneyOutput"+i).toString());
		rMap.put("giftTextAreaOutput", pMap.get("giftTextAreaOutput"+i).toString());
		rMap.put("deliveryDayOutput", pMap.get("deliveryDayOutput"+i).toString());
		rMap.put("limitedQuantityInput", pMap.get("limitedQuantityInput"+i).toString());
		rMap.put("gift_isinclude", pMap.get("gift_isinclude").toString());
		lMap.add(rMap);
			}
			else {
				break;
			}
		}
		paramMap.put("paramMap", lMap);
		sqlSessionTemplate.update("giftinsert",paramMap);
		
		//listMap = pMap
		return result;
	}
	//상품옵션부분 INSERT
	public int giftoptioninsert(Map<String, Object> pMap) {
		int result = 0;
		sqlSessionTemplate.update("giftoptioninsert",pMap);
		return result;
	}
	
	public List<ProjectVO> recommnadProjects() {
		List<ProjectVO> recommnadProjects = new ArrayList<>();
		recommnadProjects = sqlSessionTemplate.selectList("recommnadProjects");
		return recommnadProjects;
	}

	public List<ProjectVO> newProjects() {
		List<ProjectVO> newProjects = new ArrayList<>();
		newProjects = sqlSessionTemplate.selectList("newProjects");
		return newProjects;
	}

	public String projectCode(Map<String, Object> pMap) {
		String procCode =null;
		pMap.put("pjo_category_select_result", "A01");
		pMap = sqlSessionTemplate.selectOne("proc_procode",pMap);
		return procCode;
	}

	public String giftCode(Map<String, Object> pMap) {
		String gift_code = null;
		sqlSessionTemplate.selectOne("proc_giftcode",pMap);
		return gift_code;
	}

	public String giftOptionCode(Map<String, Object> pMap) {
		String gop_code = null;
		gop_code = sqlSessionTemplate.selectOne("proc_giftoption",pMap);
		return gop_code;
	}




}
