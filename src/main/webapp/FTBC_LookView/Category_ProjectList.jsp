<%@page import="java.util.List"%>
<%@page import="vo.ProjectVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ProjectVO> List = null; 
	ProjectVO p = null;
	String cat = request.getAttribute("cat").toString();
	if(request.getAttribute("projectList")!=null){
		List =	(List<ProjectVO>)request.getAttribute("projectList");
		if(List.size()>0){
		p = List.get(0);
%>

<!--=============================================================================================
	카테고리별 프로젝트 리스트
	날짜:2019-09-12
================================================================================================  -->

	<!--상단 부분  -->
	<div class="row Look_Top" id="Category_top">
	
		<div>
		 <a  class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		<h1 class="Look_title" ><%=cat%>
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
						<div class="card-body" style="height: 150px;">
							<span class="card-text project_title" style="height: 46px;"><%=pVO.getPjo_longtitle()%></span> 
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
		<div class="col-xs-2"></div>
	</div>
	
<%
		}else{
	
%>
	<!--상단 부분  -->
	<div class="row Look_Top" id="Category_top">
	
		<div>
		 <a  class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		<h1 class="Look_title" ><%=cat %>
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
	
	

	
<%
	}
		}
%>