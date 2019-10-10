package com.project;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import blockchain.BlockChain;
import blockchain.Project;
import blockchain.util.Base64Conversion;
import blockchain.util.CommonSet;
import vo.ProjectVO;


@Controller
@RequestMapping("/Project/*")
public class ProjectController  {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	@Autowired
	ProjectLogic projectLogic = null;
	
	@GetMapping(value="getFundedProjects")
	public String getFundedPProject(@RequestParam String mem_email, Model mod) {
		//내가 펀딩한 프로젝트
		logger.info(" getFundedProject 호출");
		List<ProjectVO> fundedProjects = projectLogic.getFundedProjects(mem_email);
		mod.addAttribute("FundedProjects",fundedProjects);
		return "forward:FTBC_FundedProjectList.jsp";
		
	}
	
	@GetMapping(value="getMyProjects")
	public String getMyProject(@RequestParam String mem_email, Model mod) {
		//내가 만든 프로젝트 
		logger.info(" getMyProject 호출");
		List<ProjectVO> myProjects = projectLogic.getMyProjects(mem_email);
		mod.addAttribute("myProjects",myProjects);
		
		return "forward:FTBC_myProjectList.jsp";
		
	}
	
	@GetMapping(value="getMainProjects")
	public String getMainProject(Model mod) {
		//메인뷰에 뿌릴  인기, 추천, 성공임박 프로젝트 
		logger.info("내가 펀딩한 프로젝트 getMainProject 호출");
		Map<String, Object> mainProjects = projectLogic.getMainProjects();
		mod.addAttribute("mainProjects",mainProjects);
		return  "forward:/FTBC_MainView/FTBC_MainList.jsp";
	}
	
	@GetMapping(value="projectDetail")
	public String getProjectDetail(@RequestParam String projectCode, Model mod) {
		//프로젝트 상세보기
		logger.info("projectDetail 호출");
		ProjectVO projectDetail = projectLogic.getProjectDetail(projectCode);
		mod.addAttribute("projectDetail", projectDetail);
		return "forward:/FTBC_DetailView/ProjectDetailList.jsp";
		
	}
	
	@GetMapping(value="getDiscoverProjects")
	public String getDiscoverProjects(@RequestParam String sort , Model mod) {
		//모든, 인기, 성공임박, 새로운 프로젝트 페이지에 뿌릴
		logger.info("getDiscoverProjects 호출");
		List<ProjectVO> projectList = projectLogic.getDiscoverProjects(sort);
		mod.addAttribute("projectList", projectList);
		return "forward:Discover_ProjectList.jsp";
	}
	
	@GetMapping(value="getKeywordProjects")
	public String getKeywordProjects(@RequestParam String Keyword, Model mod) {
		logger.info("getKeywordProjects 호출");
		//검색한 키워드로 
		List<ProjectVO> projectList = projectLogic.getKeywordProjects(Keyword);
		mod.addAttribute("projectList", projectList);
		mod.addAttribute("keyword",Keyword);
		return "forward:/FTBC_LookView/Keyword_ProjectList.jsp";
	}
	
	@GetMapping(value="getCategoryProjects")
	public String getCategoryProjects(@RequestParam Map<String,Object> pMap, Model mod) {
		logger.info("getCategoryProjects 호출");
		//카테고리 별로 
		List<ProjectVO> projectList = projectLogic.getCategoryProjects(pMap);
		String cat = null;
		if(pMap.get("subcat_name").equals("undefined")) {
			cat = pMap.get("maincat_name").toString();
		}else {
			cat = pMap.get("subcat_name").toString();
		}
		mod.addAttribute("cat",cat);
		mod.addAttribute("projectList", projectList);
		return "forward:/FTBC_LookView/Category_ProjectList.jsp";
	}
}
