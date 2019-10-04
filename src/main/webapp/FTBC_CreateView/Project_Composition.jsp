<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<% 	 //List<Map<String,Object>> giftList
			//= (List<Map<String,Object>>)request.getAttribute("giftList");
	String payEndDate= "아직 만들지 않음1.";//결제종료일
   	String mReceiveDate="아직 만들지 않음2.";//돈 예상 정산일
   	String gReceiveDate="아직만들지 않음3.";//선물 예상전달일
   	String FundingEndDate = "아직 만들지 않음4.";//펀딩종료일(프로젝트마감일)
   	String giftExplain = "아직 설명하지 않음.";//선물구성 중 상세설명
   	int goalMoney =0;//목표금액
   	int giftMoney = 0;//선물금액
   	int choiceCount = 1;//이 선물에 펀딩한 사람 수
   	String limitedCount = "123";//한정판인경우 남은갯수 //항목선택을 하지않으면 0이 담기도록 설정해야함.
   	int giftPrice = 0;
   	int giftQuantity = 0;
%>
<meta charset="UTF-8">
<title>프로젝트 만들기 ::FTBC</title>
<!--=============================================================================================
	펀딩 및 선물 구성
	09/15 작업중.씨1팔 잘못했네.form을 show해서 보여진 창에서 입력한것을 val로 그대로 가져오는것뿐. 
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script> -->
<script>
 window.onload = function(){ //datepicker에 today 디폴트값으로 넣기
	 	var dt = new Date();
	    var Year = dt.getFullYear();        
	    var Month = "" + (dt.getMonth()+1);
	    var Day = "" + dt.getDate();
	    if(Month.length < 2) Month = "0" + Month;
	    if(Day.length < 2) Day = "0" + Day;
	    var Today = Year.toString()+"년 "+Month+"월 "+Day+"일";
	    document.getElementById("datepicker").value = Today;
} 
	function giftAdd(){ //일단 테스트용 호출함수
		alert("테스트");
	}
	function paymentEndDate(){//결제종료일 7일 뒤 날짜 계산해서 넣어주는 코드.
		ReceiptEstimatedDate();
		var stDate = $("#datepicker").val();
		var split = stDate.split("-");
		var yy = Number(split[0]);
		var mm = Number(split[1]);
		var dd = Number(split[2]);
		if(mm<=7){//1~7월
			if(mm%2==1){//홀수달
				if(dd>24){//25일 ~
					dd=7-(31-dd);
					mm=mm+1;
				}else{
					dd=dd+7;
				}
			}
				else{//짝수달
					if(mm==2){//2월인경우
						if(yy%4==0){//윤년인경우
							if(dd>22){
								dd=7-(29-dd);
								mm=mm+1;
							}else{
								dd=dd+7;
							}
						}else{//일반 년도
							if(dd>21){
								dd=7-(28-dd);
								mm=mm+1;
							}else{
								dd=dd+7;
							}
						}
					}
					else{//4,6월인경우
						if(dd>24){
						dd=7-(30-dd);
						mm=mm+1;							
					}else{
						dd=dd+7;
					}
				}
			}
		}else{//8~12월
			if(mm%2==1){//9,11월
				if(dd>23){
					dd=8-(31-dd);
					mm=mm+1;
				}else{
					dd=dd+7;
				}
			}else{//8,10,12월 일 경우
				if(mm==12){//12월일경우
					if(dd>24){
						dd=7-(31-dd);
						mm=1;
					}else{
						dd=dd+7;
					}
				}else{//8,10월일 경우
					if(dd>24){
						dd=7-(31-dd);
						mm=mm+1;
					}
					else{
						dd=dd+7;
					}
				}//////////8,10월일경우 else 끝
			}//////////////8,10,12월일 경우 else 끝
		}//////////////////8~12월일 경우 else 끝
		var payEndDate =yy+"년"+mm+"월"+dd+"일";
		document.getElementById("payEndDate").value=payEndDate;
		
	};
	function ReceiptEstimatedDate(){
		var stDate = $("#datepicker").val();
		var split = stDate.split("-");
		var yy = Number(split[0]);
		var mm = Number(split[1]);
		var dd = Number(split[2]);
		if(mm<=7){//1~7월
			if(mm%2==1){//홀수달
				if(dd>17){//25일 ~
					dd=14-(31-dd);
					mm=mm+1;
				}else{
					dd=dd+14;
				}
			}
				else{//짝수달
					if(mm==2){//2월인경우
						if(yy%4==0){//윤년인경우
							if(dd>15){
								dd=14-(29-dd);
								mm=mm+1;
							}else{
								dd=dd+14;
							}
						}else{//일반 년도
							if(dd>14){
								dd=14-(28-dd);
								mm=mm+1;
							}else{
								dd=dd+14;
							}
						}
					}
					else{//4,6월인경우
						if(dd>17){
						dd=14-(30-dd);
						mm=mm+1;							
					}else{
						dd=dd+14;
					}
				}
			}
		}else{//8~12월
			if(mm%2==1){//9,11월
				if(dd>16){
					dd=15-(31-dd);
					mm=mm+1;
				}else{
					dd=dd+14;
				}
			}else{//8,10,12월 일 경우
				if(mm==12){//12월일경우
					if(dd>17){
						dd=14-(31-dd);
						mm=1;
					}else{
						dd=dd+14;
					}
				}else{//8,10월일 경우
					if(dd>17){
						dd=14-(31-dd);
						mm=mm+1;
					}
					else{
						dd=dd+14;
					}
				}//////////8,10월일경우 else 끝
			}//////////////8,10,12월일 경우 else 끝
		}//////////////////8~12월일 경우 else 끝
		var receiptEstimateDate  =yy+"년"+mm+"월"+dd+"일";
		document.getElementById("receiptDate").value=receiptEstimateDate;
	}
