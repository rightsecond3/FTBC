<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="vo.ProjectVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
	Map<String, Object> mainProjects =(Map<String, Object>)request.getAttribute("mainProjects");
	List<ProjectVO> popularProjects = (List<ProjectVO>)mainProjects.get("popularProject");
	List<ProjectVO> recommnadProjects = (List<ProjectVO>)mainProjects.get("recommnadProject");
	List<Object> list = new ArrayList();
	list.add(popularProjects);
	list.add(recommnadProjects);
	Gson g = new Gson();
	String a = g.toJson(popularProjects);
	out.print(a);
	
%> --%>

<%
	Map<String, Object> mainProjects =(Map<String, Object>)request.getAttribute("mainProjects");
	List<ProjectVO> popularProjects = (List<ProjectVO>)mainProjects.get("popularProject");
	List<ProjectVO> recommnadProjects = (List<ProjectVO>)mainProjects.get("recommnadProject");
%>
				<div class="row main_row">
				<span class="main_span" id="popular_pjs"> 인기 프로젝트 <i class="fa fa-caret-right"></i> </span>
				</div>
				<div id="popularProjects">
				<div class="row">
<%
				for(int i=0;i<4;i++){
					ProjectVO pVO = popularProjects.get(i);
				
%>
					<div class="card col-xs-3" onclick="projectDetail('<%=pVO.getProject_code()%>')">
						<div class="card-header">
							<img src="<%=pVO.getPjo_img()%>"class="card_img"> 
						</div>
						<div class="card-body">
<%-- 							<input type="hidden" id="Project_code" name="Project_code" value="<%=pVO.getProject_code()%>"> --%>
							<span class="card-text project_title"><%=pVO.getPjo_longtitle()%></span> 
							<span class="card-text project_nick"><%=pVO.getMem_nickname()%></span>
							<hr width=<%=i*10%>% align="left" class="card_hr">
							<span class="card-text project_date col-xs-5">1000일 남음</span> 
							<span class="card-text project_cost col-xs-7">100,000원 50%</span>
						</div>
					</div>
<%
}
%>					
				</div>
				<!-- end 인기 프로젝트=================================== -->
				
				<div class="row main_row">
				<span class="main_span"> 추천 프로젝트 <i class="fa fa-caret-right"></i> </span>
				</div>
				<div class="row">
<%
				for(int i=0;i<4;i++){
					ProjectVO pVO = recommnadProjects.get(i);
				
%>
					<div class="card col-xs-3" onclick="projectDetail()">
						<div class="card-header">
							<img src="<%=pVO.getPjo_img()%>"class="card_img"> 
						</div>
						<div class="card-body">
							<span class="card-text project_title"><%=pVO.getPjo_longtitle()%></span> 
							<span class="card-text project_nick"><%=pVO.getMem_nickname()%></span>
							<hr width=<%=i*10%>% align="left" class="card_hr">
							<span class="card-text project_date col-xs-5">1000일 남음</span> 
							<span class="card-text project_cost col-xs-7">100,000원 50%</span>
						</div>
					</div>
<%
}
%>	
				</div>					
				<!-- end 추천 프로젝트=================================== -->
				<div class="row main_row">
				<span class="main_span"> 성공 임박 프로젝트 <i class="fa fa-caret-right"></i> </span>
				</div>
				<div class="row">
<%
				for(int i=0;i<4;i++){
					ProjectVO pVO = recommnadProjects.get(i);
				
%>
					<div class="card col-xs-3" onclick="projectDetail()">
						<div class="card-header">
							<img src="<%=pVO.getPjo_img()%>"class="card_img"> 
						</div>
						<div class="card-body">
							<span class="card-text project_title"><%=pVO.getPjo_longtitle()%></span> 
							<span class="card-text project_nick"><%=pVO.getMem_nickname()%></span>
							<hr width=<%=i*10%>% align="left" class="card_hr">
							<span class="card-text project_date col-xs-5">1000일 남음</span> 
							<span class="card-text project_cost col-xs-7">100,000원 50%</span>
						</div>
					</div>
<%
}
%>	
				</div>	
								