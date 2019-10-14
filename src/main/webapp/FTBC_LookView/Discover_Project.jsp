<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String kind = request.getParameter("sort");
%>    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FTBC</title>
<!--=============================================================================================
	프로젝트 둘러보기 클릭후 들어오는 페이지
	모든 프로젝트, 인기프로젝트 등  
	리스트 부분은  Discover_ProjectList.jsp
	날짜:2019-09-19
================================================================================================  -->
<link rel="stylesheet" type="text/css" href="Discover_Project.css?Luda">
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
</head>
<body>
	<script type="text/javascript">
		function projectDetail(pjo_code) {
			alert(pjo_code);
			location.href = "../FTBC_DetailView/ProjectDetail.jsp?pjo_code"+pjo_code;
		}
		$(document).ready(function() {
			  $(".dropdown-toggle").dropdown();
			  kindProject('<%=kind%>');
		});
		function kindProject(sort){
			$.ajax({
				method:'get',
				url:'/Project/getDiscoverProjects?sort='+sort,
				success:function(data){
					$("#discover_content").html(data);
				}
				
			});
			if(sort=="all"){
				$("#Look_title").html("모든 프로젝트");
			}else if(sort=="popular"){
				$("#Look_title").html("인기 프로젝트");
				
			}else if(sort=="recommnad"){
				$("#Look_title").html("마감 임박 프로젝트");
				
			}else if(sort=="vergeof"){
				$("#Look_title").html("완료 임박 프로젝트");
				
			}
		}
		function catProject(maincat_name,subcat_name){
			catProjectView(maincat_name,'undefined');
		}
		function catProjectView(maincat_name,subcat_name){
			$.ajax({
				method:'get',
				url:'/Project/getCategoryProjects?maincat_name='+maincat_name+'&subcat_name='+subcat_name,
				success:function(data){
					$("#category_pro").html(data);
				}
				
			});
		}
	</script>
<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
<hr class="Look_hr"width=100%>
<div class="container-fluid">
	<!--상단 부분  -->
	<div class="row Look_Top " id="Discover_top">
	
		<div>
		 <a  class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		<h1 class="Look_title" id="Look_title">모든 프로젝트
		 <i class="fa fa-sort-down"></i>
		 </h1>
		 </a>
			  <div class="dropdown-menu">
				<div id="drop-item1">
					<a class="dropdown-item col-sm-6 ">모든 프로젝트</a>
					<a class="dropdown-item col-sm-6 " onclick="catProject('게임')">게임</a>
				</div>
				<hr width=90%>
				
				<div>
					<a class="dropdown-item col-sm-6" onclick="catProject('공연')">공연</a>
					<a class="dropdown-item col-sm-6" onclick="catProject('디자인')">디자인</a>
				</div>
				<hr width=90%>
				
				<div>
					<a class="dropdown-item col-sm-6" onclick="catProject('영화')">영화 ∙ 비디오</a>
					<a class="dropdown-item col-sm-6" onclick="catProject('푸드')">푸드</a>
				</div>
				<hr width=90%>
				
				<div>
					<a class="dropdown-item col-sm-6" onclick="catProject('음악')">음악</a>
					<a class="dropdown-item col-sm-6" onclick="catProject('출판')">출판</a>
				</div>
				<hr width=90%>
				
				<div>
					<a class="dropdown-item col-sm-6" onclick="catProject('패션')">패션</a>
					<a class="dropdown-item col-sm-6" onclick="catProject('캠페인')">캠페인</a>
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
	<div id="discover_content">
	
	</div>
</div>	
</body>
</html>