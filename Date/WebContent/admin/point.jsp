<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
	function search(){
		var sch_value=jQuery('#form_search #sch_value').val();
		if (sch_value == '') {alert('검색어를 입력하세요.');}
		else{
			jQuery('#form_search').submit();
		}
	}
</script>

<body>
<center><h2>포인트내역확인(전체 내역 : ${count})</h2>
<form id="form_search" method="get" action="point.nhn">
<select id="sch_type" name="sch_type">
	<option value="subject" selected="selected">커플 이름</option>
	<option value="board">게시판</option>
</select>
<input type="text" id="sch_value" name="sch_value" />
<button type="button" onclick="search();">검색</button>
<table width="500" border="1" cellspacing="0" cellpadding="0"   align="center">

	<tr height="30" >
		<td align="center" width="100">번	호</td>
		<td align="center" width="150">커플 이름</td>
		<td align="center" width="150">사용포인트</td>
		<td align="center" width="150">얻은포인트</td>
		<td align="center" width="250">사용/획득 게시판</td>
		<td align="center" width="200">사용/획득 시간</td>
	</tr>
	
	<c:if test="${count == 0}">
	<tr>
		<td colspan="6" align="center">포인트 내역이 없어요</td>
	</tr>
	</c:if>
	<c:if test="${count != 0}">
	<c:forEach var="pointList" items="${pointList}">
	<tr>
		<td align="center">${pointList.num}</td>
		<td align="center">${pointList.couplename}</td>
		<td align="center">${pointList.usePoint}</td>
		<td align="center">${pointList.getPoint}</td>
		<td align="center">${pointList.place}</td>
		<td align="center">${pointList.regdate}</td>

	</tr>
	</c:forEach>
	</c:if>
	</table>
	<br />
	
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
        <a href="point.nhn?pageNum=${startPage - 10 }">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="point.nhn?pageNum=${i}">[${i}]</a>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="point.nhn?pageNum=${startPage + 10}">[다음]</a>
   </c:if>
</c:if>
</form>
</center>
</body>