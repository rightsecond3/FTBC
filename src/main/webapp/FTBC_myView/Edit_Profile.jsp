<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--=============================================================================================
	프로필 설정페이지
	날짜:2019-09-19
================================================================================================  -->
<link rel="stylesheet" type="text/css" href="Edit_Profile.css?2">
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
</head>
<body>
<!-- 내가 만든 프로젝트 페이지는 상단바 바뀌어야함.  -->
<%@ include file="../FTBC_Common/TopMenuBar_OnlyLogo.jsp"%>
<div class="container-fluid">
	<!--  상단 부분  -->
	<div class="row" id="EditProfile_top">
		<div class="col-xs-3">&nbsp;</div>
		<div class="col-xs-3">
			<h2>프로필 설정</h2>
		</div>
		<div class="col-xs-3" >
			<div id="EditProfile_a" class="EditProfile_a">
				<a>프로필 설정</a>
				<a href="Edit_Account.jsp">계정 설정</a>
				<a>지불 정보 설정</a>
			</div>
		</div>
		<div class="col-xs-3">&nbsp;</div>
	</div>
	<!--  내용 부분 -->
	<div class="row" id="EditProfile_content">
		<div class="col-xs-3">&nbsp;</div>
		<div class="col-xs-4"> 
			<!--============[  프로필   사진   ]===========-->
			<div id="edit_img" class="row edit_d">
				<div class="col-xs-2 labelbox" id="div_pfimg"><label>프로필 사진</label> </div>
				<div class="col-xs-2"><img id="img_icon" src="<%=session.getAttribute("mem_pfimg").toString()%>"></div>
				<div class="col-xs-8">
					<div class="row">
						<input type="file" value="파일 선택" id="edit_filebox">
					</div>
					<div class="row"> 
						<span id="file_exp">사이즈는 가로 200px, 세로 250px에 최적화 되어 있으며 jpg,gif,png파일을 지원합니다.</span>
					</div>
				 </div>
			</div >
			
			<!--============[  프로필   이름   ]===========-->
			<div id="edit_name" class="row edit_d">
				<div class="col-xs-2 labelbox" ><label>이름</label></div>
				<div class="col-xs-10">
					<input type="text" class="edit_txtbox" id="name_tbox">
				</div>
			</div>
			
			<!--============[  프로필   지역   ]===========-->
			<div id="edit_loc" class="row edit_d">
				<div class="col-xs-2 labelbox" ><label>지역</label> </div>
				<div class="col-xs-10">
					<input type="text" class="fa edit_txtbox" id="loc_tbox">
				</div>
			</div>
			
			<!--============[  프로필   소개   ]===========-->
			<div id="edit_info" class="row edit_d">
				<div class="col-xs-2 labelbox" ><label>소개</label> </div>
				<div class="col-xs-10">
					<div class="row">
						<input type="text" class="edit_txtbox" id="info_tbox">
					</div>
					<div class="row">
						<p>300자 이내의 자기 소개를 입력해 주세요</p>
					</div>
				</div>
			</div>
			
			<!--============[  프로필   웹사이트   ]===========-->
			<div id="edit_web" class="row edit_d">
				<div class="col-xs-2 labelbox" ><label>웹사이트</label></div>
				<div class="col-xs-10">
					<div class="row">
						<input type="text" class="edit_txtbox" id="web_tbox">
					</div>
					<div class="row">
						<p>웹사이트가 있다면 주소를 입력해주세요.</p>
					</div>
				</div>
			</div>
			
			<!--============[  프로필   전화번호  ]===========-->
			<div id="edit_phone" class="row edit_d">
				<div class="col-xs-2 labelbox" ><label>전화번호</label> </div>
				<div class="col-xs-10">
					<div class="row" id="phone_boxs">
						<input type="text" class="edit_txtbox">
						<input type="text" class="edit_txtbox">
						<input type="text" class="edit_txtbox">
					</div>
					<div class="row">
						<p>전화번호를 입력해 주세요. 밀어주기 및 후원 선물 배송 시 연락을 위해 사용됩니다.</p>
					</div>
				</div>
			</div>
			
			<!--============[  프로필   수정하기 버튼   ]===========-->
			<div id="edit_btnd" class="row edit_d">
				<div class="col-xs-2 labelbox" ><label>&nbsp;</label> </div>
				<input type="button"  value="수정하기  "  id="edit_button">
			</div>
		</div>
		
		<div class="col-xs-2">
		<!--============[  프로필   카드 미리보기    ]===========-->
			<div class="card" id="pf_preview">
				<div class="card-header">
					<h5>프로필 카드 미리보기</h5>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-xs-4" >
							<img id="img_preview" src="../FTBC_Images/avatar.png">
						</div>
						<div class="col-xs-8" >
							<a><h4 id="name_preview">이름</h4></a>
							<p>
							<img id="loc_icon" src="../FTBC_Images/location-pin.png">
							지역정보가 없음
							</p>
						</div>
					</div>
				</div>
				<div class="card-footer">	
					<a href="FundedProject.jsp">자세히 보기</a>			   
				</div>
			</div>
		</div>
		<div class="col-xs-3">&nbsp;</div>
	</div>
</div>

</body>
</html>