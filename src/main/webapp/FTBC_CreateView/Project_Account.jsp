<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 만들기 </title>
<!--=============================================================================================
	프로젝트 올리기 - 계좌 설정 탭
	날짜:2019-09-12
================================================================================================  -->
<link rel="stylesheet" type="text/css" href="Project_Account.css?loona">
</head>
<body>	
<script type="text/javascript">
	/******* 이메일 주소  *****/
	function enterEmail() {
		$("#ac_email1").hide();
		$("#ac_email2").show();
	}
	
	function cancelEmail() {
		$("#ac_email2").hide();
		$("#ac_email1").show();
	}
	
	/******* 본인인증  *****/
	function enterpnum() {
		$("#ac_urself1").hide();
		$("#ac_urself2").show();
	}
	
	function cancelSelf() {
		$("#ac_urself2").hide();
		$("#ac_urself1").show();
	}
	
	/******* 입금계좌  *****/
	function enterAccount() {
		$("#ac_account1").hide();
		$("#ac_account2").show();
	}
	
	function cancelAccount() {
		$("#ac_account2").hide();
		$("#ac_account1").show();
	}
	
	function saveEmail() {
	}

	$(document).ready(function() {
		$("#ac_email2").hide();
		$("#ac_urself2").hide();
		$("#ac_account2").hide();
	});
</script>
<div>
	<!--==================================[ 이메일 인증 ]============================  -->
	<p>이메일 인증</p>
	<div id="ac_email1" onclick="enterEmail()">
			<div class="row">
				<div class="col-sm-10">
					<label>&nbsp; 이메일 주소 </label>
				</div>
			</div>
			<div class="row" id="ac_email1_content">
				<div class="col-sm-10">
					<img src="../FTBC_Images/finger.png"></img><label>&nbsp; [회원 이메일]</label>
				</div>
				<div class="col-sm-2">
					<img src="../FTBC_Images/edit.png"></img><label>&nbsp; 수정하기</label>
				</div>
			</div>
		</div>
		<!--end of ac_email1  -->	
		
		<div id="ac_email2">
			<div>
				<label>&nbsp; 이메일 주소 </label>
			</div>
			<div>
				<label class="account_label">&nbsp; 창작자님이 연락받으실 수 있는 이메일을 입력해 주세요. 프로젝트 관련 중요 안내사항이 모두 이메일로 전달되므로 평소 자주 확인하는 이메일을 입력하시는 것이 좋습니다.</label>
			</div>
			<div id="ac_email2_content">
				<input type="text " id="email2_textbox">
			</div>
			<div id="email2_btns">
				<input id="email_cancel" type="button" onClick="cancelEmail()"value="취소하기"> 
				<input id="email_verify" type="button" onClick="saveEmail()" value="인증받기">
			</div>
		</div>
		
	<!--==================================[ 보닌 인증  ]============================  -->
	<p>본인 인증</p>
	<div id="ac_urself1" onclick="enterpnum()">
			<div class="row" id="ac_urself1_content">
				<div class="col-sm-10">
					<img src="../FTBC_Images/finger.png"></img><label class="account_label">&nbsp; 본인 인증을 진행해 주세요</label>
				</div>
				<div class="col-sm-2">
					<img src="../FTBC_Images/edit.png"></img><label class="account_label">&nbsp; 수정하기</label>
				</div>
			</div>
		</div>
		<!--end of ac_urself1  -->	
		
		<div id="ac_urself2">
			<div>
				<label class="account_label">&nbsp; 휴대폰 번호로 한국모바일인증(주)의 본인확인서비스를 통해 본인 인증을 진행합니다. </label>
			</div>
			
			<div id="urself2_btns">
				<input id="selfverify_cancel" type="button" onClick="cancelSelf()"value="취소하기"> 
				<input id="selfverify_verify" type="button" onClick="verifySelf()" value="인증받기">
			</div>
		</div>
		
		<!--==================================[ 입금 계좌 ]============================  -->
	<p>입금 계좌</p>
	<div id="ac_account1" onclick="enterAccount()">
			<div class="row" id="ac_account1_content">
				<div class="col-sm-10">
					<img src="../FTBC_Images/finger.png"></img><label class="account_label">&nbsp; 본인 인증을 진행해 주세요</label>
				</div>
				<div class="col-sm-2">
					<img src="../FTBC_Images/edit.png"></img><label class="account_label">&nbsp; 수정하기</label>
				</div>
			</div>
		</div>
		<!--end of ac_account1  -->	
		
		<div id="ac_account2">
			<div>
				<label>&nbsp; 이메일 주소 </label>
			</div>
			<div>
				<label>&nbsp; 펀딩에 성공할시 입금 받으실 계좌를 입력해 주세요.</label>
			</div>
			<div id="ac_account2_content">
					<input type="text " id="account2_textbox">
			</div>
			
			<div id="account2_btns">
				<input id="account_cancel" type="button" onClick="cancelAccount()"value="취소하기"> 
				<input id="account_verify" type="button" onClick="saveAccount()" value="저장하기">
			</div>
		</div>
</div>

</body>
</html>