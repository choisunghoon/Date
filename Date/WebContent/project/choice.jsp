<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
	<c:if test="${wnumber>0 }">
	<table border="1" width="500" cellpadding="0" cellspacing="0"
		align="center">
		<tr>
			<td colspan="3" align="right"> ��÷�� �� : ${wnumber}&nbsp;</td>
		</tr>		
		<tr height="30">
			<td align="center" width="50">�� ��ȣ</td>
			<td align="center" width="100">Ŀ�� �̸�</td>
			<td align="center" width="300">����</td>
			<c:forEach var="appList" items="${appList}">
				<tr height="30">
					<td align="center">${appList.appnumber}</td>
					<td align="center">${appList.couplename}</td>
					<td align="center"><a href="appContentAdmin.nhn?enumber=${enumber}&appnumber=${appList.appnumber}&wnumber=${wnumber}&pageNum=${currentPage}">${appList.appsubject}</a></td>
				</tr>
			</c:forEach>
		</tr>
	</table>
	
	<center><c:if test="${count > 0}">
		<c:set var="pageCount"
			value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
		<c:set var="pageBlock" value="${10}" />
		<fmt:parseNumber var="result" value="${currentPage / 10}"
			integerOnly="true" />
		<c:set var="startPage" value="${result * 10 + 1}" />
		<c:set var="endPage" value="${startPage + pageBlock-1}" />
		<c:if test="${endPage > pageCount}">
			<c:set var="endPage" value="${pageCount}" />
		</c:if>

		<c:if test="${startPage > 10}">
			<a href="choice.nhn?enumber=${enumber}&wnumber=${wnumber}&pageNum=${startPage - 10 }">[����]</a>
		</c:if>

		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="choice.nhn?enumber=${enumber}&wnumber=${wnumber}&pageNum=${i}">[${i}]</a>
		</c:forEach>

		<c:if test="${endPage < pageCount}">
			<a href="choice.nhn?enumber=${enumber}&wnumber=${wnumber}&pageNum=${startPage + 10}">[����]</a>
		</c:if>
	</c:if></center></c:if>
	
		<c:if test="${wnumber==0 }">
		<center><h2>�� �̻� ��÷�ڸ� ���� �� �����ϴ�.</h2>
		<h2>�ʿ��� ��÷�� �� : ${wnumber}</h2></center>
		</c:if>
</body>
</html>