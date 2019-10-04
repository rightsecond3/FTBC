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
	ObjectOutputStream oos = null;
	ObjectInputStream ois = null;
	MsgServletThread mst = null;
	
	@Autowired	
	ChainDao chainDao = null;
	

	//# 메세지 서버에 커넥션을 맺는 메소드
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
	 * @param newBlock
	 * @param pMap : 화면 단에서 가져온 사용자가 입력한 값
	 * @param rMap : logger.info(rMap.get("PJ_PUBLICKEY").toString());
		             logger.info(rMap.get("PROJECT_CODE").toString());
	 */
	public void addTransaction(Block newBlock, Map<String, Object> pMap, Map<String, Object> rMap) {
		CommonSet commonSet = CommonSet.getInstance();
		String item_name = pMap.get("item_name").toString();
		String base64BuyerPuk = pMap.get("pubtxt").toString();
		String base64BuyerPrk = pMap.get("pritxt").toString();
		String base64ProjectPuk = rMap.get("PJ_PUBLICKEY").toString();
		long amount = Long.parseLong(pMap.get("paid_amount").toString());
		logger.info("item_name : "+item_name);
		logger.info("amount : "+amount);
		logger.info("base64BuyerPuk : "+base64BuyerPuk);
		logger.info("base64BuyerPrk : "+base64BuyerPrk);
		
		try {
			String blockchain64 = Base64Conversion.importChain("FTBC", Path.SERVER_CHAIN_PATH);
			BlockChain blockChain = (BlockChain) Base64Conversion.decodeBase64(blockchain64);
			//## CommonSet의 동기화 처리 문제가 끝나면 CommonSet에서 프로젝트 코드로 가져올 수 있음
			Wallet projectWallet = new Wallet();
			PublicKey projectPuk = (PublicKey) Base64Conversion.decodeBase64(base64ProjectPuk);
			String prkStr = Base64Conversion.importPrivateKey("C:\\FTBC_server\\keys\\project\\A01\\A01_1\\", "A01_1");
			PrivateKey projectPrk = (PrivateKey) Base64Conversion.decodeBase64(prkStr);
			projectWallet.setPublicKey(projectPuk);
			projectWallet.setPrivateKey(projectPrk);
			
			Wallet buyerWallet = new Wallet();
			PublicKey buyerPuk = (PublicKey) Base64Conversion.decodeBase64(base64BuyerPuk);
			PrivateKey buyerPrk = (PrivateKey) Base64Conversion.decodeBase64(base64BuyerPrk);
		
			//# 트랜잭션 추가 시작
			Wallet managerWallet = commonSet.getManagerWallet();
			newBlock.addTransaction(blockChain, managerWallet.sendFunds(blockChain, buyerPuk, "충전", amount));
			newBlock.addTransaction(blockChain, buyerWallet.sendFunds(blockChain, projectPuk, item_name, amount));
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
