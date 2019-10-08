/********************************************************
 * 윈도우 팝업창 처리 구현
 * @param1:화면에 띄울 페이지의 URL을 정해줌
 * @param2:팝업창 가로크기를 정해줌
 * @param3:팝업창 세로크기를 정해줌
 * @param4:팝업창 이름을 정해줌
 *****************************************************/

function cmm_window_popup(url,popupwidth,popupheight,popupname)
{//해상도가 1024*768이라면 윈도스크린은 768에 해당됨
	Top = (window.screen.height-popupheight)/3;//768-368/3==>133.333333333333333333333
	Left = (window.screen.width-popupwidth)/2;
	if(Top<0) Top=0;
	if(Left<0) Left=0;
	options = "location=no, fullscreen=no, status=no";
	options += ",left="+Left+",top="+Top;
	options += ",width="+popupwidth+",height="+popupheight;
	popupname=window.open(url,popupname,options);//브라우저가 제공해주는 내장객체
}