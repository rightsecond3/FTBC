package com.member;


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

	public MemberVO login(MemberVO mVO) {
		logger.info("Logic login 호출 ");
		mVO = memberDao.login(mVO);
		return mVO;
	}

}
