package com.chain;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import blockchain.Block;
import blockchain.BlockChain;
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
	
	@RequestMapping(value="getBlockChainInfo")
	public String getBlockChainInfo(Model mod) throws Exception {
		logger.info("getBlockChainInfo 호출");
		BlockChain blockChain = chainLogic.getBlockChainInfo();
		mod.addAttribute("blockChain", blockChain);
		return "forward:/FTBC_BlockChainView/BlockChain_List.jsp";
	}
	
	@RequestMapping(value="BlockDetail")
	public String BlockDetail(@RequestParam int num, Model mod) throws Exception {
		logger.info("BlockDetail 호출" + num);
		Block block = chainLogic.getBlockDetail(num);
		logger.info("Block " + block);
		logger.info("Block " + block.hash);
		mod.addAttribute("block", block);
		return "forward:/FTBC_BlockChainView/Block_Detail.jsp";
	}

}
