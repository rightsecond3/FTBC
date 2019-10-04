package com.chain;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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

}
