<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FTBC</title>
<!--=============================================================================================
	내 페이지
	날짜:2019-09-16
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
</head>
<body>
<style type="text/css">
	.FTBC_myPage{
		margin:30px 0 30px 50px;;
	}
	
	#myPage_pfimg{
		width: 75px;
	}
	
	#my_name{
		margin-left: 20px;
		font-size:21px;
		font-weight: 700;
		text-decoration: none solid rgb(117,117,117);
	}
	
	.FTBC_myPage a{
	    color:black;
		font-size:28px;
		font-weight: bold;
		text-decoration:none;
	}
</style>
<script type="text/javascript">
		
	</script>
	<div id="top_MenuBar">
		<!-- 내 페이지는 상단바 바뀌어야함.  -->
		<%@ include file="../FTBC_Common/TopMenuBar.jsp"%>
		 <hr class="FTBC_hr"width=110%>
	</div>
	<div class="container-fluid">
		<div class="col-xs-2">&nbsp;</div>
		<div class="col-xs-8">
			<div class="FTBC_myPage">
				<img src="../FTBC_Images/arin.png" id="myPage_pfimg">
				<span id="my_name">이름</span>
				<hr width=100%>
			</div>
			
			<div class="FTBC_myPage" >
				<span><a href="Message.jsp" >메시지</a></span><br>
				<span><a href="FundedProject.jsp" >내 후원현황</a></span><br>
				<span><a href="myProject.jsp">내가 만든 프로젝트</a></span><br>
				<hr width=100%>
			</div>
			
			<div class="FTBC_myPage" id="myPage_1p">
				<span><a href="Edit_Profile.jsp">프로필 설정</a></span><br>
				<span><a href="../FTBC_WalletView/WalletView.png">내 지갑</a></span><br>
				<span><a href="#">로그아웃</a></span><br>
			</div>
		</div>
		<div class="col-xs-2">&nbsp;</div>
	</div>
</body>
</html>