package com.project;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/Project")
public class RestProjectController {
	private static final Logger logger = LoggerFactory.getLogger(RestProjectController.class);

	@Autowired
	ProjectLogic projectLogic = null;
	@PostMapping("createProject.ftbc")
	public String CreateProject(@RequestParam Map<String,Object> pMap) {
		int result = 0;
		logger.info("rest컨트롤러 도착");
		logger.info(pMap.toString());
		logger.info(pMap.get("editordata").toString());
		logger.info(pMap.get("long_title").toString());
		result = projectLogic.CreateProject(pMap);
		if(result==0) {
		return "forward:FTBC_Main.jsp";
		}else{
			return "forward:CreateProjectLayout.jsp";
		}
	}
}
