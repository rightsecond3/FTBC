package com.chain;

import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.HashMap;
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
import vo.MemberVO;

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
		String item_name = pMap.get("item_name").toString();
		String project_name = pMap.get("p_title").toString();
		String buyer_name = pMap.get("buyer_name").toString();
		String base64Puk = pMap.get("pubtxt").toString();
		String base64Prk = pMap.get("pritxt").toString();
		
		//사용자 로컬에서 블록체인 파일 import해옴
		// ㄴ>?? 공유 체인을 import 해옴 
		String blockchain64 = Base64Conversion.importChain("FTBC", Path.SERVER_CHAIN_PATH);
			
		//blockchain, publickey, privatekey 디코딩. chain도  import해도 됨.
		BlockChain blockChain = (BlockChain) Base64Conversion.decodeBase64(blockchain64);
		// 화면에서 받아온 base64로 인코딩된 문자열을 받아 디코딩
		
		//펀딩하는 사람 임시 지갑
		Wallet tempWallet = new Wallet();
		
		//펀딩 금액
		long amount = Long.parseLong(pMap.get("paid_amount").toString());
		
		//펀딩하는 프로젝트의 키
		CommonSet commonSet = CommonSet.getInstance();

		//#DB- 프로젝트 이름으로 프로젝트 코드, 공개키 가져오기
		logger.info("userPuk : "+base64Puk);
		logger.info("userPrk : "+base64Prk);
		logger.info("item_name : "+item_name);
		logger.info("project_name : "+project_name);
        Map<String, Object> rMap = chainLogic.getProjectInfo(project_name);
		logger.info(rMap.get("PJ_PUBLICKEY").toString());
		logger.info(rMap.get("PROJECT_CODE").toString());
		
//		Wallet projectWallet = commonSet.getProjectWallet("프로젝트 코드");
		//##- 서버기동 시 가져오는 것으로 해야함.
		Wallet projectWallet = new Wallet();
		/*
		Base64Conversion.
		projectWallet.setPublicKey();
		PublicKey projectPuk =  projectWallet.getPublicKey();
		
		//// [거래가 일어날 때 마다 newBlock에 addTransaction] ////
		Block block = newBlock; //생성되어있는 블록 가져와야함
		
		
		Wallet managerWallet = commonSet.getManagerWallet(); //genesisblock 만들때 generate keypair 해줘야함.
		
		//매니저 -> 펀딩하는 사람
		block.addTransaction(blockChain, managerWallet.sendFunds(blockChain, userPuk, "충전", amount));
		
		//펀딩하는 사람 -> 프로젝트
		block.addTransaction(blockChain, tempWallet.sendFunds(blockChain, projectPuk, project_key, amount));
		*/
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
