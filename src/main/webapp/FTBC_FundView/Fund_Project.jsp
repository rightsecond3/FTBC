<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FTBC</title>
<!--=============================================================================================
	펀딩 페이지
	얼마짜리 펀딩할건지 선택 하는 페이지
	날짜:2019-09-20
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="Fund_Project.css?chuu2">
</head>
<body>
<script type="text/javascript">
	function pay(){
		location.href="Pay_Project.jsp"		
	}
	function fundThis(id){
		$(".Fund_Panel").show();
		$("#"+id).hide();
		$(".Fund_Panel_Reward").hide();
		$("#"+id+"_reward").show();
	}
	
	/*숫자키 누르고 다른거 눌러야 적용됨.  */
	function valueCheck(value,num){
		var fundval  = Number($("#reward_val"+num).text().replace(",","")); //리워드 가격
		var pvalue = Number(value.replace(",",""));
		console.log("fundval: " + fundval);
		if(fundval > pvalue){ //입력한 값이 리워드 가격보다  작을경우
			console.log("@"+fundval + " : " +pvalue+"@" );
			$("#reward_notice"+num).text("최소 "+ fundval +"원 이상 입력해주세요")
			$("#reward_notice"+num).css("color", "#FF0000");
		}else{
			$("#reward_notice"+num).text("더 많이 입력하실 수 있습니다")
			$("#reward_notice"+num).css("color", "#4B82F0");
		}
	}
	function valStop(){
		event.stopPropagation();
	}

	$(document).ready(function() {
		$(".Fund_Panel_Reward").hide();
		
	});
</script>
<div id="FundTop_bar">
	<span id="Fund_title">Do It Amazing D.I.A </span>
</div>
<div class="container-fluid">
	 
	 <!--================================================================================================================
	 												[  	  내용	]
	 ================================================================================================================-->
	
	<!--------------- 1번  상품----------------->
	 <div class="row Fund_Panel" id="fund_default0" onclick="fundThis(id)">
	 	<div class="Fund_Header">
	 		<span id="reward_val0">1,000</span><span>원 이상 밀어주시는 분께</span>
	 	</div>
	 	<div class="Fund_Body">
	 		<span>선물을 선택하지 않고, 밀어만 줍니다</span>
	 	</div>
	 </div>
	 
	 <!--------------- 1번  상품 리워드----------------->
	  <div class="row Fund_Panel_Reward" id="fund_default0_reward" >
	 	<div class="Fund_Header">
	 		<input type="text" class="fund_valbox" value="1,000"  onkeyup="valueCheck(value,0)"  onclick="valStop()"><span>원</span>
	 		<a><img src="../FTBC_Images/fundbtn.png"></a>
	 	</div>
	 	<div class="Fund_Body">
	 		<span class="reward_notice" id="reward_notice0">더 많이 입력하실 수 있습니다</span>
	 		<br><span>선물을 선택하지 않고, 밀어만 줍니다</span>
	 	</div>
	 </div>
	 
	 
	 <!--------------- 2번  상품----------------->
	  <div class="row Fund_Panel"  id="fund_default1" onclick="fundThis(id)">
	 	<div class="Fund_Header">
	 		<span id="reward_val1">35,000</span><span>원 이상 밀어주시는 분께</span>
	 	</div>
	 	<div class="Fund_Body">
	 		<span>배송비 포함</span>
	 		<ul>
	 			<li>앨범(x1)</li>
	 			<li>포토카드 (x2)</li>
	 		</ul>
	 	</div>
	 	<div class="Fund_Footer">
	 		<span class="Footer_num">1,881</span><span>명이 선택하였습니다</span>
	 		<br><span>예상 전달일:2019년 10월 4일</span>
	 	</div>
	 </div>
	
	<!--------------- 2번  상품 리워드----------------->
	  <div class="row Fund_Panel_Reward" id="fund_default1_reward" >
	 	<div class="Fund_Header">
	 		<input type="text" class="fund_valbox" value="35,000" onkeyup="valueCheck(value,1)" onchange="valStop()"><span>원</span>
	 		<a href="javascript:pay()"><img src="../FTBC_Images/fundbtn.png"></a>
	 	</div>
	 	<div class="Fund_Body">
	 		<span class="reward_notice"  id="reward_notice1" >더 많이 입력하실 수 있습니다</span>
	 		<br><span>배송비 포함</span>
	 		<ul>
	 			<li>앨범(x1)</li>
	 			<li>포토카드 (x2)</li>
	 		</ul>
	 	</div>
	 	<div class="Fund_Footer">
	 		<span class="Footer_num">1,881</span><span>명이 선택하였습니다</span>
	 		<br><span>예상 전달일:2019년 10월 4일</span>
	 	</div>
	 </div>
	
	
	 <!--------------- 3번  상품----------------->
	  <div class="row Fund_Panel">
	 	<div class="Fund_Header">
	 		<span>55,000</span><span>원 이상 밀어주시는 분께</span>
	 	</div>
	 	<div class="Fund_Body">
	 		<span>배송비 포함</span>
	 		<ul>
	 			<li>앨범(x1)</li>
	 			<li>응원봉 (x1)</li>
	 			<li>포토카드 (x2)</li>
	 		</ul>
	 	</div>
	 	<div class="Fund_Footer">
	 		<span class="Footer_num">1,881</span><span>명이 선택하였습니다</span>
	 		<br><span>예상 전달일:2019년 10월 4일</span>
	 	</div>
	 </div>
	 
	   <div class="row Fund_Panel">
	 	<div class="Fund_Header">
	 		<span>75,000</span><span>원 이상 밀어주시는 분께</span>
	 	</div>
	 	<div class="Fund_Body">
	 		<span>배송비 포함</span>
	 		<ul>
	 			<li>앨범(x1)</li>
	 			<li>응원봉 (x1)</li>
	 			<li>슬로건 (x1)</li>
	 			<li>포토카드 (x5)</li>
	 		</ul>
	 	</div>
	 	<div class="Fund_Footer">
	 		<span class="Footer_num">1,881</span><span>명이 선택하였습니다</span>
	 		<br><span>예상 전달일:2019년 10월 4일</span>
	 	</div>
	 </div>
</div>
</body>
</html>