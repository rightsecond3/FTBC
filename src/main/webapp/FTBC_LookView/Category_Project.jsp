<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FTBC</title>
<!--=============================================================================================
	프로젝트 둘러보기 클릭후 들어오는 페이지
	카테고리별 프로젝트
	리스트 부분은  Category_ProjectList.jsp
	날짜:2019-09-12
================================================================================================  -->
<link rel="stylesheet" type="text/css" href="Category_Project.css?firework">
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
</head>
<body>
<%@ include file="../FTBC_Common/TopMenuBar.jsp"%>
<hr class="Look_hr"width=100%>
<div class="container-fluid">
	<!--상단 부분  -->
	<div class="row Look_Top" id="Category_top">
	
		<div>
		 <a  class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		<h1 class="Look_title" >푸드
		 <i class="fa fa-sort-down"></i>
		 </h1>
		 </a>
			 <div class="dropdown-menu">
				<div id="drop-item1">
					<a class="dropdown-item col-sm-6 ">모든 프로젝트</a>
					<a class="dropdown-item col-sm-6 ">게임</a>
				</div>
				<hr width=90%>
				
				<div>
					<a class="dropdown-item col-sm-6">공연</a>
					<a class="dropdown-item col-sm-6">디자인</a>
				</div>
				<hr width=90%>
				
				<div>
					<a class="dropdown-item col-sm-6">영화 ∙ 비디오</a>
					<a class="dropdown-item col-sm-6">푸드</a>
				</div>
				<hr width=90%>
				
				<div>
					<a class="dropdown-item col-sm-6">음악</a>
					<a class="dropdown-item col-sm-6">출판</a>
				</div>
				<hr width=90%>
				
				<div>
					<a class="dropdown-item col-sm-6">패션</a>
					<a class="dropdown-item col-sm-6">캠페인</a>
				</div>
				<hr width=90%>
			 </div>
		</div>
		
	</div>
	
	<!--중앙 메뉴바  -->
	<div class="row Look_Midbar">
		<div class="col-xs-2"></div>
		<div class="col-xs-8">
			<!-- 콤보박스  -->
			<div class="col-xs-2">
				<select class="Look_Select">
				  <option value="popular">인기순</option>
				  <option value="newest">최신순</option>
				  <option value="pledges">최다 후원순</option>
				  <option value="amount">최다 금액순</option>
				  <option value="near">마감 임박순</option>
				</select>
			</div>
			<div class="col-xs-8"></div>
			<!-- 체크 박스  -->
			<div class="col-xs-2">
				<label class="Look_Label">
					<input type="checkbox" value="true" id="pj_cb_ing">
					진행중인 프로젝트 
				</label>
			</div>
		</div>
		<div class="col-xs-2"></div>
	</div>
	
	<!-- 내용 -->
	<div class="Look_Content">
		<div class="col-xs-2"></div>
		<div class="col-xs-8">
			<div class="card col-xs-3" onclick="projectDetail()">
				<div class="card-header">
					<img src="../FTBC_Images/card7.jpg"class="card_img"> 
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
					<img src="../FTBC_Images/card5.jpg"class="card_img"> 
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
					<img src="../FTBC_Images/card8.jpg"class="card_img"> 
				</div>
				<div class="card-body">
					<span class="card-text project_title">프로젝트명</span> 
					<span class="card-text project_nick">닉네임</span>
					<hr width=80% align="left" class="card_hr">
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
					<img src="../FTBC_Images/card11.jpg" class="card_img"> 
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