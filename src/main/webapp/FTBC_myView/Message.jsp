<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FTBC</title>
<!--=============================================================================================
	메세지 페이지 
	날짜:2019-09-16
================================================================================================  -->
<link rel="stylesheet" type="text/css" href="Message.css">
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
</head>
<body>
<script type="text/javascript">
	function msgBtn(btn_id){
		$(".msg_btn").css("background-color", "white");
		$(".msg_btn").css("color", "gray");
		$("#"+btn_id).css("background-color", "gainsboro");
		$("#"+btn_id).css("color", "#3A6FF2");
		console.log("btn_id " + btn_id);
		if(btn_id =="uunread_btn"){
			$("#u_content1").hide();
			$("#u_content2").show();
		}else if( btn_id =="munread_btn"){
			$("#m_content1").hide();
			$("#m_content2").show();
		}else if(btn_id =="uall_btn" || btn_id=="usent_btn"){
			$("#u_content2").hide();
			$("#u_content1").show();
		}else if(btn_id =="mall_btn" || btn_id=="msent_btn"){
			$("#m_content2").hide();
			$("#m_content1").show();
		}
		
	}
	$(document).ready(function() {
		$("#uall_btn").css("background-color", "gainsboro");
		$("#uall_btn").css("color", "#3A6FF2");
		$("#u_content2").hide();
		$("#m_content2").hide();
	});
</script>


<!----------------상단바------------>
<%@ include file="../FTBC_Common/TopMenuBar.jsp"%>
<hr class="FTBC_hr" >
<div class="container-fluid">
	<!--상단 배너 부분 -->
	<div class="row"  id="MessageBanner" >
		<div class="col-xs-3 banner_side"></div>
		<div class="col-xs-7">
		<div id="floater">&nbsp;</div>
		<div class="row"  id="msgBanner_top">
			<img src="../FTBC_Images/messageicondark.png" id="msg_dark">
			<span id="msg_title">메시지</span>
		</div>
		<ul class="nav nav-tabs" id="#msgBanner_tab">
			<li class="active"><a class="tab_menu" data-toggle="tab" href="#ur_project">문의/후원 프로젝트</a></li>
			<li><a class="tab_menu" data-toggle="tab" href="#my_project">만든 프로젝트</a></li>
		</ul>
		</div>
		<div class="col-xs-2 banner_side"></div>
		
		<!--배너 밑 부분 -->
		<div class="col-xs-3"></div>
		<div class="col-xs-7">	
			<div class="tab-content">
			
				<!-- 문의/후원한 프로젝트  -->
				<div id="ur_project" class="tab-pane fade in active">
					<div class="row">
						<div class="col-xs-6 msg_btns">
							<input onclick="msgBtn(id)"id="uall_btn" class="msg_btn" type="button" value="모든 메세지">
							<input onclick="msgBtn(id)" id="usent_btn" class="msg_btn" type="button" value="보낸 메세지">
							<input onclick="msgBtn(id)" id="uunread_btn" class="msg_btn" type="button" value="안 읽은 메세지">
						</div>
					</div>
					<div class="row" id="ur_msg">
						<div id="u_content1" class="msg_content">
							<img src="../FTBC_Images/messageiconlt.png" id="msg_lt">
							<h3>새로운 메시지가 없습니다</h3>
							<p>프로젝트 페이지에서 '문의하기' 버튼을 눌러 <br>메세지를 보낼 수 있습니다.</p>
						</div>
						<div id="u_content2" class="msg_content">
							<img src="../FTBC_Images/messageiconlt.png" id="msg_lt">
							<h3>새로운 메시지가 없습니다</h3>
						</div>
					</div>
				</div>
				
				<!-- 만든 프로젝트  -->
				
				<div id="my_project" class="tab-pane fade">
					<div class="row">
						<div class="col-xs-6 msg_btns">
							<input onclick="msgBtn(id)" id="mall_btn" class="msg_btn" type="button" value="모든 메세지">
							<input onclick="msgBtn(id)" id="msent_btn" class="msg_btn" type="button" value="보낸 메세지">
							<input onclick="msgBtn(id)" id="munread_btn" class="msg_btn" type="button" value="안 읽은 메세지">
						</div>
					</div>
					<div class="row" id="my_msg">
					<div id="m_content1" class="msg_content">
						<img src="../FTBC_Images/messageiconlt.png" id="msg_lt">
						<h3>새로운 메시지가 없습니다</h3>
						<p>프로젝트 페이지에서 '문의하기' 버튼을 눌러 <br>메세지를 보낼 수 있습니다.</p>
					</div>
					<div id="m_content2" class="msg_content">
						<img src="../FTBC_Images/messageiconlt.png" id="msg_lt">
						<h3>새로운 메시지가 없습니다</h3>
					</div>
					</div>
				</div>	
			</div>
		</div>
		<div class="col-xs-2"></div>
	</div>
</div>		 
</body>
</html>