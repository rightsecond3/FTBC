<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String keyword = request.getParameter("keyword").toString();
%>  
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
<script type="text/javascript">
	$(document).ready(function(){
		keyProjectView('<%=keyword%>');
	});
	function keyProjectView(keyword){
		$.ajax({
			method:'get',
			url:'/Project/getKeywordProjects?Keyword='+keyword,
			success:function(data){
				$("#keyword_view").html(data);
			}
			
		});
	}
    function projectDetail(pjo_code) {
        location.href = "../FTBC_DetailView/ProjectDetail.jsp?pjo_code="+pjo_code;
     }
</script>
</head>
<body>
<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
<hr class="Look_hr"width=100%>
<div class="container-fluid">
	<div id="keyword_view">

	
	</div>
</div>
</body>
</html>