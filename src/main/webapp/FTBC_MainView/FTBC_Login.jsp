<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면 </title>
<!--=============================================================================================
	프로젝트 올리기 - 프로젝트 개요 탭
	날짜:2019-09-12
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="FTBC_Login.css?lovelyz">
</head>
<body>
<!--=============================================================================================
	로그인 박스
	날짜:2019-09-12
================================================================================================  -->
<script>
	function join(){
		var url = "../FTBC_MainView/FTBC_Join_pre.jsp";
		$("#Login_page").load(url);
		
	}
	function findpw(){
		var url = "../FTBC_MainView/Forgot_PW.jsp";
		$("#Login_page").load(url);
	}
	function login(){
		alert("호출성공?");
		var log_id = $("#log_id").val();
		var log_pw = $("#log_pw").val();
		alert(log_id+","+log_pw);
		$.post("/member/login",$("#login_all_form").serialize(),function(data){
			location.href="/FTBC_MainView/FTBC_Main.jsp"
		});
	}
</script>
<div id="login_box">
	<div>
		<button id="log_face">F 페이스북</button>
		<button id="log_naver">N 네이버</button>
	</div>
	<div id="hr_one">
		<div class="line">또 는</div>
	</div>
	<form id="login_all_form" name="login_all_form" onsubmit="return false;" >
		<input id="log_id" name="log_id" type="text" placeholder="이메일 주소 입력"><br>
		<input id="log_pw" name="log_pw" type="password"   placeholder="비밀번호" >
	</form>
	<div>
		<button id="log_login" onclick="login()">로그인</button>
	</div>	
	<div id="log_join">
		<span>아직 계정이 없으신가요?  </span><a href="javascript:join()">가입하기</a>
	</div>
	<div>
		<hr/>
	</div>
	<div id="log_find_Password">
		<a href="javascript:findpw()">혹시 비밀번호를 잊으셨나요?</a>
	</div>
</div>
</body>
</html>