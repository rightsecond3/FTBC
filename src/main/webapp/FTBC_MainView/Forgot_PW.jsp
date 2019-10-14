<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="Forgot_PW.css">
<script type="text/javascript">
//////////////////////2019-10-14 정원형 중간합산 이후 비밀번호 찾기 수정 시작///////////////
	function Find_pw(){
		var email = $("#Forgot_email").val();
		$.ajax({
			method:'get'
			,url:'/member/forgotEmail?email='+email
			,success: function(data) {
				if(data==1){
				alert("임시비밀번호를 전송하였습니다.\n임시 비밀번호로 로그인 하신 후 비밀번호를 변경 해 주시길 바랍니다.");
				}
			}
		});
	}
</script>
</head>
<body>
<div id="find_pw_box">
	<div id="find_pw_title">
		<h3><b>비밀번호 찾기</b></h3>
	</div>
	<div id="hr_one">
		<hr/>
	</div>
	<div id="Consent">
		<span>텀블벅 가입 시 사용하신 이메일을 입력하시면 입력하신 이메일로 임시 비밀번호를 보내드립니다.</span>
	</div>
	<div id="Consent">
		<span>페이스북/네이버로 가입하신 경우, 페이스북/네이버 계정에 쓰이는 이메일을 입력해주세요.</span>
	</div>
	<div id="hr_one"> 
		<hr/>
	</div>
	<div id="for_email">
		<input id="Forgot_email" name="Forgot_email" type="text" placeholder="가입하신 이메일 주소" >
	</div>
	<div id="for_birth">
		<input id="Forgot_email" name="Forgot_email" type="text" placeholder="클릭하신 후 생년월일을 선택하세요." >
	</div>
	<div id="log_join">
		<button id="Find_pw" onclick="Find_pw()">임시비밀번호 전송하기.</button>
	</div>
</div>
		<!--  //////////////////////2019-10-14 정원형 중간합산 이후 비밀번호 찾기 수정 끝///////////////-->
</body>
</html>