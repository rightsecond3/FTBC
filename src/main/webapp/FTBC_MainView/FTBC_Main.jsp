<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="/FTBC_MainView/FTBC_Main.css">
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
	<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
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
				
				</div>
			</div><!--end of center  -->
			<div class="col-xs-2"></div>
		</div>
		<!--========================= [푸터 ] ======================== -->
		<div id="footer"><%@ include file="../FTBC_Common/FTBC_Footer.jsp"%></div>
	</div>
</body>
</html>