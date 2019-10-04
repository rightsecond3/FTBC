<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블록체인 메인</title>
<!--=============================================================================================
	블록체인 메인  페이지  
	날짜:2019-09-19
	참고 페이지
	테이블 로우별 이벤트 https://stackoverflow.com/questions/31617328/how-get-td-click-event-from-bootstrap-table 
				   http://jsfiddle.net/oh16h7cj/
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="BlockChain_Main.css?yena">
</head>
<body>
<script type="text/javascript">
	// table row 이벤트
	function addRowHandlers() {
	    var table = document.getElementById("BlockChain_Table");
	    var rows = table.getElementsByTagName("tr");
	    for (i = 0; i < rows.length; i++) {
	        var currentRow = table.rows[i];
	        var createClickHandler = 
	            function(row) 
	            {
		                return function() { 
		                var cell = row.getElementsByTagName("td")[0];
		                var id = cell.innerHTML;
		                alert("id:" + id);
		                location.href="Block_Detail.jsp";
		                 
		                };
	            };
	
	        currentRow.onclick = createClickHandler(currentRow);
	    }
	}
	$(document).ready(function(){
		addRowHandlers();
	 });
	
</script>
	<%@ include file="../FTBC_Common/TopMenuBar.jsp"%>
	<div class="container-fluid">
		<!--  상단 부분  -->
		<div class="row" id="BlockChain_banner">
			<div class="col-xs-3">&nbsp;</div>
			<div class="col-xs-3">
				<h2>블록 체인<img src="../FTBC_Images/blockchainicon.png"></h2>
			</div>
			<div class="col-xs-3" >
			<!-- 	<div id="EditAccount_a" class="EditAccount_a">
					<a href="Edit_Profile.jsp">프로필 설정</a>
					<a>계정 설정</a>
					<a>지불 정보 설정</a>
				</div> -->
			</div>
			<div class="col-xs-3">&nbsp;</div>
		</div>
		
		<!--내용 부분  -->
		<div id="BlockMain_empty"class="row"></div>
		<div class="row">
			<div id="Block_left" class="col-sm-2">&nbsp;</div>
			<div id="Blcok_Center" class="col-sm-8">
				<!-----------검색바  ----------- -->	
				<div class="block_search">
					<input class="search" id="keyword" type="text"
						value=" Search for things like address, transaction, block"
						onfocus="this.value=''"
						onblur="if(this.value=='')this.value='블록 검색'">
						 <input	id="search_btn" type="button" onclick="">
				</div>
				<div class="row">
					<h2>최신 블록</h2>
					<!-----------테이블 BlockChain_List로 갈 부분  ----------- -->
					<table class="table" id="BlockChain_Table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">First</th>
								<th scope="col">Last</th>
								<th scope="col">Handle</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>Mark</td>
								<td>Otto</td>
								<td>@mdo</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Jacob</td>
								<td>Thornton</td>
								<td>@fat</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Larry</td>
								<td>the Bird</td>
								<td>@twitter</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-----------테이블 ----------- -->
			</div>
			<div id="Block_Right" class="col-sm-2">&nbsp;</div>
		</div>
	</div>

</body>
</html>