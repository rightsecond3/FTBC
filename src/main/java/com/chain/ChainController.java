package com.chain;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import blockchain.util.StringUtil;

@Controller
@RequestMapping("/chain/*")
public class ChainController {
	private static final Logger logger = LoggerFactory.getLogger(ChainController.class);
	
	@Autowired
	ChainLogic chainLogic = null;
	StringUtil stringUtil = null;
	
	@RequestMapping(value="addTransaction")
	public String addTransaction(@RequestParam Map<String,Object> pMap) throws Exception {
		logger.info("addTransaction 호출");
		//#DB- 프로젝트 이름으로 프로젝트 코드, 공개키 가져오기, 개인키
		String project_name = pMap.get("p_title").toString();
		Map<String, Object> rMap = chainLogic.getProjectInfo(project_name);
		chainLogic.addTransaction(pMap, rMap);
		return "redirect:Fund_Success.jsp";
	}

}
