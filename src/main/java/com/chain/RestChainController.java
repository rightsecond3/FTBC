package com.chain;

import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import blockchain.util.Base64Conversion;
import blockchain.util.StringUtil;
import vo.MemberVO;


@RestController
@RequestMapping("/restchain/*")
public class RestChainController {
	private static final Logger logger = LoggerFactory.getLogger(RestChainController.class);
	@Autowired
	ChainLogic chainLogic = null;
	StringUtil stringUtil = null;

	@RequestMapping(value="verifyKeys",method=RequestMethod.POST,produces ="application/text; charset=utf8")
	public String verifyKeys(@RequestParam Map<String,Object> pMap,  Model mod) throws Exception {
		logger.info("verifyKeys");
		String mem_email = pMap.get("mem_email").toString();
		String encoded_puk = pMap.get("encoded_puk").toString();
		String encoded_prk = pMap.get("encoded_prk").toString();
		PublicKey publicKey = (PublicKey) Base64Conversion.decodeBase64(encoded_puk);
		PrivateKey privateKey = (PrivateKey) Base64Conversion.decodeBase64(encoded_prk);
		logger.info("mem_email : "+mem_email);
		//키 검증하기
		boolean isValidKeys = StringUtil.isValidKeys(publicKey, privateKey);
		logger.info("isValidKeys " + isValidKeys);
		String msg = null;
		if(isValidKeys) {
			MemberVO memberVO = new MemberVO();
			memberVO.setMem_publickey(encoded_puk);
			memberVO.setMem_email(mem_email);
			String result = chainLogic.isPukRight(memberVO);
			logger.info("result : "+result);
			if("일치".equals(result)) {
				msg = "인증되었습니다";
			} else {
				msg = "인증 실패. 구매자의 공개키와 개인키가 아닙니다.";
			}
		}else {
			msg = "인증 실패. 유효 하지 않은 key 입니다.";
		}
		return msg;
	}
	
}
