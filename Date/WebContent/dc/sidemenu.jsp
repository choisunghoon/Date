<%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>



<HTML>
<HEAD>
<TITLE> CSS </TITLE>
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
</HEAD>

<BODY>
<div id="ddblueblockmenu">

<div class="menutitle">회원정보</div>
<ul>
<li><a href="modifyForm.nhn" target="body">회원정보 변경</a></li>
<li><a href="deleteForm.nhn" target="body">회원 탈퇴</a></li>
</ul>

<div class="menutitle">커플정보</div>
<ul>
<li><a href="" target="body">커플 신청 & 수락</a></li>
<c:if test="${check eq 'no' }">
<li><a href="" target="body">커플 삭제</a></li>
</c:if>
</ul>
<div class="menutitle">마이코스</div>
<ul>
<li><a href="" target="body">코스 리스트</a></li>
</ul>
</div>
</BODY>
</HTML>