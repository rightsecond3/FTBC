<%@page import="vo.ProjectVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ProjectVO pVO = null; 
if(request.getAttribute("projectDetail")!=null){
	pVO=(ProjectVO)request.getAttribute("projectDetail");
	
} 

%>
    
    
    
<!-- 서브 카테고리 -->
			<div class="row">
				<div class="col-sm-12" id="subCat">
					<button type="button" class="btn btn-sm" id="btn_subCat">
						<span style="color:rgb(117,117,117);"><%=pVO.getSubcat_name()%></span>
					</button>
				</div>
			</div>
			<!-- 프로젝트 제목 -->
			<div class="row">
				<div class="col-sm-12" id="pj_title">
					<h1 align="center"><b><%=pVO.getPjo_longtitle()%></b></h1>
				</div>
			</div>
			<!-- 창작자 그림 및 이름 -->
			<div class="row" id="writers">
				<div class="col-sm-6" id="writer_img" align="right">
					<!-- #DB -->
					<img src="../FTBC_Images/arin.png" class="img-circle" alt="창작자 이미지" width="30" height="30"> 
				</div>
				<div class="col-sm-6" id="writer_name" align="left">
					<div style="margin-top: 5px;"></div>
					<!-- #a태그_작성자 페이지 이동 -->
					<a href="<%=pVO.getPjo_pageaddr()%>"><b>미담</b></a>
				</div>
			</div>
			<!-- 프로젝트 대표사진과 모인 금액 등 -->
			<div class="row" id="top">
				<div class="col-lg-2" id="layout1"></div>
				<!-- 프로필 대표 사진 부분 -->
				<div class="col-lg-5" id="top_profile">
					<div id="top_profile_row1" class="row" align="center">
						<!-- #DB-->
						<img id="top_profile_img" src="<%=pVO.getPjo_img()%>" style="max-width: 100%;height: auto;max-height: 480px;"
						alt="프로젝트 커버 이미지">
					</div>
				</div>
				<!-- 우측 부분 -->
				<div class="col-lg-3" id="topInfo">
					<!-- 모인 금액.. 부분 -->
					<div class="topInfo_div row">
						<div>
							<span id="topInfo_label">모인금액</span>
						</div>
						<div>
							<!-- #DB -->
							<span id="topInfo_label2">[1,475,200]</span>
							<span id="topInfo_label3">원&nbsp;&nbsp;</span>
							<!-- #DB -->
							<span id="topInfo_label4">[171%]</span>
						</div>
						<!-- 남은 시간 -->
						<div id="topInfo_time">
							<span id="topInfo_label">남은시간</span>
						</div>
						<div>
							<!-- #DB -->
							<span id="topInfo_label2">[28]</span>
							<span id="topInfo_label3">명</span>
						</div>
						<!-- 후원자 -->
						
						<div id="topInfo_sponsor">
							<span id="topInfo_label">후원자</span>
						</div>
						<div>
							<!-- #DB -->
							<span id="topInfo_label2">[386]</span>
							<span id="topInfo_label3">명</span>
						</div>
					</div>
					<!-- 후원자 -->
					<!-- 펀딩 진행중 박스 -->
					<div id="topInfo_fundBox" class="row">
						<div style="margin-bottom:8px;">
							<span><b>펀딩 진행중</b></span>
						</div>
						<div>
							<!-- #DB -->
							<span>
								목표금액인 [7000,000]원이 모여야만 결제됩니다.<br>
								결제는 [2019년 10월 14일]에 다함께 진행됩니다.
							</span>
						</div>
					</div>
					<!-- 프로젝트 밀어주기 버튼 -->
					<input id="fundProject" type="button" onclick="clickFundProject()" value="프로젝트 밀어주기">
				</div>
			<div class="col-lg-2"></div>
		</div>
		<div class="row" id="middle">
			<div class="col-lg-2"></div>
			<!-- 스토리 | 커뮤니티 | 펀딩안내 버튼 | 투자자 -->		
			<div id="middle_tabs" class="col-lg-8">
	  			<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#bottom_storyCard">스토리</a></li>
					<li><a data-toggle="tab" href="#bottom_mainCommunity">커뮤니티</a></li>
					<li><a data-toggle="tab" href="#bottom_mainFundingInfo">펀딩 안내</a></li>
					<li><a data-toggle="tab" href="#bottom_sponsors">투자자</a></li>
	  			</ul>
			</div>
			<div class="col-lg-2"></div>
		</div>
		<!-- =========== end of middle ========== -->	
		<div class="row" id="bottom">
			<div class="col-lg-2"></div>
			<!-- 스토리 내용물 -->
			<div class="tab-content col-lg-5">
				<!-- 써머노트 내용물 -->
				<div id="bottom_storyCard" class="tab-pane fade in active bottom_storyCard" style="padding-top: 50px;padding-left:50px;padding-right:50px;">
					<!-- #DB_써머노트에서 긁어서 박아줘야함. -->
					<%=pVO.getSt_story()%>
				</div>
				<!-- 커뮤니티 내용물 -->
				<div id="bottom_mainCommunity" class="tab-pane fade">
					<!-- 글 작성부 -->
					<div id="newPost" class="bottom_storyCard" >
						<!-- #####중요 : 후원한 사람만 작성할 수 있게 show hide 기능 필요 -->
						<!-- #DB_작성자 이미지 -->
						<img src="../FTBC_Images/arin.png" class="img-circle" alt="작성자 이미지" width="30" height="30">
						<span>&nbsp;&nbsp;후원자만 글을 쓸수 있어요<br><br></span>
					    <div class="media-left">
					    	<!-- #DB -->
					     	<img src="../FTBC_Images/arin.png" class="img-circle" alt="작성자 이미지" width="30" height="30">
					    </div>
					    <div class="media-body">
							<textarea class="form-control" rows="5" id="comment" style="margin-bottom: 20px;"></textarea>
					    </div>
						<div align="right">
							<input id="communitySave" class="bottom_btn" type="button" value="작성하기" onclick="javascript:clickCommunitySave()">
						</div>
					</div>
					<!-- 댓글 보여주기 부 -->
					<div id="storyReple" class="bottom_storyCard" onclick="javascript:clickStoryReple()">
						<!-- 사용자 정보 -->
					    <div class="media-left">
					    	<!-- #DB -->
					     	<img src="../FTBC_Images/arin.png" class="img-circle" alt="작성자 이미지" width="30" height="30">
					    </div>
					    <div class="media-body">
					    	<!-- #DB -->
					    	<div><b>[작성자아이디]</b></div>
					    	<div>[8시간 전]</div>
					    </div>
					    <!-- 댓글 내용 -->
					    <!-- #DB -->
					    <div id="storyContent">
					    	[33000% 돌파도 눈앞이다!!]
					    </div>
					    <!-- 댓글 갯수 -->
					    <div id="postSummary">
					    	<i class="fa fa-comment"></i>
					    	<!-- #DB -->
					    	<span>&nbsp;<b>[0]</b></span>
					    </div>
					</div>
					<!-- 댓글  상세보기 페이지 헤더 -->
					<div id="backCommunityHeader">
						<input id="backCommunity" type="button" value="< 커뮤니티로 돌아가기" onclick="clickBackCommunity()">
					</div>
					<!-- 댓글 상세보기 페이지 -->
					<div id="repleDetail" class="bottom_storyCard">
						<div id="postTitle">
							게시글 상세보기
						</div>
						<div id="postBody">
							<!-- #조건문_글쓴이가 창작자일 경우만 나오게 해야함 -->
							<div id="postCategory">창작자 업데이트</div>
						</div>
						<div id="postWriter">
						    <div class="media-left" >
						    	<!-- #DB -->
						     	<img src="../FTBC_Images/arin.png" class="img-circle" alt="작성자 이미지" width="30" height="30">
						    </div>
						    <div class="media-body">
						    	<!-- #DB -->
						    	<!-- #조건문_글쓴이가 창작자일 경우만 나오게 해야함 -->
						    	<div><b>[작성자아이디]</b>&nbsp;<b>[창작자]</b></div>
						    	<div>[8시간 전]</div>
						    </div>
					    </div>
					    <!-- #DB -->
					    <div id="detailContent">
					    	[작가님께서 팬카페에 적어주신 1억 축하 메세지 입니다!!
					    	<br>
					    	감사합니다.]
					    </div>
					    <!-- #DB -->
					    <div id="commentAmount">
					    	[24]개의 댓글이 있습니다
					    </div>
					    <div id="loadMoreComment" onclick="javascript:clickLoadMoreComment()">
					    	이전 댓글 더 보기
					    </div>
					    <!-- #For문 -->
					    <div id="comments">
						    <div class="media-left" >
						    	<!-- #DB -->
						     	<img src="../FTBC_Images/arin.png" class="img-circle" alt="댓글작성자 이미지" width="30" height="30">
						    </div>
						    <div class="media-body">
						    	<!-- #DB -->
						    	<div><b>[작성자아이디]</b></div>
						    	<!-- #DB -->
						    	<div>[작성 내용]</div>
						    </div>
					    </div>
					    <!-- 댓글 작성 부_#후원자일 경우만 표시 되게 해야함. -->
					    <div id="inputCommnet">
	 						<div class="media-left">
						    	<!-- #DB -->
						     	<img src="../FTBC_Images/arin.png" class="img-circle" alt="작성자 이미지" width="30" height="30">
						    </div>
						    <div class="media-body">
								<textarea class="form-control" rows="5" id="comment" style="margin-bottom: 20px;"></textarea>
						    </div>
							<div align="right">
								<input id="btn_save"class="bottom_btn" type="button" value="작성하기" onclick="javascript:clickInputComment()">
							</div>
					    </div>
					</div>
				</div>
				<!-- 펀딩 안내 내용물 -->
				<div id="bottom_mainFundingInfo" class="tab-pane fade">
					<div class="bottom_storyCard">
						<div><b>이 프로젝트의 환불 및 교환 정책</b></div>
						<div id="refundExchangePolicyText">
							<!-- #DB -->
							<p>[환불관련]
							- 프로젝트 마감일 후에는 즉시 제작 및 실행에 착수하는 프로젝트 특성상 단순 변심에 의한 후원금 환불이 불가능합니다.
							- 예상 전달일로부터 [30]일 이상 선물 전달이 이뤄지지 않을 경우, 환불을 원하시는 분들께는 [수수료를 포함한 ] 후원금을 환불해 드립니다.
							(플랫폼 수수료: 모금액의 5%, 부가세 별도 / 결제 수수료: 결제 성공액의 3%, 부가세 별도 )
							- 선물 전달을 위한 배송지 및 서베이 답변은 [2019. 11. 12]에 일괄 취합할 예정입니다.
							- 이후 배송지 변경이나 서베이 답변 변경을 원하실 때에는 '창작자에게 문의하기'로 개별 문의하셔야 합니다.
							[파손 및 불량]
							- 파손 또는 불량품 수령 시 [15]일 이내로 교환이 가능합니다.
							- 교환 및 AS 문의는 '창작자에게 문의하기' 또는 [연락처]로 신청해 주세요.
							- 파손이나 불량품 교환시 발생하는 비용은 창작자가 부담합니다. 선물 확인을 위한 포장 훼손 외에 아이템의 가치가 훼손된 경우에는 교환 및 환불이 불가합니다.
							[ 공연 초대권의 경우 ]
							- 행사 참가권은 타인에게 양도가 [불가능 ]합니다.
							- 현장에서 수령해야 하는 선물을 수령하지 못하신 경우 환불은 [가능]하며, 선물 배송을 위한 추가 배송비를 별도 요청드릴 수 있습니다.
							</p>
						</div>
					</div>
					<div class="bottom_storyCard" style="padding: 20px 20px 20px 20px; margin-top: 20px;" >
						<div class="bottom_stroyCard">
							<table style="width: 100%;">
								<tr>
									<th style="text-align: left;"><span style="font-size: 15px;"><b>프로젝트에 대해 문의사항이 있으신가요?</b></span></th>
									<th style="text-align: right;">
										<div class="bottom_btn" data-toggle="modal" data-target="#creatorInquiry" onclick="javascript:clickInquiry()">
										<i class="fa fa-envelope" style="margin-right: 5px"></i>창작자에게 문의하기
										</div>
									</th>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<!-- 투자자 -->
				<div id="bottom_sponsors" class="bottom_storyCard tab-pane fade">
					<div align="center">
						<%@include file="./FuckChart.jsp" %>
					</div>
					<div class="media-left">
				    	<!-- #DB -->
			     		<img src="../FTBC_Images/arin.png" class="img-circle" alt="작성자 이미지" width="30" height="30">
				    </div>
				    <div class="media-body">
				    	<div>[박**]님이 [200]원 후원했습니다.</div>
				    	<div>[sysdate]</div>
				    </div>
				</div>
			</div>
			<!-- 창작자 소개 및 선물 선택 -->
			<div class="col-lg-3">
				<!-- 창작자 소개 -->
				<div class="row">
					<div id="bottom_creatorCard" style="padding: 20px 20px 20px 20px;">
						<div style="margin-bottom: 8px;"><b>창작자 소개</b></div>
						<div style="margin-bottom: 10px;">
							<!-- #DB -->
							<span><img src="../FTBC_Images/arin.png" class="img-circle" alt="창작자 이미지" width="30" height="30"></span>
							<!-- #DB -->
							<span><b>[창작자 이름]</b></span>
							<!-- #DB -->
						</div>
						<div style="margin-bottom: 15px;">
							<p>
								[특별한 주제로 향기를 예술화하는 향기 공방 비비안제이입니다. 한국을 대표하는 향기 브랜드가 되겠다는 큰 꿈과 목표를 품에 안고서 오늘도 새롭고, 특별한 향을 연구합니다. 현재는 섬유향수 공방으로 활동중입니다. 잘 부탁드립니다.]
							</p>
							<div class="Divider"></div>
						</div>
						<!-- #DB -->
						<div>
							진행한 프로젝트 <b>[1]</b> &nbsp; 밀어준 프로젝트 <b>[0]</b>
						</div>
						<div style="margin-top: 20px;"></div>
						<!-- 창작자에게 문의하기 -->
						<div class="bottom_btn" data-toggle="modal" data-target="#creatorInquiry" onclick="javascript:clickInquiry()"><i class="fa fa-envelope" style="margin-right: 5px"></i>창작자에게 문의하기</div>
					</div>
				</div>
				<!-- #DB -->
				<div id="bottom_rewardsLabel">
					선택할 수 있는 [7]개의 선물이 있습니다.
				</div>
				<!-- 후원 선물 선택 -->
				<div class="row">
					<!-- #이동_결제 페이지 -->
					<div id="bottom_rewardCards" onclick="javascript:clickRewardCards()">
						<!-- #DB -->
						<div id="bottom_rewardCards_rewardHeader">
							<table style="width: 100%">
								<tr>
									<th style="text-align: left;"><i class="fa fa-check-circle" style="margin-right: 5px"></i><span id="bottom_rewardCards_amounts">[22]명이 선택</span></th>
									<th style="text-align: right;"><span id="bottom_rewardCards_rewardLabel">[28]개 남음</span></th>
								</tr>
							</table>
						</div>
						<!-- #DB -->
						<div id="bottom_rewardCards_money"><b>[19,000]원 +</b></div>
						<!-- #DB -->
						<div id="bottom_rewardCards_description">배송비 포함/ 추가! 화이트 특소</div>
						<div id="bottom_rewardCards_itemList">
							<ul>
								<!-- #DB_반복문 -->
								<li>[화이트 특소 알파카 친구 (x 1)]</li>
								<li>[알파카 키링 (x 1)]</li>
							</ul>
						</div>
						<!-- #DB -->
						<div id="bottom_rewardCards_deliveryDate">
							<span>예상 전달일 <b>[2019년 10월 14일]</b></span>
						</div>
						<div class="Divider"></div>
						<input class="bottom_btn" type="button" value="선물 선택하고 밀어주기">
					</div>
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>