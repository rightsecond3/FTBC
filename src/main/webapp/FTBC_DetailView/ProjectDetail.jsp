<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 상세 페이지</title>
<!--=============================================================================================
	상세보기 페이지
	날짜:2019-09-12
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="ProjectDetail.css?luda">
	<script type="text/javascript">
		function clickRewardCards() {
			alert("결제 페이지 이동2");
		}
		function clickStoryReple() {
			alert("clickStroyReple 클릭");
		}
		function clickBackCommunity() {
			alert("커뮤니티로 돌아가기");
		}
		function clickFundProject() {
			alert("결제 페이지 이동1")
		}
		function clickLoadMoreComment() {
			alert("이전 댓글 더보기");
		}
		function clickInputComment() {
			alert("댓글 작성 클릭");
		}
		function clickCommunitySave() {
			alert("커뮤니티 후원자 글 작성");
		}
		// 이전에 써져있던 정보들을 초기화 하기 위한 함수
		function clickInquiry() {
			var value = $('#modal-types option:selected').val();
			if(!(value == '문의유형')) {
				$("#modal-types").val('문의유형').prop("selected", true);
				$("#modal-contents").attr('disabled', 'disabled');
				$("#modal-contents").val('');
				$('#footer-submit').attr('disabled', 'disabled');
			}
		}
	</script>
