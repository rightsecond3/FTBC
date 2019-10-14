package com.member;


import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



import vo.MemberVO;


@Repository
public class MemberDao {
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate = null;
	
	public String memberLogin(MemberVO mVO) {
		String result = null;
		logger.info("Dao  memberLogin 호출 ");
		result = sqlSessionTemplate.selectOne("memberLogin",mVO);
		return result;
	}

	public int memberJoin(MemberVO mVO) {
		int result = 0;
		return result;
	}

	public String emailCheck(MemberVO mVO) {
		String result = null;
		logger.info("Dao  memberLogin 호출 ");
		result = sqlSessionTemplate.selectOne("emailCheck",mVO);
		return result;
	}

	public int join(MemberVO mVO) {
		int result = 0;
		logger.info("Dao  join 호출 ");
		result = sqlSessionTemplate.insert("join", mVO);
		return result;
	}

	public MemberVO login(MemberVO mVO) {
		Map<String,Object> rMap = new HashMap<>();
		logger.info("Dao join 호출 ");
		sqlSessionTemplate.selectOne("login", mVO);
		return mVO;
	}

}
