package com.funding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FundingLogic {
	
	@Autowired
	FundingDao fundingDao = null;
	
}