</head>
<body>
	<div id="top_MenuBar">
		<%@ include file="../FTBC_Common/TopMenuBar.jsp"%>
	</div>
		<div class="container-fluid">
			<!-- 서브 카테고리 -->
			<div class="row">
				<div class="col-sm-12" id="subCat">
					<button type="button" class="btn btn-sm" id="btn_subCat">
						<span style="color:rgb(117,117,117);">사회:subCat</span>
					</button>
				</div>
			</div>
			<!-- 프로젝트 제목 -->
			<div class="row">
				<div class="col-sm-12" id="pj_title">
					<h1 align="center"><b>제목:pj_title</b></h1>
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
					<a href="#"><b>미담</b></a>
				</div>
			</div>
			<!-- 프로젝트 대표사진과 모인 금액 등 -->
			<div class="row" id="top">
				<div class="col-lg-2" id="layout1"></div>
				<!-- 프로필 대표 사진 부분 -->
				<div class="col-lg-5" id="top_profile">
					<div id="top_profile_row1" class="row" align="center">
						<!-- #DB-->
						<img id="top_profile_img" src="../FTBC_Images/eunseo2.jpg" 
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
				<div id="bottom_storyCard" class="tab-pane fade in active bottom_storyCard" style="padding-top: 50px;">
					<!-- #DB_써머노트에서 긁어서 박아줘야함. -->
					<p>써머노트</p>
					<p>안녕하세요! 카페설희가 또 돌아왔어요. 쿠키, 마카롱 프로젝트를 성공적으로 마치고 맛있는 디저트로 3번째 프로젝트를 진행하려 합니다. 더 맛있고 예쁜 디저트를 선사하기 위해서 항상 연구하고 발전하는 카페설희가 되겠습니다. 후원 진심으로 감사드립니다.&nbsp;</p>
					<h2><strong>" 특별한 너에게 주는 특별한 선물"</strong></h2>
					<p>누구에게나 특별한 존재는 있는 것 같아요. 가족, 선생님, 친구, 우리집 멍멍이와 고양이 그리고 나 자신. 이런 특별한 존재들을 행복하게 해줄 예쁘고 맛있는 마카롱 선물세트를 준비해 보았어요. 선물을 주는 사람도 받는 사람도 행복해지는 그런 특별한 마카롱 이랍니다.</p>
					<p><img width="100%" src="https://tumblbug-psi.imgix.net/6e9a642e6e4d5d647835e62e1f0158aec00ba4ff/b5df8be487c2bed632bc783dcae25950cde79a44/4a41b679458bdda3ec71cf813c56a84285009e7d/e9bfdd26-231b-483b-b916-36ac41779fda.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=eaaff6c138ee0ee0e9b687ae02dd8310"><img width="100%" src="https://tumblbug-psi.imgix.net/6e9a642e6e4d5d647835e62e1f0158aec00ba4ff/b5df8be487c2bed632bc783dcae25950cde79a44/4a41b679458bdda3ec71cf813c56a84285009e7d/db850c8d-38a1-453b-98a5-253aed8987ec.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=5c0ca74b59d0968a3d5b1248955c0681"><img width="100%" src="https://tumblbug-psi.imgix.net/6e9a642e6e4d5d647835e62e1f0158aec00ba4ff/b5df8be487c2bed632bc783dcae25950cde79a44/4a41b679458bdda3ec71cf813c56a84285009e7d/544f3868-4300-459f-8e50-3e2cf5b8d548.jpeg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=b685c37386fa20244fdf24d7ddeba91d"><img width="100%" src="https://tumblbug-psi.imgix.net/6e9a642e6e4d5d647835e62e1f0158aec00ba4ff/b5df8be487c2bed632bc783dcae25950cde79a44/4a41b679458bdda3ec71cf813c56a84285009e7d/65330435-5bd6-4f5a-9077-5f5930a2b999.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=7d11d3227f57e99b41327a48378d3a63"></p>
					<h2 style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 2rem; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: 1.5; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: -1px; padding: 0px; margin: 39px 0px 13px 0px;"><strong style="box-sizing: inherit; font-weight: bold;"># 재료부터가 남달라요</strong></h2>
					<p><strong style="box-sizing: inherit; font-weight: bold;">마카롱의 주 재료는 달걀, 버터, 아몬드가루, 설탕, 슈가파우더 입니다. 이런 주 재료들을 가장 신선하고 좋은 재료들로 구성하였습니다. 농장에서 바로 낳은 신선한 <u>HACCP 친환경 무항생제 신선한 달걀</u>을 가져옵니다. 버터크림은<u> 100% 우유버터</u>를 사용하기에 깔끔하고 담백한 필링을 맛보실 수 있으십니다. 좋은재료가 기본이 되기에 좋은 맛은 물론이고 안심하고 드실 수 있는 카페설희 마카롱입니다.</strong></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><img width="100%" src="https://tumblbug-psi.imgix.net/6e9a642e6e4d5d647835e62e1f0158aec00ba4ff/b5df8be487c2bed632bc783dcae25950cde79a44/4a41b679458bdda3ec71cf813c56a84285009e7d/6dec6f87-4ff7-4108-85ed-a64645bbab57.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=68633afc9d4c1282befe39106085fb15"><img width="100%" src="https://tumblbug-psi.imgix.net/6e9a642e6e4d5d647835e62e1f0158aec00ba4ff/b5df8be487c2bed632bc783dcae25950cde79a44/4a41b679458bdda3ec71cf813c56a84285009e7d/26c5532a-02c1-4b88-a2d6-30a4aad6818e.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=40ee1c174ab56ef07c7f9f020e399a9d"><img width="100%" src="https://tumblbug-psi.imgix.net/6e9a642e6e4d5d647835e62e1f0158aec00ba4ff/b5df8be487c2bed632bc783dcae25950cde79a44/4a41b679458bdda3ec71cf813c56a84285009e7d/7a80d7a2-d61a-4e45-baa9-93ddff446f76.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=06e7606c009739ad8c51c6c9cb869fb9"></p>
					<h2 style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 2rem; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: 1.5; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: -1px; padding: 0px; margin: 39px 0px 13px 0px;"># 5가지 맛 JMT 하트마카롱</h2>
					<p><span style="background-color: #ffffff;">하트로 돌아왔습니다. 알록달록 예쁜 하트 마카롱, 선물 받으시는 분들은 예쁘고 맛있는 마카롱 때문에 더더욱 행복해지실 거에요. 건강한 달걀로 만든 쫀득한 꼬끄와 담백하고 진한 필링이 조화를 이루는 카페설희 마카롱입니다.&nbsp;</span></p>
					<p><span style="background-color: #ffffff;">앉은자리에서 5개는 거뜬히 먹을 수 있는 인생마카롱이에요.</span></p>
					<p><span style="background-color: #ffffff;"><span style="display: inline !important; float: none; background-color: #ffffff; color: #000000; cursor: text; font-family: sans-serif; font-size: 15px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">이번에 보내드릴 다섯가지맛의 하트마카롱을 소개해드릴게요.&nbsp;</span></span></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><img width="100%" src="https://tumblbug-psi.imgix.net/6e9a642e6e4d5d647835e62e1f0158aec00ba4ff/b5df8be487c2bed632bc783dcae25950cde79a44/4a41b679458bdda3ec71cf813c56a84285009e7d/fd03c8e4-acd4-461e-a089-12a0b495d657.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=acf170936babe0dfda2143dabc6c64f4"></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><strong><u>// 초코바나나 //</u></strong></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;">바나나필링에 초코누텔라잼을 얹었어요. 바나나맛 우유가 생각날 즈음 진한 초코가 더해져 더 맛있어지는 신비로운 바나나우유 마카롱입니다.</p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><img width="100%" src="https://tumblbug-psi.imgix.net/6e9a642e6e4d5d647835e62e1f0158aec00ba4ff/b5df8be487c2bed632bc783dcae25950cde79a44/4a41b679458bdda3ec71cf813c56a84285009e7d/110f0735-6b60-4a1b-95d0-0328c7ab6cec.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=813516193b8af85803b107b76da8384b"></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><strong><u><span style="display: inline !important; float: none; background-color: #ffffff; color: #000000; cursor: text; font-family: sans-serif; font-size: 15px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">//&nbsp; 순수우유 //</span></u></strong></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;">담백 그 자체 순수우유 마카롱이에요. 흰자와 끓는 설탕물로 만드는 쫀쫀한 이탈리안 머랭기법으로 만든 필링이에요. 아이들에게 가장 인기 많은 마카롱 이랍니다.</p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><img width="100%" src="https://tumblbug-psi.imgix.net/6e9a642e6e4d5d647835e62e1f0158aec00ba4ff/b5df8be487c2bed632bc783dcae25950cde79a44/4a41b679458bdda3ec71cf813c56a84285009e7d/150062fa-5270-425f-9e16-d0b16f37e7c1.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=718611d18b87a3177cea8140799c8299"></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><u><strong><strong><span style="background-color: #ffffff; color: #000000; cursor: text; display: inline; float: none; font-family: sans-serif; font-size: 15px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">// 발로나초코 //</span></strong></strong></u></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;">프랑스산 발로나 초코가루가 들어가 느끼하지 않고 끝맛이 깔끔한 고급스러운 초코마카롱 입니다. 한 번 맛보시면 계속 생각나실 거에요.</p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><img width="100%" src="https://tumblbug-psi.imgix.net/6e9a642e6e4d5d647835e62e1f0158aec00ba4ff/b5df8be487c2bed632bc783dcae25950cde79a44/4a41b679458bdda3ec71cf813c56a84285009e7d/9e9f6168-9d74-4ef1-8408-832a296b9888.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=d3c21e7a968458936c003f4fe07d04d1"></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><strong><u><span style="background-color: #ffffff; color: #000000; cursor: text; display: inline; float: none; font-family: sans-serif; font-size: 15px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">// 녹차누텔라 //</span></u></strong></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;">쌉싸름한 녹차필링에 진한 초코 누텔라잼은 환상이에요.</p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><img width="100%" src="https://tumblbug-psi.imgix.net/6e9a642e6e4d5d647835e62e1f0158aec00ba4ff/b5df8be487c2bed632bc783dcae25950cde79a44/4a41b679458bdda3ec71cf813c56a84285009e7d/fe8ad277-3656-4925-acac-448dc7cb1e40.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=aba79c9b98cfd92c7de87fe71c449689"></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><strong><u><span style="background-color: #ffffff; color: #000000; cursor: text; display: inline; float: none; font-family: sans-serif; font-size: 15px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">// 크림치즈 //</span></u></strong></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;">필라델피아 크림치즈 듬뿍 들어간 크림치즈 마카롱이에요. 크림치즈의 깊은 풍미를 그대로 느낄 수 있어서 좋아요.</p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;">선물박스에 이렇게 다섯가지 맛의 하트마카롱이 2개씩 총 10개의 마카롱이 들어가있어요.&nbsp;</p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;">&nbsp;</p>
					<h2 style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 2rem; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: 1.5; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: -1px; padding: 0px; margin: 0px 0px 13px 0px;"># 포장 및 배송</h2>
					<p><img width="100%" src="https://tumblbug-psi.imgix.net/6e9a642e6e4d5d647835e62e1f0158aec00ba4ff/b5df8be487c2bed632bc783dcae25950cde79a44/4a41b679458bdda3ec71cf813c56a84285009e7d/95e3e113-0f8a-4713-a2f9-b9b343167cb5.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=8a7a263e2402d6c16253043fc1c18a07"></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;">개별 OPP 포장 후 선물상자에 담아 예쁘게 리본포장하여 보내드립니다. 아이스 박스에 아이스팩과 함께 안전하게 배송해 드리니 걱정마세요!</p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;">&nbsp;<span style="background-color: #ffffff; box-sizing: inherit; color: #000000; cursor: text; display: inline; float: none; font-family: sans-serif; font-size: 15px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">상품이 방치되지 않도록 부재시 맡길 곳을 꼭 적어주세요 </span></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><span style="background-color: #ffffff; box-sizing: inherit; color: #000000; cursor: text; display: inline; float: none; font-family: sans-serif; font-size: 15px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">꼼꼼히 포장하여 배송해드리지만 마카롱 특성상 &nbsp;꼬끄가 살짝 깨져서 도착할 수 있습니다</span><span style="background-color: #ffffff; box-sizing: inherit; color: #000000; cursor: text; display: inline; float: none; font-family: sans-serif; font-size: 15px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">택배사 사정에따라 하루 또는 이틀이 소요될 수 있습니다.</span></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><span style="background-color: #ffffff; box-sizing: inherit; color: #000000; cursor: text; display: inline; float: none; font-family: sans-serif; font-size: 15px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">받으신 후 꼭 냉장보관 또는 냉동보관 해주세요.</span></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><span style="background-color: #ffffff; box-sizing: inherit; color: #000000; cursor: text; display: inline; float: none; font-family: sans-serif; font-size: 15px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">냉장보관 7일, 냉동보관 30일 입니다. 일주일 정도 후에 선물드릴 예정이신 분들은 <u style="background-color: hsla(3, 100%, 93%, 0.8); box-sizing: inherit; color: inherit; text-decoration: none; padding: 0.15rem 0px 0.15rem 0px;">냉동보관</u> 추천해드립니다. 냉장보관을 오래할 경우 꼬끄가 과숙성 될 수 있습니다.&nbsp;</span></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><span style="background-color: #ffffff; box-sizing: inherit; word-spacing: 0px;">특히 크림치즈 마카롱은 수분이 많아 숙성이 빠르니 냉동보관 추천드립니다</span></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;">&nbsp;</p>
					<h2 style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"># <strong style="box-sizing: inherit; font-weight: bold;">리워드구성</strong></h2>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><strong style="box-sizing: inherit; font-weight: bold;"><img width="100%" src="https://tumblbug-psi.imgix.net/6e9a642e6e4d5d647835e62e1f0158aec00ba4ff/b5df8be487c2bed632bc783dcae25950cde79a44/4a41b679458bdda3ec71cf813c56a84285009e7d/ac16e189-2b1e-4193-8c49-2036c230d57b.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=80e44a1046ec21e6bbd50a7ce69c6fb4"></strong></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><strong style="box-sizing: inherit; font-weight: bold;"><img width="100%" src="https://tumblbug-psi.imgix.net/6e9a642e6e4d5d647835e62e1f0158aec00ba4ff/b5df8be487c2bed632bc783dcae25950cde79a44/4a41b679458bdda3ec71cf813c56a84285009e7d/d303e307-a696-440e-9580-fd9757a104db.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=b1b6b73b30640eb6a1c29b14adc953cd"><img width="100%" src="https://tumblbug-psi.imgix.net/6e9a642e6e4d5d647835e62e1f0158aec00ba4ff/b5df8be487c2bed632bc783dcae25950cde79a44/4a41b679458bdda3ec71cf813c56a84285009e7d/51ecdf35-509a-4dfd-9f8f-9f72dee0ae00.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=8488dabc41162bbe9dca6a3886494c80"></strong></p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><strong style="box-sizing: inherit; font-weight: bold;">얼리버드 상품들은 한정수량으로 제공됩니다.</strong></p>
					<h2 style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 2rem; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: 1.5; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: -1px; padding: 0px; margin: 39px 0px 13px 0px;"># 펀딩일정</h2>
					<p><img width="100%" src="https://tumblbug-psi.imgix.net/6e9a642e6e4d5d647835e62e1f0158aec00ba4ff/b5df8be487c2bed632bc783dcae25950cde79a44/4a41b679458bdda3ec71cf813c56a84285009e7d/e6ce4b3c-b47f-4b9d-a127-d2bc727b2c36.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=595ac746eaee213f793086e268dda6ea"></p>
					<p>펀딩종료 후 10월 14일부터 10BOX씩 순차배송될 예정입니다. 냉장식품이기에 조금 더 신선하게 전달되기 위해 금요일 토요일에는 발송하지 않습니다. 배송일 변경을 원하시는 분들은 '창작자에게 문의하기' 를 통해 메세지 주시면 감사하겠습니다.</p>
					<h2 style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 2rem; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: 1.5; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: -1px; padding: 0px; margin: 39px 0px 13px 0px;">#펀딩금액&nbsp;</h2>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;">의 제작 최소 수량인 약 400개 정도, 정도 제작할 수 있는 최소 금액에 포장과 배송 등의 비용까지 고려하여 총 900,000 원을 목표 금액으로 정했습니다. 아몬드가루, 버터, 계란, 크림치즈, 포장박스, 아이스팩, 아이스박스 등등 부자재 구매에 주로 쓰어질 예정입니다.&nbsp;목표 금액을 초과 달성할 경우에는 추가 제작 비용을 제외한 나머지 금액을 포장 퀄리티를 높이기 위해 사용할 예정입니다.</p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;">&nbsp;</p>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;">&nbsp;</p>
					<h2 style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 2rem; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: 1.5; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: -1px; padding: 0px; margin: 39px 0px 13px 0px;"># 문의 방법</h2>
					<p style="box-sizing: inherit; color: #000000; font-family: SpoqaHanSans,Helvetica Neue,Arial,Helvetica,sans-serif; font-size: 17px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 1.8; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-break: break-all; word-spacing: -0.5px; margin: 0px 0px 26px 0px;"><br style="box-sizing: inherit;">문의사항이 있으실 경우, 창작자에게 문의하기로 알려주세요.</p>
					<p>.</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
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
		<!-- =========== end of bottom ============= -->
		<!-- ======== 창작자에게 문의하기 모달 창 ============ -->
		<%@include file="./Project_InquiryModal.jsp" %>
		<!-- =========== end of container-fluid ============= -->
	</body>
</html>