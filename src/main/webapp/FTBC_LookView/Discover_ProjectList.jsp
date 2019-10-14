<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="vo.ProjectVO"%>
<%
	List<ProjectVO> List = null; 
	ProjectVO p = null;
	if(request.getAttribute("projectList")!=null){
		List =	(List<ProjectVO>)request.getAttribute("projectList");
		if(List.size()>0){
		p = List.get(0);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FTBC</title>
<!--=============================================================================================
	키워드별 프로젝트 리스트
	날짜:2019-09-12
================================================================================================  -->
<!--상단 부분  -->
	<!-- 내용 -->
	<div class="Look_Content">
		<div class="col-xs-2"></div>
		<div class="col-xs-8">
<%
				for(int i=0;i<List.size();i++){
					ProjectVO pVO = List.get(i);
%>
			<div class="card col-xs-3" onclick="projectDetail('<%=pVO.getProject_code()%>')">
						<div class="card-header">
							<img src="<%=pVO.getPjo_img()%>"class="card_img"> 
						</div>
						<div class="card-body">
							<span class="card-text project_title"><%=pVO.getPjo_longtitle()%></span> 
							<span class="card-text project_nick"><%=pVO.getMem_nickname()%></span>
							<hr width=<%=(long)((Double.valueOf(pVO.getFundedMoney())/Double.valueOf(pVO.getFd_targetMoney()))*100)%>% align="left" class="card_hr">
							<span class="card-text project_date col-xs-5"><%=pVO.getOutLine() %>일 남음</span> 
							<span class="card-text project_cost col-xs-7"><%=pVO.getFundedMoney()%> <%=(long)((Double.valueOf(pVO.getFundedMoney())/Double.valueOf(pVO.getFd_targetMoney()))*100)%>%</span>
						</div>
					</div>
<%
}
%>			
			
		</div>
		<div class="col-xs-2"></div>
	</div>
<%
		}else{
%>
	
<%			
		}
	}
%>	
	
	
	
	