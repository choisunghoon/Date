<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9be7455c7d33a4e2b750d3537e1179d8&libraries=services"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>

</head>
<body>
<div id="subMain1" style="float:center;width:86%">
<input type="hidden" onchange="reload('adminEvent.nhn')" value="0" id="chk" />	
<center>
<table width="1000" border="1" cellspacing="0" cellpadding="0" align="center" style="table-layout:fixed;">
	<tr height="auto">
		<td align="center" width="50">이벤트 번호</td>
		<td align="center" width="150">이벤트 이름</td>
		<td align="center" width="250">진행 날짜</td>
		<td align="center" width="50">당첨자 수</td>
		<td align="center" width="50">추첨<br/>유무</td>
		<td align="center" width="200">당첨 커플 이름</td>
		<td align="center" width="100">비고</td>
	</tr>	
	<c:if test="${count == 0}">
	<tr>
		<td colspan="6" align="center">당첨자 정보가 없어요.</td>
	</tr>
	</c:if>
	
	<c:if test="${count != 0}">
	<c:forEach var="eventList" items="${eventList}">
	<tr>
		<td align="center" width="50">${eventList.enumber}</td>
		<td align="center" width="150"><a href="#" onclick="callAjaxyj('test.nhn?enumber=${eventList.enumber}&pageNum=${currentPage}')" >
		${eventList.ename}</a></td>
		<td align="center" width="250">${eventList.sdate}~${eventList.edate}</td>
		<td align="center" width="50">${eventList.wnumber}</td>
		<c:if test="${eventList.w==0}"><c:set var="w" value="무"></c:set></c:if>
		<c:if test="${eventList.w==1}"><c:set var="w" value="유"></c:set></c:if>
		<td align="center" width="50">${w}</td>
		<td align="center" width="200">${eventList.wcouples}</td>
		<td align="center" width="100">
		<c:if test="${eventList.w==0}">
		<button type="button" onclick="callAjaxyj2('wWay.nhn?enumber=${eventList.enumber}&wnumber=${eventList.wnumber}&w=${eventList.w}')">당첨자뽑기</button>
		</c:if>
		<c:if test="${eventList.w==1}">
		<button type="button" onclick="callAjaxyj2('modifyWcouples.nhn?enumber=${eventList.enumber}&wnumber=${eventList.wnumber}&w=${eventList.w}')">당첨자수정및삭제</button>
		</c:if>
		</td>
	</tr>
	
	
	</c:forEach>
	</c:if>
	</table>`
	<br/>
	
	<c:if test="${count > 0}">
   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
   <c:set var="pageBlock" value="${10}"/>
   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
   <c:set var="startPage" value="${result * 10 + 1}" />
   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
   <c:if test="${endPage > pageCount}">
        <c:set var="endPage" value="${pageCount}"/>
   </c:if> 
          
   <c:if test="${startPage > 10}">
        <a href="#" onclick="callAjaxSSS('adminEvent.nhn?pageNum=${startPage - 10 }')">[이전]</a>	
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="#" onclick="callAjaxSSS('adminEvent.nhn?pageNum=${i}')">[${i}]</a>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="#" onclick="callAjaxSSS('adminEvent.nhn?pageNum=${startPage + 10 }')">[다음]</a>
   </c:if>
</c:if>
</center>
	
		<div style="float:center;width:2%">&nbsp;&nbsp;&nbsp;</div>


</div>
</body>
</html>