</script>
<link rel="stylesheet" type="text/css" href="Project_Composition.css">
</head>
<body>
	<div id="top_MenuBar">
		<%@ include file="../FTBC_Common/TopMenuBar2.jsp"%>
	</div>

	<!-- ========================펀딩 및 선물 구성 프론트 시작 ======================-->
	<p>펀딩 목표 설정</p>
	<div id="goalMoney">
		<div class="row">
			<div class="col-xs-10">
				<label>&nbsp; 목표금액</label>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-10">
				<div><img src="../FTBC_Images/finger.png"></img>&nbsp; 목표 금액을 입력해주세요</div>
			</div>
			<div class="col-xs-2">
				<div><img src="../FTBC_Images/edit.png"></img>&nbsp; 입력하기</div>
			</div>
		</div>
	</div>
	<div id="projectEndDate">
		<div class="row">
			<div class="col-xs-10">
				<label>&nbsp; 프로젝트 마감일</label>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-10">
				<div><img src="../FTBC_Images/finger.png"></img>&nbsp; 프로젝트 마감일을 입력해주세요</div>
			</div>
			<div class="col-xs-2">
				<div><img src="../FTBC_Images/edit.png"></img>&nbsp; 입력하기</div>
			</div>
		</div>	
	</div>
	
	<p>예상 정산일</p>
	<div id="moneyEstimatedDate">
		<div class="row">
		
			<div class="col-xs-10">
				<label>&nbsp; 예상 정산일</label>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-10">
				<div>&nbsp; 마감일을 입력하시면 예상 정산일을 안내드립니다.</div>
			</div>
		</div>
	</div>
	
	<p>선물 구성</p>
		<div id="giftInfo">
			<div class="row">
				<div class="col-xs-3">
					<label>&nbsp; 5000원 이상 밀어주시는 분께</label>
				</div>
				<div class="col-xs-9" style="text-align:right;padding-right:90px">
					<div><a>삭제하기</a>&nbsp;&nbsp;&nbsp;<a>복제하기</a>&nbsp;&nbsp;&nbsp;<a><img src="../FTBC_Images/edit.png"></img>&nbsp;수정하기</a></div>			
				</div>
			</div>
			<div class="row">
				<div class="col-xs-10">
					<div>선물 설명</div>
				</div>
			</div>
			<ul>
				<li>giftName (x&nbsp;10)</li>
			</ul>
			<div class="row">
				<div class="col-xs-10">
					<div>예상전달일:2019년 09월 17일</div>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-xs-10">
					<div>○선택한 사람이 없음</div>
				</div>
			</div>
		</div>
		<div id="giftConfigAddBox">
			<div class="row">
				<div id="giftAddRow1"class="col-xs-12" >
					<label>&nbsp; 선물 추가하기</label>
				</div>
			</div>
			<div class="row">
				<div id="giftAddRow2" class="col-xs-12">
					<div>선물을 만들기 전에 프로젝트 마감일을 설정해주세요.</div>
					<input type="BUTTON" value="+추가하기" onclick="giftAdd()">
				</div>	
			</div>
		</div>
		
	<p>펀딩 안내</p>
		<div id="refundAndExchanges">
			<div class="row">
				<div class="col-xs-10">
					<label>&nbsp; 환불 및 교환 정책</label>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-xs-10">
						<div><a onclick="giftAdd()"><img src="../FTBC_Images/finger.png"></img></a><a onclick="giftAdd()">환불 및 교환 정책을 입력해주세요</a></div>
				</div>
				<div class="col-xs-2">
					<div><a onclick="giftAdd()"><img src="../FTBC_Images/edit.png"></img></a><a onclick="giftAdd()">&nbsp; 입력하기</a></div>
				</div>
			</div>
		</div>
		<div id="productInfoReport" >
			<div class="row">
				<div class="col-xs-10">
					<label>&nbsp; 상품 정보 고시</label>
				</div>
			</div>	
			<br>
			<div class="row">
				<div class="col-xs-10">
					<div><a onclick="giftAdd()"><img src="../FTBC_Images/finger.png"></img></a><a onclick="giftAdd()">후원자에게 선물을 제공하는 경우 전자상거래 등에서의 상품 등의 정보제공에 관한 고시법에 따라 상품 정보를 작성해 주세요.</a></div>
				</div>
				<div class="col-xs-2">
					<div><a onclick="giftAdd()"><img src="../FTBC_Images/edit.png"></img></a><a onclick="giftAdd()">&nbsp; 입력하기</a></div>
				</div>
			</div>		
		</div>
