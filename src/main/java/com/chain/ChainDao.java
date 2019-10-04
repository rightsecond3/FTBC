package com.chain;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MemberVO;

@Repository
public class ChainDao {
	private static final Logger logger = LoggerFactory.getLogger(ChainDao.class);
	
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate = null;
	
	//#DB - 결제 시 - 펀딩하는 사람의 공개키가 해당 사람의 것이 맞는 지 확인하는 로직
	public String isPukRight(MemberVO memberVO) {
		logger.info("isPukRight 호출");
		String result = sqlSessionTemplate.selectOne("isPukRight", memberVO);
		return result;
	}
	//#DB- 프로젝트 이름으로 프로젝트 코드, 공개키 가져오기
	public Map<String, Object> getProjectInfo(String project_name) {
		logger.info("getProjectInfo 호출");
		Map<String, Object> rMap = new HashMap<>();
		rMap = sqlSessionTemplate.selectOne("getProjectInfo", project_name);
		return rMap;
	}
}
