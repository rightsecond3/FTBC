<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String maincat_name = request.getParameter("maincat_name").toString();
	String subcat_name = "null";
	if(request.getParameter("subcat_name")!=null){
	subcat_name = request.getParameter("subcat_name").toString();
	}
%>    

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
<script type="text/javascript">
	$(document).ready(function(){
		catProjectView('<%=maincat_name%>','<%=subcat_name%>');
	});
	function catProjectView(maincat_name,subcat_name){
		$.ajax({
			method:'get',
			url:'/Project/getCategoryProjects?maincat_name='+maincat_name+'&subcat_name='+subcat_name,
			success:function(data){
				$("#category_pro").html(data);
			}
			
		});
	}
	function projectDetail(pjo_code) {
		location.href = "../FTBC_DetailView/ProjectDetail.jsp?pjo_code="+pjo_code;
	}
	function catProject(maincat_name,subcat_name){
		catProjectView(maincat_name,'undefined');
	}
</script>
</head>
<body>
<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
<hr class="Look_hr"width=100%>
<div class="container-fluid">
<div id="category_pro">
			
</div>
</div>
</body>
</html>