<!-- 		<div id="certificationDocument" >
			<div class="row">
				<div class="col-xs-10">
					<label>&nbsp; 인증 서류 제출</label>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-xs-10">
					<div><a onclick="giftAdd()"><img src="../FTBC_Images/finger.png"></img></a><a onclick="giftAdd()">인증서류를 등록해주세요</a></div>
				</div>
				<div class="col-xs-2">
					<div><a onclick="giftAdd()"><img src="../FTBC_Images/edit.png"></img></a><a onclick="giftAdd()">&nbsp; 업로드하기</a></div>
				</div>
			</div>
		</div> -->
		
	<!-- ========================펀딩 및 선물 구성 프론트 끝 ======================-->
	
	<!-- ===============================show 폼 시작==================================== -->
	<!-- ===============================목표금액 폼 시작=================================== -->
	<div id="goalMoneyShow">
		<div class="row">
				<label>&nbsp; 목표금액</label>
		</div>
		<div class="row">
			<div id="goalMoneyGuideTalk" class="col-xs-7">
				이번 프로젝트를 통해 모으고자 하는 펀딩 목표 금액이 얼마인가요?
				마감일 자정까지 목표 금액을 100% 이상 달성하셔야만 모인 후원금이 결제 됩니다.
				막판에 후원을 취소하는 후원자들도 있는 점을 감안해 10% 이상 초과 달성을 목표로 하시는게 안전합니다.
				(목표 금액은 제작비, 선물 배송비, 창작자의 인건비, 예비 비용 등을 고려하시기 바랍니다.)
			</div>
		</div>
		<div class="row">
			<div class=col-xs-6><input type="text" name="" value="150,000,000" id="goalMoneyInput">&nbsp;&nbsp;&nbsp;<label>원</label></div>
		</div>
		
		<div id="commissionCalculation">
			<div class="row">
				<div class="col-xs-9"><div class="glyphicon glyphicon-question-sign"></div>&nbsp;&nbsp;<b>수수료를 제외하면 얼마를 받을 수 있나요?</b></div>
			</div>
			<div class="row">
				<div class="col-xs-10">
					위 금액을 모으는데 성공하실 경우, <b>대략 100000000000 원 정도</b>를 받게 됩니다. 총 모금액에서 대략적으로
					아래와 같은 금액이 공제됩니다.
				</div>
			</div> 
			<div class="row">
				<div class="col-xs-6">
					<table>
						<thead>
							<tr>
								<th>항목</th>
								<th>금액</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>결제대행 수수료(3% + VAT)</td>
								<td><span></span>원</td>
							</tr>
							<tr>
								<td>플랫폼 수수료(5% + VAT)</td>
								<td><span></span>원</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<th><b>공제액 합계</b><sup>1</sup></th>
								<th><b><span></span></b><sup>2</sup></th>
							</tr>
						</tfoot>
					</table>
				</div>
				<div class="col-xs-6">
					<ol>
						<li>예상 공제액으로, 실제와는 약간의 차이가 있을 수 있습니다.</li>
						<li>목표 금액을 초과하더라도 수수료는 동일한 비율로 발생하며, 모든 수수료는 비용으로 처리하실 수 있도록
							세금계산서를 발행해드립니다.</li>
					</ol>
				</div>
			</div>
		</div>
		<div id="goalPriceButton">
			<button id="goalPriceCancelButton" onclick="giftAdd()" type="button" class="btn btn-default btn-lg">
				<i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;취소하기
			</button>
			<button id="goalPriceConfirmButton" onclick="giftAdd()" type="button" class="btn btn-default btn-lg">
				<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;저장하기
			</button>
		</div>
	</div>
		<!-- ===============================목표금액  끝 폼=================================== -->
		<!-- ===============================프로젝트 마감일  시작 폼=================================== -->
	<div id="projectEndDateShow">
		<div class="row">
				<label>&nbsp; 프로젝트 마감일</label>
		</div>
		<div class="row">
			<div class="col-xs-7" >
				펀딩이 끝나는 마감일을 정해주세요.
			</div>
		</div>
		<div id="endDateConfirmGuide">
			<div class="row">
				<div class="col-xs-6">
				<div><b>마감일을 정할 때 주의할 점</b></div>
				</div>
			</div>
			<div>펀딩 마감일은 오늘로부터 60일 이내의 날짜중에 고르실 수 있습니다. 이미 선물을 만드셨다면, 선물 실행일 중에
				 마감일보다 이른 날짜가 있지는 않은지 꼭 확인해주세요.</div>
		</div>
		<div class="row">
			<div class="cols-xs-8">
					  <input type="text" id="datepicker" onchange="paymentEndDate()">
					  <script>
					  	$("#datepicker").value=$("#datepicker").datepicker(
					  			{dateFormat: 'yy-mm-dd'
									//,minDate: 0,
									//maxDate: 60
									});
					  </script>
				<label>에 펀딩을 마감합니다.</label>
			</div>
		</div>
		<div id="goalPriceButton">
			<button id="goalPriceCancelButton" onclick="giftAdd()" type="button" class="btn btn-default btn-lg">
				<i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;취소하기
			</button>
			<button id="goalPriceConfirmButton" onclick="giftAdd()" type="button" class="btn btn-default btn-lg">
				<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;저장하기
			</button>
		</div>
	</div>
		<!-- ===============================프로젝트 마감일  끝 폼=================================== -->
		<!-- ===============================예상 정산일 show 폼 시작 ====================================-->
		<div id="moneyEstimatedDateShow" class="row">
			<div class="col-xs-8">
				<ul>
					<li><b>&nbsp; 결제 종료일:</b>펀딩에 성공할 경우 마감일 다음날부터 7일간 결제가 진행되어,<input id="payEndDate"/>&nbsp;모든 후원자의 결제가 종료됩니다. </li>
					<li><b>&nbsp; 예상 정산일:</b>결제 종료일로부터 7일 이후인(공휴일인 경우, 그 다음 영업일),<input id="receiptDate"/>&nbsp;에 창작자님의 계좌로 입금됩니다.</li>
				</ul>
			</div>
		</div>
		<!-- ===============================예상 정산일 show 폼  끝====================================-->
		<!-- ===============================선물구성 시작 폼=================================== -->
		
		<!-- ===============================선물구성 끝 폼=================================== -->
		<!-- ===============================환불 및 교환 정책 폼 시작=================================== -->
		
		<!-- ===============================환불 및 교환 정책 폼 끝=================================== -->
		<!-- ===============================상품 정보 고시=================================== -->
		
	<!-- ======================================show 폼 끝==================================== -->
	<!-- ========================펀딩 및 선물 구성 백앤드 시작====================== -->
	<%-- <div id="fundingAndGiftBack">
		<div>펀딩 목표 설정</div>
			<div id="FundingGoalSet">	
				<div>목표 금액
					<div><%=goalMoney %>원
						<div class="glyphicon glyphicon-pencil">수정하기</div>
					</div>
				</div>
				<div>프로젝트 마감일
					<div><%=FundingEndDate %>
						<div class="glyphicon glyphicon-pencil">수정하기</div>
					</div>
				</div>
			</div>	
		<div>예상 정산일</div>
			<div id="moneyEstimatedDate">
				<div><b>결제 종료일:</b>펀딩에 성공할 경우 마감일 다음날부터 7일간 결제가 진행되어, <%=payEndDate %> 모든 후원자의 결제가 종료됩니다.</div>
				<div><b>예상 정산일:</b>결제 종료일로부터(공휴일 및 주말 제외한 영업일 기준) 7일 이후인, <%=mReceiveDate %>에 창작자님의 계좌로 입금됩니다.</div>
			</div>
		<div>선물 구성</div>
			<div id="giftConfigure">
				<div><%=giftMoney %>원 이상 밀어주시는 분께
						<a>삭제하기</a>
						<a>복제하기</a>
						<a>수정하기</a>
				</div>
				<div><%=giftExplain %></div>
				<ul>
					<%for(int i=0;i<giftList.size();i++){%>
					<li>giftName</li>
					<%}%>
				</ul>
				<div>예상전달일:<%=gReceiveDate %></div>
				<hr>
				<%if(choiceCount>0){if(limitedCount==null){//선택한사람이 있으면서,한정판이 아닌경우%>
				<div><%=choiceCount %>명이 선택하였습니다.</div>
				<%}else{//한정판인 경우 %>
				<div><%=choiceCount %>명이 선택하였습니다.
					<div style="border:solid 1px"><%=limitedCount %>개 남음</div>
				</div>
				
				<%}}else {if(limitedCount==null){//선택한사람이 없으면서,한정판이 아닌경우%>
				<div>선택한 사람이 없음.</div>
				<%}else{%>
				<div>선택한 사람이 없음.
					<div style="border:solid 1px"><%=limitedCount %>개 남음</div>
				</div>
				<%}} %>
				<div>선물 추가하기</div>
				<div>후원자분들에게 드릴 새로운 선물을 만듭니다.</div>
				<input type='BUTTON' value='+추가하기' onclick='giftAdd()'>
			</div>
		<div>펀딩 안내</div>
			<div>환불 및 교환 정책</div>
			<div>
				<div>환불 및 교환 정책을 입력해주세요.</div>
				<div><img src="../FTBC_Images/edit.png" style="width:2%; height:2%;")>입력하기</div>
			</div>
			<div>상품 정보 고시</div>
			<div>
				<div>후원자에게 선물을 제공하는 경우 전자상거래 등에서의 상품 등의 정보제공에 관한 고시법에 따라 상품정보를 작성해주세요.</div>
				<div><img src="../FTBC_Images/edit.png" style="width:2%; height: 2%;")>입력하기</div>
			</div>
			<div>인증 서류 제출</div>
			<div>
				<div>인증 서류를 등록해주세요.</div>
				<div><img src="../FTBC_Images/edit.png" style="width:2%; height:2%;")>업로드하기</div>
			</div>
		</div> --%>
		<!-- ======================펀딩 및 선물구성 백엔드 끝 -->
		<!-- ======================하단 이전 다음 버튼 시작========================= -->
		<div class="row">
			<div class="col-xs-6"><input type="button" value="이전"></div>
			<div class="col-xs-6" style="text-align:right"><input type="button" value="다음"></div>
		</div>
		<!-- ======================하단 이전 다음 버튼 끝========================= -->
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
</body>
</html>
