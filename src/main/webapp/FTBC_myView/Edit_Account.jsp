<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--=============================================================================================
	계정 설정페이지
	날짜:2019-09-18
================================================================================================  -->
<link rel="stylesheet" type="text/css" href="Edit_Account.css?yebin">
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
</head>
<body>
<%@ include file="../FTBC_Common/TopMenuBar_OnlyLogo.jsp"%>
<div class="container-fluid">
	<!--  상단 부분  -->
	<div class="row" id="EditAccount_top">
		<div class="col-xs-3">&nbsp;</div>
		<div class="col-xs-3">
			<h2>계정 설정</h2>
		</div>
		<div class="col-xs-3" >
			<div id="EditAccount_a" class="EditAccount_a">
				<a href="Edit_Profile.jsp">프로필 설정</a>
				<a>계정 설정</a>
				<a>지불 정보 설정</a>
			</div>
		</div>
		<div class="col-xs-3">&nbsp;</div>
	</div>
	<!--  내용 부분 -->
	<div class="row" id="EditAccount_content">
		<div class="col-xs-3">&nbsp;</div>
		<div class="col-xs-5"> 
		
			<!--  이메일 설정  -->
			<div id="edit_eamil" class="row">
				<div class="col-xs-2 labelbox"><label>이메일</label> </div>
				<div class="col-xs-10">
					<div class="row">
						<input type="text" class="edit_txtbox" id="email_tbox"> 
						<input type="button" value="변경하기 " id="edit_email_btn"> 
					</div>
					<div class="row">
						<p>
						변경할 이메일을 입력하신 후 변경하기를 누르시면, 새 메일 주소로 인증 메일이 갑니다.<br>
						전송된 인증 메일	 안의 링크를 누르시면 변경된 이메일을 사용하실 수 있습니다.
						</p>
					</div>
				</div>
			</div>
			
			<!--  비밀번호 설정  -->
			<div id="edit_pw" class="row edit_ac">
				<div class="col-xs-2 labelbox"><label>이메일</label> </div>
				<div class="col-xs-10">
					<input type="text" class="edit_txtbox" placeholder="현재 비밀번호" id="pw_tbox1">
					<input type="text" class="edit_txtbox" placeholder="변경할 비밀번호" id="pw_tbox2">
				</div>
			</div>
			
			<!--  페이지 주소 -->
			<div id="edit_page" class="row edit_ac">
				<div class="col-xs-2 labelbox"><label>페이지 주소</label> </div>
				<div class="col-xs-10">
					<input type="text" class="edit_txtbox" placeholder="rocketpunch" id="page_tbox">
					<span id="account_page">ftbc.com/u/rocketpuch</span>
				</div>
			</div>
			
			<!--  뉴스레터 구독  -->
			<div id="edit_news" class="row edit_ac">
				<div class="col-xs-2 labelbox"><label>뉴스레터</label> </div>
				<div class="col-xs-10">
					<input type="checkbox" class="edit_txtbox"  id="news_cbox">
					<span>뉴스레터를 구독합니다</span>
				</div>
			</div>
			
			<!--  수정하기 버튼  -->
			<div id="edit_ac_btn" class="row edit_ac">
				<div class="col-xs-2 labelbox" ><label>&nbsp;</label> </div>
				<input type="button"  value="수정하기  "  id="edit_ac_button">
			</div>
		</div>
		<div class="col-xs-4">&nbsp;</div>
	</div>
</div>
</body>
</html>