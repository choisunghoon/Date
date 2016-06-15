<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<body>
<center><h2>포인트내역확인(전체 내역 : ${count})</h2>
<table width="500" border="1" cellspacing="0" cellpadding="0"   align="center">

	<tr height="30" >
		<td align="center" width="100">번	호</td>
		<td align="center" width="150">커플 i d</td>
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
	<c:forEach var="orderList" items="${orderList}">
	<tr>
		<td align="center">${orderList.num}</td>
		<td align="center">${orderList.id}</td>
		<td align="center">${orderList.code}</td>
		<td align="center">${orderList.stat}</td>
		<td align="center">${orderList.reg_date}</td>
		<td align="center">${orderList.ea}</td>

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
        <a href="orderListForm.nhn?pageNum=${startPage - 10 }">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="orderListForm.nhn?pageNum=${i}">[${i}]</a>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="orderListForm.nhn?pageNum=${startPage + 10}">[다음]</a>
   </c:if>
</c:if>
		
</center>
</body>