<%@page import="blockchain.Block"%>
<%@page import="java.util.List"%>
<%@page import="blockchain.BlockChain"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!--=============================================================================================
	블록체인 리스트
	블록체인 메인 부분에 들어가는 부분
	날짜:2019-09-12
================================================================================================  -->
<%
	BlockChain chain = (BlockChain)request.getAttribute("blockChain");
	List<Block> blockChain = chain.blockChain;
	int size = 0;
	int rownum = 1;
	if(blockChain.size() >0){
		size = blockChain.size();
	}
%>

<table class="table" id="BlockChain_Table">
	<thead>
		<tr>
			<th scope="col">#</th>
			<th scope="col">Hash</th>
			<th scope="col">previousHash</th>
		</tr>
	</thead>
	<tbody>
<%
	for(int i=0; i<size;i++){
		rownum = 1 + i;
		Block block = blockChain.get(i);
%>

		<tr onclick="BlockDetail(<%=i%>)">
			<th width="150px"><%=rownum%></th>
			<td><%=block.hash %></td>
			<td><%=block.previousHash %></td>
		</tr>	
<%		
	}
%>
	</tbody>
</table>
<div id="paging"></div>
<script type="text/javascript">
    
    var totalData = '<%=size%>';    // 총 데이터 수
    var dataPerPage = 20;    // 한 페이지에 나타낼 데이터 수
    var pageCount = 10;        // 한 화면에 나타낼 페이지 수
    
    function paging(pageCount, currentPage){
        
        console.log("currentPage : " + currentPage);
        
        var totalPage = Math.ceil(totalData/dataPerPage);    // 총 페이지 수
        var pageGroup = Math.ceil(currentPage/pageCount);    // 페이지 그룹
        
        console.log("pageGroup : " + pageGroup);
        
        var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
        if(last > totalPage)
            last = totalPage;
        var first = last - (pageCount-1);    // 화면에 보여질 첫번째 페이지 번호
        var next = last+1;
        var prev = first-1;
        
        console.log("last : " + last);
        console.log("first : " + first);
        console.log("next : " + next);
        console.log("prev : " + prev);
 
        var $pingingView = $("#paging");
        
        var html = "";
        
        if(prev > 0)
            html += "<a href=# id='prev'><</a> ";
        
        for(var i=first; i <= last; i++){
            html += "<a href='#' id=" + i + ">" + i + "</a> ";
        }
        
        if(last < totalPage)
            html += "<a href=# id='next'>></a>";
        
        $("#paging").html(html);    // 페이지 목록 생성
        $("#paging a").css("color", "black");
        $("#paging a#" + currentPage).css({"text-decoration":"none", 
                                           "color":"red", 
                                           "font-weight":"bold"});    // 현재 페이지 표시
                                           
        $("#paging a").click(function(){
            
            var $item = $(this);
            var $id = $item.attr("id");
            var selectedPage = $item.text();
            
            if($id == "next")    selectedPage = next;
            if($id == "prev")    selectedPage = prev;
            
            paging(pageCount, selectedPage);
        });
                                           
    }
    
    $("document").ready(function(){        
        paging(pageCount, 1);
    });
</script>