<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String name= "guest";
	String mem_email = null;
	if(session.getAttribute("mem_name")!=null){
		name = session.getAttribute("mem_name").toString();
	}
	
	if(session.getAttribute("mem_email")!=null){
		mem_email = session.getAttribute("mem_email").toString();
	}
	if(request.getAttribute("mainProjects")!=null){
		out.print("main"+request.getAttribute("mainProjects"));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FTBC</title>
<!--=============================================================================================
	메인 페이지
	날짜:2019-09-12
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="FTBC_Main.css?DreamCatcher">
</head>
<body leftmargin="0" rightmargin="0">
	<script type="text/javascript">
		//배너 변경
		$(".carousel").carousel({
			interval : 3000
		});

		function projectDetail(pjo_code) {
			location.href = "../FTBC_DetailView/ProjectDetail.jsp?pjo_code="+pjo_code;
		}
		
		function main_ajax(){
			$.ajax({
				method:'get',
				url:'/Project/getMainProjects',
				success:function(data){
						$("#allproject").html(data);
				} 
					
			});
		}
		$(document).ready(function() {
			main_ajax();
		});
	</script>
	<%@ include file="../FTBC_Common/TopMenuBar_Login.jsp"%>
	<!--====================[배너 이미지 ]====================  -->
	<div class="container-fluid">
		<div id="mainbanner" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				<li data-target="#carousel-example-generic" data-slide-to="3"></li>
			</ol>
			
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="../FTBC_Images/ban1.jpg" alt="..." >
					<div class="carousel-caption">이달의 소녀 <br> ButterFly</div>
				</div>
				<div class="item">
					<img src="../FTBC_Images/ban2.jpg" alt="...">
					<div class="carousel-caption">로켓펀치 <br> 빔밤붐</div>
				</div>
				<div class="item">
					<img src="../FTBC_Images/ban3.jpg" alt="..." >
					<div class="carousel-caption">아이즈원 <br> 부에노스 아이레스</div>
				</div>
				<div class="item">
					<img src="../FTBC_Images/ban4.jpg" alt="..." >
					<div class="carousel-caption">아이즈원 <br> 비올레타</div>
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev">
				 <span  class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	
		<!--====================[ 내  용   ]====================  -->	
		<div class="row Project_lists" id="contents">
			<div class="col-xs-2"></div>
			<div id="main_Center" class="col-xs-8">
			
			<!--=================================[인기 프로젝트 ]================================== -->
				<div class="row" id="allproject">
				<!-- <div class="row main_row">
				<span class="main_span" id="popular_pjs"> 인기 프로젝트 <i class="fa fa-caret-right"></i> </span>
				</div>
				<div id="popularProjects">
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
				</div>

				=================================[추천 프로젝트]==================================
				<div class="row main_row">
				<span class="main_span"> 추천 프로젝트 <i class="fa fa-caret-right"></i> </span>
				</div>
				
				<div class="row">
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
					
					<div class="card col-xs-3" onclick="projectDetail()">
						<div class="card-header">
							<img src="../FTBC_Images/card6.jpg" class="card_img"> 
						</div>
						<div class="card-body">
							<span class="card-text project_title">프로젝트명</span> 
							<span class="card-text project_nick">닉네임</span>
							<hr width=90%  align="left" class="card_hr">
							<span class="card-text project_date col-xs-5">1000일 남음</span> 
							<span class="card-text project_cost col-xs-7">100,000원 50%</span>
						</div>
					</div>
					
					<div class="card col-xs-3" onclick="projectDetail()">
						<div class="card-header">
							<img src="../FTBC_Images/card7.jpg" class="card_img"> 
						</div>
						<div class="card-body">
							<span class="card-text project_title">프로젝트명</span> 
							<span class="card-text project_nick">닉네임</span>
							<hr width=66%  align="left" class="card_hr">
							<span class="card-text project_date col-xs-5">1000일 남음</span> 
							<span class="card-text project_cost col-xs-7">100,000원 50%</span>
						</div>
					</div>
					
					<div class="card col-xs-3" onclick="projectDetail()">
						<div class="card-header">
							<img src="../FTBC_Images/card8.jpg" class="card_img"> 
						</div>
						<div class="card-body">
							<span class="card-text project_title">프로젝트명</span> 
							<span class="card-text project_nick">닉네임</span>
							<hr width=30%  align="left" class="card_hr">
							<span class="card-text project_date col-xs-5">1000일 남음</span> 
							<span class="card-text project_cost col-xs-7">100,000원 50%</span>
						</div>
					</div>
				</div>
				=================================[성공 임박 프로젝트]==================================
				<div class="row main_row">
				<span class="main_span"> 성공 임박 프로젝트 <i class="fa fa-caret-right"></i> </span>
				</div>
				<div class="row">
					<div class="card col-xs-3" onclick="projectDetail()">
						<div class="card-header">
							<img src="../FTBC_Images/card9.jpg" class="card_img"> 
						</div>
						<div class="card-body">
							<span class="card-text project_title">프로젝트명</span> 
							<span class="card-text project_nick">닉네임</span>
							<hr width=10%  align="left" class="card_hr">
							<span class="card-text project_date col-xs-5">1000일 남음</span> 
							<span class="card-text project_cost col-xs-7">100,000원 50%</span>
						</div>
					</div>
					
					<div class="card col-xs-3" onclick="projectDetail()">
						<div class="card-header">
							<img src="../FTBC_Images/card10.jpg" class="card_img"> 
						</div>
						<div class="card-body">
							<span class="card-text project_title">프로젝트명</span> 
							<span class="card-text project_nick">닉네임</span>
							<hr width=80%  align="left" class="card_hr">
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
							<hr width=98%  align="left" class="card_hr">
							<span class="card-text project_date col-xs-5">1000일 남음</span> 
							<span class="card-text project_cost col-xs-7">100,000원 50%</span>
						</div>
					
					</div>
				</div> -->
				</div>
			</div><!--end of center  -->
			<div class="col-xs-2"></div>
		</div>
		<!--========================= [푸터 ] ======================== -->
		<div id="footer"><%@ include file="../FTBC_Common/FTBC_Footer.jsp"%></div>
	</div>
</body>
</html>