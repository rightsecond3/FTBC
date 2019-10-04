<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!--=============================================================================================
	프로젝트 올리기 부분에 들어가는 상단바
	날짜:2019-09-12
================================================================================================  -->
<style type="text/css">
	#top_menus a, #top_login a{
		color:black;
		font-size:14px;
		font-weight: bold;
		text-decoration:none;	
		vertical-align: -webkit-baseline-middle;
	}
	#topMenu_bar{
	 	background-color: white;
	}
	#topMenu_bar a:hover{
		 color: #8b8b8b;
		 background-color: white;
	}
	#logo{
		height: 30px;
		margin-top:-5px;
	}
</style>
<div class="row" id="topMenu_bar">
	<div class="col-lg-1 "></div>
	   <!--===============[ 메뉴 ] =============-->
    <div class="col-lg-4 ">
        <div class="collapse navbar-collapse">
           <ul id="top_menus" class="nav nav-justified">
              <li><a href="#">내 페이지</a></li>
            </ul>                
        </div>
     </div>
        <!--===============[ 타이틀 ]==============-->
      <div class="col-lg-2 ">
         <div id="top_title"  class="collapse navbar-collapse" ">
            <ul id="top_title" class="nav nav-justified">
                 <li><a href="../FTBC_MainView/FTBC_Main.jsp"><img id="logo" src="../FTBC_Images/logo.png"></a></li>
            </ul>                
          </div>
      </div>
       <!--===============[ 로그인 ]==============-->
      <div class="col-lg-4 ">
        <div class="collapse navbar-collapse" ">
           <ul id="top_login" class="nav nav-justified">
              <li><a href="#">창작자 센터 </a></li>
            </ul>                
        </div>
     </div>
</div>
