package com.chain;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import blockchain.Block;
import blockchain.BlockChain;
import blockchain.Wallet;
import blockchain.util.Base64Conversion;
import blockchain.util.CommonSet;
import exe.MsgServletThread;
import exe.util.Path;
import exe.util.Protocol;
import vo.MemberVO;


@Service
public class ChainLogic {
	private static final Logger logger = LoggerFactory.getLogger(ChainLogic.class);
	Socket alertSocket = null; // 일정 주기가 지났다고 알리기 위한 소켓
	// 일정 주기 마다 생성되는 블록
	private static Block newBlock = null;
	
	ObjectOutputStream oos = null;
	ObjectInputStream ois = null;
	MsgServletThread mst = null;
	
	@Autowired	
	ChainDao chainDao = null;
	

	//#Socket - 메세지 서버에 커넥션을 맺는 메소드
	public void getConnection() {
		try {
			alertSocket = new Socket(Path.SERVER_IP, Path.MSG_SERVER_PORT);
			oos = new ObjectOutputStream(alertSocket.getOutputStream());
			ois = new ObjectInputStream(alertSocket.getInputStream());
			mst = new MsgServletThread(alertSocket, oos, ois); // 소켓과의 정상적인 종료를 위해
			mst.start();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//#Socket - 메세지 서버에 접속하는데 사용하는 메소드
	public void msgServerConnection(int protocol) {
		try {
			oos.writeObject(protocol
					+Protocol.seperator);
			oos.flush();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}
	//#DB - 결제 시 - 펀딩하는 사람의 공개키가 해당 사람의 것이 맞는 지 확인하는 로직
	public String isPukRight(MemberVO memberVO) {
		String result = chainDao.isPukRight(memberVO);
		return result;
	}
	//#DB- 프로젝트 이름으로 프로젝트 코드, 공개키 가져오기
	public Map<String, Object> getProjectInfo(String project_name) {
		Map<String, Object> rMap = chainDao.getProjectInfo(project_name);
		return rMap;
	}
	/*************************************
	 * 펀딩을 할 때 블록에 트랜잭션을 추가하는 메소드
	 * @param pMap : 화면 단에서 가져온 사용자가 입력한 값
	 * @param rMap : logger.info(rMap.get("PJ_PUBLICKEY").toString());
		             logger.info(rMap.get("PROJECT_CODE").toString());
	 */
	public void addTransaction(Map<String, Object> pMap, Map<String, Object> rMap) {
		CommonSet commonSet = CommonSet.getInstance();
		String item_name = pMap.get("item_name").toString();
		String base64BuyerPuk = pMap.get("pubtxt").toString();
		String base64BuyerPrk = pMap.get("pritxt").toString();
		long amount = Long.parseLong(pMap.get("paid_amount").toString());
		String base64ProjectPuk = rMap.get("PJ_PUBLICKEY").toString();
		String project_code = rMap.get("PROJECT_CODE").toString();
		String upperFolder = project_code.substring(0, project_code.lastIndexOf("_"));  
		logger.info("project_code : "+project_code);
		logger.info("upperFolder : "+upperFolder);
		try {
			String blockchain64 = Base64Conversion.importChain("FTBC", Path.SERVER_CHAIN_PATH);
			BlockChain sharedChain = (BlockChain) Base64Conversion.decodeBase64(blockchain64);
			//## CommonSet의 동기화 처리 문제가 끝나면 CommonSet에서 프로젝트 코드로 가져올 수 있음
			Wallet projectWallet = new Wallet();
			PublicKey projectPuk = (PublicKey) Base64Conversion.decodeBase64(base64ProjectPuk);
			String prkStr = Base64Conversion.importPrivateKey(Path.PROEJCT_WALLET_PATH+upperFolder+"\\"+project_code+"\\", project_code);
			PrivateKey projectPrk = (PrivateKey) Base64Conversion.decodeBase64(prkStr);
			projectWallet.setPublicKey(projectPuk);
			projectWallet.setPrivateKey(projectPrk);
			
			Wallet buyerWallet = new Wallet();
			PublicKey buyerPuk = (PublicKey) Base64Conversion.decodeBase64(base64BuyerPuk);
			PrivateKey buyerPrk = (PrivateKey) Base64Conversion.decodeBase64(base64BuyerPrk);
			buyerWallet.setPublicKey(buyerPuk);
			buyerWallet.setPrivateKey(buyerPrk);
			
			//# 트랜잭션 추가 시작
			Wallet managerWallet = commonSet.getManagerWallet();
			newBlock.addTransaction(sharedChain, managerWallet.sendFunds(sharedChain, buyerPuk, "충전", amount));
			newBlock.addTransaction(sharedChain, buyerWallet.sendFunds(sharedChain, projectPuk, item_name, amount));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void addBlock(int cnt) {
		logger.info("addBlock 호출");
		try {
			String chainBase64 = Base64Conversion.importChain("FTBC", Path.SERVER_CHAIN_PATH);
			BlockChain sharedChain = (BlockChain) Base64Conversion.decodeBase64(chainBase64);
			logger.info("전 블록체인 사이즈 : "+sharedChain.blockChain.size());
			if(cnt != 0) {
				sharedChain.addBlock(newBlock);
				logger.info("후 블록체인 사이즈 : "+sharedChain.blockChain.size());
			}
			newBlock = new Block(sharedChain.blockChain.get(sharedChain.blockChain.size()-1).hash);
			// 블록이 에드 된 체인 다운로드
			String sharedBase64 = Base64Conversion.encodeChain(sharedChain);
			Base64Conversion.saveChain(sharedBase64, Path.SERVER_CHAIN_PATH, "FTBC");
			// 추가된 체인 다운로드
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public BlockChain getBlockChainInfo() {
		BlockChain blockChain = null;
		logger.info("getBlockChainInfo 호출");
		try {
			String chainBase64 = Base64Conversion.importChain("FTBC", Path.SERVER_CHAIN_PATH);
			blockChain = (BlockChain) Base64Conversion.decodeBase64(chainBase64);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blockChain;
	}
	public Block getBlockDetail(int num) {
		logger.info("getBlockDetail 호출 " + num);
		Block block = null;
		try {
			String chainBase64 = Base64Conversion.importChain("FTBC", Path.SERVER_CHAIN_PATH);
			BlockChain blockChain = (BlockChain) Base64Conversion.decodeBase64(chainBase64);
			block = blockChain.blockChain.get(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return block;
	}
}
