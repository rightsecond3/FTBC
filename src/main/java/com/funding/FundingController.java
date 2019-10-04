package com.funding;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/Funding/*")
public class FundingController {
	private static final Logger logger = LoggerFactory.getLogger(FundingController.class);

	@Autowired
	FundingLogic fundingLogic = null;
	

}
