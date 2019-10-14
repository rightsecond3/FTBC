package com.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.member.util.FindUtil;
import com.member.util.MailUtil;

import blockchain.util.StringUtil;
import vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
   Logger logger = LoggerFactory.getLogger(MemberController.class);
   @Autowired
   public MemberLogic memberLogic = null;
   @Autowired
   public MemberVO mVO = null;

   @GetMapping("emailCheck")
   public @ResponseBody String emailCheck(@RequestParam Map<String,Object> pMap) {
      logger.info("emailCheck Controller 호출");
      mVO.setMem_email(pMap.get("email").toString()); 
      String result = memberLogic.emailCheck(mVO);
      return result;
   }   
   @GetMapping("emailSend")
   public @ResponseBody String emailSend(@RequestParam Map<String, Object> pMap, HttpSession session) {
      logger.info("emailSend Controller 호출");
      String keyCode = null;
      try {
         keyCode = FindUtil.createKey();
         String mem_email = pMap.get("email").toString();
         System.out.println("mem_email: =============="+mem_email);
         String subject = "[FTBC] 이메일 인증 안내";
         String msg = "";
         msg +="<div align='center' style='border:1px solid black; font-family:verdana'>";
         msg +="<h3 style='color: blue;'>인증 코드가 발급되었습니다.</h3>";
         msg +="<div style='font-size: 130%'>";
         msg +="발급된 인증번호는 <strong>"+keyCode+"</string>이며,<br>";
         msg +="인증번호를 입력하셔서, 본인확인을 완료해주시기를 바랍니다.</div><br>";
         MailUtil.sendMail(mem_email, subject, msg);
         
      } catch (Exception e) {
         e.printStackTrace();
      } 
      return keyCode;
   }
////[2019-10-14] 정원형 중간합산 이후 비밀번호 찾기 및 회원가입 생년월일 추가 시작 ///////////////////////
   @GetMapping("forgotEmail")
   
   public @ResponseBody int forgotEmail(@RequestParam Map<String, Object> pMap) {
	   logger.info("컨트롤러 비밀번호 찾기 호출 성공");
	   int result = 0;
	   //받아온 이메일
	   String keyCode = null;
	   try {
	      keyCode = FindUtil.createKey();
	      String imsiPassword = StringUtil.applySha256(keyCode);
	      pMap.put("imsiPassword",imsiPassword);
	      String mem_email = pMap.get("email").toString();
	      System.out.println("mem_email: =============="+mem_email);
	      String subject = "[FTBC] 비밀번호 찾기 안내";
	      String msg = "";
	      msg +="<div align='center' style='border:1px solid black; font-family:verdana'>";
	      msg +="<h3 style='color: blue;'>인증 코드가 발급되었습니다.</h3>";
	      msg +="<div style='font-size: 130%'>";
	      msg +="발급된 임시비밀번호는 <strong>"+keyCode+"</string>이며,<br>";
	      msg +="임시비밀번호로 로그인하신 후, 비밀번호를 변경 해 주시길 바랍니다.</div><br>";
	      MailUtil.sendMail(mem_email, subject, msg);
	         
	   } catch (Exception e) {
	      e.printStackTrace();
	   } 
	   result=memberLogic.forgotEmail(pMap);
	   return result;
   }

  
   @PostMapping("join")
	public String join(@RequestParam Map<String, Object> pMap) {
		//int result = 0;
		logger.info("MemberController join 호출 성공");
		logger.info("이메일============:"+pMap.get("mem_email").toString());
		logger.info("이름============:"+pMap.get("mem_name").toString());
		logger.info("비밀번호============:"+pMap.get("mem_pw").toString());
		logger.info("생년월일============:"+pMap.get("mem_birth").toString());
		mVO.setMem_email(pMap.get("mem_email").toString());
		mVO.setMem_name(pMap.get("mem_name").toString());
		mVO.setMem_birth(pMap.get("mem_birth").toString());
		String password = pMap.get("mem_pw").toString();
		logger.info("비밀번호sha256통과============:"+StringUtil.applySha256(password));
		mVO.setMem_pw(StringUtil.applySha256(password));
		memberLogic.join(mVO);
		return "redirect:/FTBC_MainView/FTBC_Login.jsp";
	}
////[2019-10-14] 정원형 중간합산 이후 비밀번호 찾기 및 회원가입 생년월일 추가 끝 ///////////////////////   
	@GetMapping(value="logout.ftbc")
	public String logout(HttpSession httpSession) {
		logger.info("logout: String 호출");
		httpSession.removeAttribute("mem_email");
		httpSession.removeAttribute("mem_pfimg");
		httpSession.removeAttribute("mem_name");
		httpSession.removeAttribute("mem_isAuthority");
		return "redirect:/FTBC_MainView/FTBC_Main.jsp";
	}
}