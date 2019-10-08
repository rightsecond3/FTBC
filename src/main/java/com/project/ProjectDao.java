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
	

	//퍼블릭키 가져오기 - v
	public String getPublicKey(String mem_email) {
		String publicKey = sqlSessionTemplate.selectOne("getPublicKey",mem_email);
		logger.info(publicKey);
		return publicKey;
	}
	
	//모든 프로젝트  - v
	public List<ProjectVO> allProjects() {
		List<ProjectVO> allProjects = new ArrayList<>();
		allProjects = sqlSessionTemplate.selectList("allProjects");
		return allProjects;
	}
	
	//키워드별 프로젝트 - v
	public List<ProjectVO> getKeywordProjects(String keyword) {
		List<ProjectVO> keywordProjects = new ArrayList<>();
		keywordProjects = sqlSessionTemplate.selectList("keywordProjects",keyword);
		return keywordProjects;
	}
	//카테고리별 프로젝트  - v
	public List<ProjectVO> getCategoryProjects(String category) {
		List<ProjectVO> categoryProjects = new ArrayList<>();
		categoryProjects = sqlSessionTemplate.selectList("categoryProjects",category);
		return categoryProjects;
	}

	//내가 펀딩한 프로젝트 - p
	public List<ProjectVO> getFundedProject(List<String> projectCodes) {
		List<ProjectVO> fundedProject = new ArrayList<>();
		fundedProject = sqlSessionTemplate.selectList("fundedProject",projectCodes);
		return fundedProject;
	}
	//내가 만든 프로젝트 - p
	public List<ProjectVO> getMyProjects(String mem_email) {
		List<ProjectVO> myProjects = new ArrayList<>();
		myProjects = sqlSessionTemplate.selectList("myProjects",mem_email);
		return myProjects;
	}
	//프로젝트 상세보기 - v
	public ProjectVO getProjectDetail(String projectCode) {
		ProjectVO projectDetail =null;
		projectDetail = sqlSessionTemplate.selectOne("projectDetail", projectCode);
		return projectDetail;
	}
	
	//프로젝트 생성하기 - v
	public void projectcreate(Map<String, Object> pMap) {
		sqlSessionTemplate.update("projectcreate",pMap);
	}

	//스토리텔링부분 INSERT - v
	public void storytellinginsert(Map<String, Object> pMap) {
		sqlSessionTemplate.update("storytellinginsert",pMap);
	}
	
	//아웃라인부분 INSERT - v 
	public void pjoutlineinsert(Map<String, Object> pMap) {
		sqlSessionTemplate.update("pjoutlineinsert",pMap);
	}
	
	//펀딩부분 INSERT - p
	public void fundinginsert(Map<String, Object> pMap) {
		sqlSessionTemplate.update("fundinginsert",pMap);
	}
	//?
	public List<ProjectVO> recommnadProjects() {
		List<ProjectVO> recommnadProjects = new ArrayList<>();
		recommnadProjects = sqlSessionTemplate.selectList("allProjects");
		return recommnadProjects;
	}
	//?
	public List<ProjectVO> newProjects() {
		List<ProjectVO> newProjects = new ArrayList<>();
		newProjects = sqlSessionTemplate.selectList("newProjects");
		return newProjects;
	}
	//프로젝트 코드 생성하기 
	public Map<String,Object> projectCode(Map<String, Object> pMap) {
		sqlSessionTemplate.selectOne("proc_procode",pMap);
		return pMap;
	}

	public List<Map<String, Object>> getGift(String projectCode) {
		 List<Map<String, Object>> giftList = new ArrayList<>();
		 giftList = sqlSessionTemplate.selectList("getGift",projectCode);
		return giftList;
	}

	public List<Map<String, Object>> getGiftOption(List<String> giftCode) {
		List<Map<String, Object>> giftOptionList = new ArrayList<>();
		giftOptionList = sqlSessionTemplate.selectList("getGiftOption",giftCode);
		return giftOptionList;
	}



}
