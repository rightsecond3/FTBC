package com.chain;

import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import blockchain.util.Base64Conversion;
import blockchain.util.StringUtil;
import exe.util.Protocol;
import vo.MemberVO;


@RestController
@RequestMapping("/restchain/*")
public class RestChainController {
	private static final Logger logger = LoggerFactory.getLogger(RestChainController.class);
	@Autowired
	ChainLogic chainLogic = null;
	StringUtil stringUtil = null;
	private static int cnt;

	@RequestMapping(value="verifyKeys",method=RequestMethod.POST,produces ="application/text; charset=utf8")
	public String verifyKeys(@RequestParam Map<String,Object> pMap) throws Exception {
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
	//# 블록이 추가되기전 과반수 프로그램을 돌려서 공유 체인을 채택함
	@RequestMapping(value="majorityStart", produces ="application/text; charset=utf8")
	public String majorityStart() {
		logger.info("##majorityStart 호출");
		chainLogic.getConnection();
		chainLogic.msgServerConnection(Protocol.ALERT_ADD_BLOCK);
		return "";
	}
	//# 공유 체인이 채택 되었으니 블록 추가 시키기
	@RequestMapping(value="addBlock", produces ="application/text; charset=utf8")
	public String addBlock() {
		logger.info("##addBlock 호출");
		chainLogic.addBlock(cnt);
		// 추가된 최신 체인 다운로드 시키기
		chainLogic.getConnection();
		chainLogic.msgServerConnection(Protocol.AUTOSYNC_CHAIN_DOWNLOAD_ALERT);
		if(cnt<1) {
			cnt++;
		}
		return "";
	}
}
