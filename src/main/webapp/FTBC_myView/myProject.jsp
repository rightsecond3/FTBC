<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FTBC</title>
<!--=============================================================================================
	내 가 만든 프로젝트 
	날짜:2019-09-16
================================================================================================  -->
<link rel="stylesheet" type="text/css" href="myProject.css?minju">
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
</head>
<body>
<!-- 내가 만든 프로젝트 페이지는 상단바 바뀌어야함.  -->
<%@ include file="../FTBC_Common/TopMenuBar.jsp"%>
<div class="container-fluid">
	<div class="row" id="myProject_top">
		<div class="row" id="myProject_pfd">
			<img src="../FTBC_Images/yh.png" id="myProject_pfimg" width=150px>
		</div>
	</div>
	
	<div class="row"  id="myProject_content">
		<div class="col-xs-2">&nbsp;</div>
		<div class="col-xs-8">
			<div id="myProject_spans" >
			<span id="created_project">만든 프로젝트 </span> <span id="created_num">3</span>  <span>개</span>
			</div>
				<div class="card col-xs-3" onclick="projectDetail()">
					<div class="card-header">
							<img src="../FTBC_Images/card1.jpg"class="card_img"> 
					</div>
					<div class="card-body">
						<span class="card-text project_title">프로젝트명</span> 
						<span class="card-text project_nick">닉네임</span>
						<hr width=85% align="left" class="card_hr">
						<span class="card-text project_date col-xs-5">1000일 남음</span> 
						<span class="card-text project_cost col-xs-7">100,000원 50%</span>
					</div>
			</div>
			
			<div class="card col-xs-3" onclick="projectDetail()">
				<div class="card-header">
					<img src="../FTBC_Images/card2.jpg"class="card_img"> 
				</div>
				<div class="card-body">
					<span class="card-text project_title">프로젝트명</span> 
					<span class="card-text project_nick">닉네임</span>
					<hr width=50% align="left" class="card_hr">
					<span class="card-text project_date col-xs-5">1000일 남음</span> 
					<span class="card-text project_cost col-xs-7">100,000원 50%</span>
				</div>
			</div>
					
			<div class="card col-xs-3" onclick="projectDetail()">
				<div class="card-header">
					<img src="../FTBC_Images/card3.jpg"class="card_img"> 
				</div>
				<div class="card-body">
					<span class="card-text project_title">프로젝트명</span> 
					<span class="card-text project_nick">닉네임</span>
					<hr width=100% align="left" class="card_hr">
					<span class="card-text project_date col-xs-5">1000일 남음</span> 
					<span class="card-text project_cost col-xs-7">100,000원 50%</span>
				</div>
			</div>
					
		</div>
		<div class="col-xs-2">&nbsp;</div>
	</div>
</div>
</body>
</html>