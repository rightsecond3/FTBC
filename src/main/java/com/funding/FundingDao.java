package com.funding;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class FundingDao {
	private static final Logger logger = LoggerFactory.getLogger(FundingDao.class);
	
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate = null;
}
