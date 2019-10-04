<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FTBC</title>
<!--=============================================================================================
	프로젝트 둘러보기 검색해서 들어오는 페이지
	타이틀: "키워드"에 대한 검색 결과 
	리스트 부분은  Keyword_ProjectList.jsp
	날짜:2019-09-12
================================================================================================  -->
<link rel="stylesheet" type="text/css" href="Keyword_Project.css?Itzy">
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
</head>
<body>
<%@ include file="../FTBC_Common/TopMenuBar.jsp"%>
<hr class="Look_hr"width=100%>
<div class="container-fluid">
	<!--상단 부분  -->
	<div class="row Look_Top" id="Keyword_top">
		<h1 class="Look_title">“ㅇㅇ”에 대한 검색 결과 </h1>
	</div>
	
	<!-- 내용 -->
	<div class="Look_Content">
		<div class="col-xs-2"></div>
		<div class="col-xs-8">
			<div class="card col-xs-3" onclick="projectDetail()">
				<div class="card-header">
					<img src="../FTBC_Images/card11.jpg"class="card_img"> 
				</div>
				<div class="card-body">
					<span class="card-text project_title">프로젝트명</span> 
					<span class="card-text project_nick">닉네임</span>
					<hr width=15% align="left" class="card_hr">
					<span class="card-text project_date col-xs-5">1000일 남음</span> 
					<span class="card-text project_cost col-xs-7">100,000원 50%</span>
				</div>
			</div>
			
			<div class="card col-xs-3" onclick="projectDetail()">
				<div class="card-header">
					<img src="../FTBC_Images/card12.jpg"class="card_img"> 
				</div>
				<div class="card-body">
					<span class="card-text project_title">프로젝트명</span> 
					<span class="card-text project_nick">닉네임</span>
					<hr width=77% align="left" class="card_hr">
					<span class="card-text project_date col-xs-5">1000일 남음</span> 
					<span class="card-text project_cost col-xs-7">100,000원 50%</span>
				</div>
			</div>
			
			<div class="card col-xs-3" onclick="projectDetail()">
				<div class="card-header">
					<img src="../FTBC_Images/card15.jpg"class="card_img"> 
				</div>
				<div class="card-body">
					<span class="card-text project_title">프로젝트명</span> 
					<span class="card-text project_nick">닉네임</span>
					<hr width=100% align="left" class="card_hr">
					<span class="card-text project_date col-xs-5">1000일 남음</span> 
					<span class="card-text project_cost col-xs-7">100,000원 50%</span>
				</div>
			</div>
			
			<div class="card col-xs-3" onclick="projectDetail()">
				<div class="card-header">
					<img src="../FTBC_Images/card4.jpg"class="card_img"> 
				</div>
				<div class="card-body">
					<span class="card-text project_title">프로젝트명</span> 
					<span class="card-text project_nick">닉네임</span>
					<hr width=70% align="left" class="card_hr">
					<span class="card-text project_date col-xs-5">1000일 남음</span> 
					<span class="card-text project_cost col-xs-7">100,000원 50%</span>
				</div>
			</div>
			
			<div class="card col-xs-3" onclick="projectDetail()">
				<div class="card-header">
					<img src="../FTBC_Images/card5.jpg" class="card_img"> 
				</div>
				<div class="card-body">
					<span class="card-text project_title">프로젝트명</span> 
					<span class="card-text project_nick">닉네임</span>
					<hr width=20%  align="left" class="card_hr">
					<span class="card-text project_date col-xs-5">1000일 남음</span> 
					<span class="card-text project_cost col-xs-7">100,000원 50%</span>
				</div>
			</div>
			
		</div>
		<div class="col-xs-2"></div>
	</div>
	
</div>
</body>
</html>