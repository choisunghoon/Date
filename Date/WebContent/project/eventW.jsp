<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script type="text/javascript">  
function callway(enumber, wnumber){    
	 url = "wWay.nhn?enumber=" + enumber + "&wnumber=" + wnumber
     open(url, "wWay", 
     "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
}
 </script>
<style>
.gallery {
	display: block;
	width: 100%;
	line-height: 1.6em;
	margin-left: 70px;
}

.gallery ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

.gallery li {
	display: block;
	float: left;
	width: 350px;
	margin: 35px 5px 5px 35px;
	padding: 0;
}

.gallery li.last {
	margin-right: 0;
}

.gallery li.page {
	margin-left: 45%;
}

.gallery li img {
	display: block;
	width: 340px;
	height: 430px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 - 당첨자 관리</title>
</head>
<body>
	<center><h2>당첨자 관리</h2></center>
	<div class="gallery">
		<ul>
			<c:set var="i" value="1" />
			<c:forEach var="eventList" items="${eventList}">
				<c:if test="${(i%3)!=0}">
					<li><img src="${eventList.eimg}" OnClick="callway(${eventList.enumber}, ${eventList.wnumber})" alt="">${eventList.ename}
						카운트:${count} i:${i}</li>
				</c:if>
				<c:if test="${(i%3)==0}">
					<li class="last"><a href="eventContent.nhn"><img
							src="${eventList.eimg}" alt=""></a>${eventList.ename}
						카운트:${count} i:${i}</li>
				</c:if>
				<c:set var="i" value="${i+1}" />
			</c:forEach>
			<li class="page">
			<c:if test="${count > 0}">
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
						<a href="eventTeb.nhn?pageNum=${startPage - 10 }">[이전]</a>
					</c:if>

					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="eventTeb.nhn?pageNum=${i}">[${i}]</a>
					</c:forEach>

					<c:if test="${endPage < pageCount}">
						<a href="eventTeb.nhn?pageNum=${startPage + 10}">[다음]</a>
					</c:if>
				</c:if></li>
		</ul>
	</div>
</body>
</html>