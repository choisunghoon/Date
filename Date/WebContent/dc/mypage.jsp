<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@include file="/sy0526/topmenu.jsp" %>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">


/*Credits: Dynamic Drive CSS Library */
/*URL: http://www.dynamicdrive.com/style/ */

#ddblueblockmenu{
border: 1px solid black;
border-bottom-width: 0;
width: 185px;
}

#ddblueblockmenu ul{
margin: 0;
padding: 0;
list-style-type: none;
font: normal 90% 'Trebuchet MS', 'Lucida Grande', Arial, sans-serif;
}

#ddblueblockmenu li a{
display: block;
padding: 3px 0;
padding-left: 9px;
width: 169px; /*185px minus all left/right paddings and margins*/
text-decoration: none;
color: white;
background-color: #2175bc;
border-bottom: 1px solid #90bade;
border-left: 7px solid #1958b7;
}

* html #ddblueblockmenu li a{ /*IE only */
width: 187px; /*IE 5*/
w\idth: 169px; /*185px minus all left/right paddings and margins*/
}

#ddblueblockmenu li a:hover {
background-color: #2586d7;
border-left-color: #1c64d1;
}

#ddblueblockmenu div.menutitle{
color: white;
border-bottom: 1px solid black;
padding: 1px 0;
padding-left: 5px;
background-color: black;
font: bold 90% 'Trebuchet MS', 'Lucida Grande', Arial, sans-serif;
}

</style>
<form>
<table>
<tr><td>
<div id="ddblueblockmenu">

<div  class="menutitle">회원 정보</div>
<ul>
<li id="modifyForm.nhn?id=${id }"><a>회원 정보 변경</a></li>
<c:if test="${check eq 'no' }">
<li id="deleteForm.nhn?id=${id }"><a>회원 탈퇴</a></li>
</c:if>
</ul>

<div class="menutitle">커플 정보</div>
<ul>
<li id="coupleinfo.nhn?id=${id }"><a>커플 정보 변경</a></li>
<li id="coupleDelete.nhn?id=${id }"><a>커플 삭제</a></li>
</ul>
<div class="menutitle">마이코스</div>
<ul>
<li><a>코스 리스트</a></li>
</ul>
</div>
<td>
<td width="600" height="400" align="center">
<span id="content"></span>
</td>
</tr>
</table>
</form>


<script>
$('ul li').click(function(){
	url=$(this).attr("id");
	
	callAjax(url); 
});
function callAjax(url){
	 $.ajax({
	        type: "post",
	        url : url,
	        success: test,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
  	});
}
function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
    $("#content").html(aaa);	//id가 ajaxReturn인 부분에 넣어라
}
function whenError(){
    alert("Error");
}
</script>

