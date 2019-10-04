package com.chain;

import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import blockchain.Block;
import blockchain.BlockChain;
import blockchain.Wallet;
import blockchain.util.Base64Conversion;
import blockchain.util.CommonSet;
import blockchain.util.StringUtil;
import exe.util.Path;
import exe.util.Protocol;

@Controller
@RequestMapping("/chain/*")
public class ChainController {
	private static final Logger logger = LoggerFactory.getLogger(ChainController.class);
	
	@Autowired
	ChainLogic chainLogic = null;
	// 5분 마다 생성되는 블록
	StringUtil stringUtil = null;
	private static int cnt;
	// 5분 마다 생성되는 블록
	private static Block newBlock = null;
	
	@RequestMapping(value="addTransaction")
	public String addTransaction(@RequestParam Map<String,Object> pMap) throws Exception {
		logger.info("addTransaction 호출");
		//#DB- 프로젝트 이름으로 프로젝트 코드, 공개키 가져오기, 개인키
		String project_name = pMap.get("p_title").toString();
		Map<String, Object> rMap = chainLogic.getProjectInfo(project_name);
		chainLogic.addTransaction(newBlock, pMap, rMap);
		//// [거래가 일어날 때 마다 newBlock에 addTransaction] ////
		return "redirect:Fund_Success.jsp";
	}
	
	@RequestMapping(value="majorityStart")
	public String majorityStart() {
		logger.info("majorityStart 호출");
		chainLogic.getConnection();
		chainLogic.msgServerConnection(Protocol.ALERT_ADD_BLOCK);
		return "redirect:/FTBC_Test/TimeTest.jsp";
	}
	
	@RequestMapping(value="addBlock")
	public String addBlock() {
		try {
			logger.info("addBlock 호출");
			String chainBase64 = Base64Conversion.importChain("FTBC", Path.SERVER_CHAIN_PATH);
			BlockChain sharedChain = (BlockChain) Base64Conversion.decodeBase64(chainBase64);
			logger.info("전 블록체인 사이즈 : "+sharedChain.blockChain.size());
			if(cnt != 0) {
				sharedChain.addBlock(newBlock);
			}
			logger.info("후 블록체인 사이즈 : "+sharedChain.blockChain.size());
			newBlock = new Block(sharedChain.blockChain.get(sharedChain.blockChain.size()-1).hash);
			// 블록이 애드된 놈 다운로드
			String sharedBase64 = Base64Conversion.encodeChain(sharedChain);
			Base64Conversion.saveChain(sharedBase64, Path.SERVER_CHAIN_PATH, "FTBC");
			// 추가된 최신 체인 다운로드 시키기
			chainLogic.getConnection();
			chainLogic.msgServerConnection(Protocol.AUTOSYNC_CHAIN_DOWNLOAD_ALERT);
			if(cnt<1) {
				cnt++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/FTBC_Test/TimeTest.jsp";
	}
}
