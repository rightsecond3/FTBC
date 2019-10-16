package com.member;


import java.sql.SQLException;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chain.ChainLogic;

import vo.MemberVO;

@Service
public class MemberLogic {
	private static final Logger logger = LoggerFactory.getLogger(MemberLogic.class);
	
	@Autowired
	MemberDao memberDao = null;

	public String emailCheck(MemberVO mVO) {
		logger.info("Logic emailCheck 호출 성공");
		String result = null;
		result = memberDao.emailCheck(mVO);
		return result;
	}
	
	public String memberLogin(MemberVO mVO) {
		logger.info("Logic memberLogin 성공");
		String result = null;
		result = memberDao.memberLogin(mVO);
		return result;
	}

	public int memberJoin(MemberVO mVO) {
		int result = 0;
		result = memberDao.memberJoin(mVO);
		return result;
	}

	public int join(MemberVO mVO) {
		int result=0;
		logger.info("Logic join 호출 ");
		result=memberDao.join(mVO);
		return result;
	}

	public void login(MemberVO mVO) {
		logger.info("Logic login 호출 ");
		memberDao.login(mVO);
	}
/////////////////////2019-10-14 정원형 중간합산 이후 비밀번호 찾기 //////////////////////
	public int forgotEmail(Map<String,Object> pMap) {
		logger.info("Logic forgotEmail 호출");
		int result= 0;
		result=memberDao.forgotEmail(pMap);
		return result;
	}
/////////////////////2019-10-14 정원형 중간합산 이후 비밀번호 찾기 //////////////////////
/////////////////////2019-10-15 정원형 비번변경/////////////////////////////
	public String prepasswordconfirm(MemberVO mVO) {
		String result=null;
		logger.info("Logic 이전패스워드확인 호출");
			result = memberDao.prepasswordConfirm(mVO);
		return result;
	}

	public int editAccount(MemberVO mVO) {
		int result= 0;
		logger.info("Logic 변경할패스워드 호출 성공");
		result = memberDao.editAccount(mVO);
		return result;
	}
/////////////////////2019-10-15 정원형 비번변경/////////////////////////////
}
