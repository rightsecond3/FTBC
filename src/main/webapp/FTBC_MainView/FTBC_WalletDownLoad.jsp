<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인  </title>
<!--=============================================================================================
	EXE다운로드 페이지
	날짜:2019-10-04
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
</head>

<style type="text/css">
	.content{
		margin-left:0px !important;
	}
	
	#ExeDownLoad_page{
		margin-left:20px;
	}
	#imageBox{
		border-color:gainsboro;
		border: 2px solid #e4e4e4;
		width:400px;
		height:auto;
		position:relative;
		margin-top:20px;
		top:25%;
		left:25%;
		display:inline-block;
		text-align: center;
		border-radius: 5px;
	}
	#exelogo{
		width:100%;
	}
	
	#exeDownLoad{
		margin-top: 30px;
		color:#FFFFFF;
		background-color: #635c9f;
		width: 80%;
		padding: 5px;
		border: none;
		text-align: center;
		display: inline-block;
		text-decoration: none;
		margin: 15px;
		font-size: 20px;
		border-radius:5px;
		padding-top: 5px;
		padding-bottom: 5px;
		height: 50px;
		font-weight: bold;
	}
	.footer{
		margin-top: 100px;
	}
</style>
<body>
<script type="text/javascript">

</script>

<div class="container-fluid">
	<div id="top_MenuBar">
		<%@ include file="../FTBC_Common/TopMenuBar.jsp"%>
	</div>
	<div class="row content">
		<div class="col-sm-3 ">&nbsp;</div>
		<div class="col-sm-6 " id="ExeDownLoad_page">
			<div id="imageBox">
				<img src="../FTBC_Images/exelogo.png" id="exelogo">
				<input type="button" id="exeDownLoad" value="다운로드">
			</div>
			
		</div>
		<div class="col-sm-3 ">&nbsp;</div>
	</div>
	<div class="row footer">
		<%@ include file="../FTBC_Common/FTBC_Footer.jsp"%>
	</div>
</div>

</body>
</html>