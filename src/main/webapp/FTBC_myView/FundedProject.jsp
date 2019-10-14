<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--=============================================================================================
	내 후원현황 페이지
	날짜:2019-09-18
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="FundedProject.css?refresh">
</head>
<body>
<script type="text/javascript">
	function FpjbtnActive(id){
		$(".Fpj_btns").css("color", "#000000");
		$(".Fpj_btns").css("background-color", "transparent");
		$(".Fpj_num").css("background-color", "#999999");
		
		$("#"+id).css("color", "#3A6FF2");
		$("#"+id).css("background-color", "#DDDDDD");
		$("#"+id+"_num").css("background-color", "#3A6FF2");
		
		$(".Fpj_count").hide();
		$("#"+id+"_cnt").show();
		
	}
	$(document).ready(function() {
		$("#Fpj_all").css("color", "#3A6FF2");
		$("#Fpj_all").css("background-color", "#DDDDDD");
		$("#Fpj_all_num").css("background-color", "#3A6FF2");
		$("#Fpj_ing_cnt").hide();
		$("#Fpj_done_cnt").hide();
	});
</script>
<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
 <hr width=110%>
<div class="container-fluid">
	<div class="row" id="FundedProject_top">
		<div class="row" id="FundedProject_ele">
			<img src="<%=session.getAttribute("mem_pfimg").toString() %>" id="Fpj_pfimg">
			<h3><span id="Funded_mem_name"><%=session.getAttribute("mem_name").toString() %></span>님의  후원 현황 </h3>
		</div>
	</div>
	<div class="row" id="FundedProject_content">
		<div class="col-xs-2">&nbsp;</div>
		<div class="col-xs-8">
			<!-- Content 상단 버튼 & 검색바  -->
			<div class="row" id="Fpj_content_top">
				<div class="col-xs-6" id="Fpj_content_btns">
					<a id="Fpj_all" class="col-xs-3 Fpj_btns" onclick="FpjbtnActive(id)">
					모두 보기<div class="Fpj_num" id="Fpj_all_num"> 0 </div>
					 </a>
					<a id="Fpj_ing" class="col-xs-3 Fpj_btns" onclick="FpjbtnActive(id)">
					펀딩 진행중 <div class="Fpj_num" id="Fpj_ing_num" > 0 </div>
					</a>
					<a id="Fpj_done" class="col-xs-3 Fpj_btns"  onclick="FpjbtnActive(id)">
					결제 완료    <div class="Fpj_num" id="Fpj_done_num"> 0 </div>
					</a>
				</div>
				<div class="col-xs-6" id="Fpj_content_sbar">
					<input id="Fpj_search" type="text" placeholder="프로젝트,선물, 창작자를 검색하세요" >
					<input id="Fpj_search_btn" type="button" onclick="">
				</div>
			</div>
			
			<div class="row Fpj_count"  id="Fpj_all_cnt">
				<i class="fa fa-list"></i>총 <span>0</span>건의 후원 결과가 있습니다
			</div>
			
			<div class="row Fpj_count"  id="Fpj_ing_cnt">
				<i class="fa fa-spinner"></i>총 <span>0</span>건의 펀딩 진행중인 후원이 있습니다
			</div>
			
			<div class="row Fpj_count"  id="Fpj_done_cnt">
				<i class="fa fa-money"></i>총 <span>0</span>건의 결제 완료된 후원이 있습니다
			</div>
		</div>
		<div class="col-xs-2">&nbsp;</div>
	</div>
</div>
</body>
</html>