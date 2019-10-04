<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 프로젝트 둘러보기 </title>
<!--=============================================================================================
	프로젝트 둘러보기 페이지
	날짜:2019-09-12
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="LookAround_Project.css?ohmygirl">
</head>
<body>
<script type="text/javascript">
	

</script>
	<!-- 상단 바 바꿀   -->
	<%@ include file="../FTBC_Common/TopMenuBar.jsp"%>
	 <hr class="FTBC_hr"width=110%>
	 	<div class="container-fluid" id="Look_Around">
	 	
	 		<div class="row La_row">
		 		<div class="col-xs-2">&nbsp;</div>
		 		<div class="col-xs-8">
		 			<div class="row">
		 				<span class="Look_span">검색</span>
		 			</div>
		 			<div class="row">
		 				<input id="search_txt" type="text" placeholder="프로젝트를 검색해 주세요" >
		 				<input id="serach_btn" type="button" value="검색하기" >
		 			</div>
		 		</div>
	 		</div>
		 	<hr width=150%>
		 	
		 	<div class="row">
		 		<div class="col-xs-2">&nbsp;</div>
		 		<div class="col-xs-8">
			 		<div id="LA_discover_row"  class="row La_row">
			 			<a href="Discover_Project.jsp"><span class="col-xs-3"> 모든 프로젝트</span>	</a>
			 			<a href="Discover_Project.jsp"><span class="col-xs-3"> 인기 프로젝트</span></a>	
			 			<a href="Discover_Project.jsp"><span class="col-xs-3"> 성공 임박 프로젝트</span></a>	
			 			<a href="Discover_Project.jsp"><span class="col-xs-3"> 새로운 프로젝트  </span></a>
			 		</div>
			 		<div id="LA_category_row" class="row La_row">
				 		<div class="row La_row">
				 			<span  class="col-xs-3 Look_span">카테고리</span>
				 		</div>
				 		<div class="row category_row">
					 		<a href="Discover_Project.jsp"  class="dropdown-toggle" data-toggle="dropdown" >
					 		<span class="col-xs-3" > 게임<i class="fa fa-sort-down"></i></span> </a>
								<ul class="dropdown-menu" aria-labelledby="about-us">
								  <li><a href="../FTBC_LookView/LookAround_Project.jsp">프로젝트 둘러보기 </a></li>
					              <li><a href="../FTBC_CreateView/CreatProject_Terms.jsp">프로젝트 올리기</a></li>
					              <li><a href="../FTBC_BlockChainView/BlockChain_Main.jsp">프로젝트 블록체인</a></li>  
								</ul>
				 			<a href="Discover_Project.jsp"><span class="col-xs-3"> 디자인<i class="fa fa-sort-down"></i></span></a>	
				 			<a href="Discover_Project.jsp"><span class="col-xs-3"> 만화<i class="fa fa-sort-down"></i></span></a>	
				 			<a href="Discover_Project.jsp"><span class="col-xs-3"> 미술<i class="fa fa-sort-down"></i></span></a>
				 		</div>
				 		
				 		<div class="row category_row">
					 		<a href="Discover_Project.jsp"><span class="col-xs-3"> 공예<i class="fa fa-sort-down"></i></span></a>
				 			<a href="Discover_Project.jsp"><span class="col-xs-3"> 사진<i class="fa fa-sort-down"></i></span></a>	
				 			<a href="Discover_Project.jsp"><span class="col-xs-3"> 영화  <i class="fa fa-sort-down"></i></span></a>	
				 			<a href="Discover_Project.jsp"><span class="col-xs-3"> 푸드<i class="fa fa-sort-down"></i></span></a>
				 		</div>
				 		
				 		<div class="row category_row">
					 		<a href="Discover_Project.jsp"><span class="col-xs-3"> 음악 <i class="fa fa-sort-down"></i></span></a>
				 			<a href="Discover_Project.jsp"><span class="col-xs-3"> 출판<i class="fa fa-sort-down"></i></span></a>	
				 			<a href="Discover_Project.jsp"><span class="col-xs-3"> 패션<i class="fa fa-sort-down"></i> </span></a>	
				 			<a href="Discover_Project.jsp"><span class="col-xs-3"> 캠페인<i class="fa fa-sort-down"></i> </span></a>
				 		</div>
			 		</div>
		 		</div>
		 		<div class="col-xs-2">&nbsp;</div>
		 	</div>
		 	
	 	</div>
</body>
</html>