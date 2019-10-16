package com.member;


import java.sql.SQLException;
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
      logger.info("Dao  memberemailCheck 호출 ");
      result = sqlSessionTemplate.selectOne("emailCheck",mVO);
      return result;
   }

   public int join(MemberVO mVO) {
      int result = 0;
      logger.info("Dao  join 호출 ");
      result = sqlSessionTemplate.insert("join", mVO);
      return result;
   }

   public void login(MemberVO mVO) {
      logger.info("Dao  join 호출 ");
      sqlSessionTemplate.selectOne("login", mVO);
   }
/////////////////////2019-10-14 정원형 중간합산 이후 비밀번호 찾기 //////////////////////
   public int forgotEmail(Map<String,Object> pMap) {
	   int result = 0;
	   logger.info("Dao forgotEmail 호출");
	   result =sqlSessionTemplate.update("forgotEmail",pMap);
	   return result;
   }
/////////////////////2019-10-14 정원형 중간합산 이후 비밀번호 찾기 //////////////////////
/////////////////////2019-10-15 정원형 비번변경/////////////////////////////
public String prepasswordConfirm(MemberVO mVO) {
	logger.info("Dao 이전패스워드확인 호출");
	String result = null;
	result = sqlSessionTemplate.selectOne("prepasswordConfirm",mVO);
	return result;
}

public int editAccount(MemberVO mVO) {
	int result = 0;
	logger.info("Dao editAccount 호출성공");
	result = sqlSessionTemplate.update("editAccount",mVO);
	return result;
}
/////////////////////2019-10-15 정원형 비번변경/////////////////////////////


}