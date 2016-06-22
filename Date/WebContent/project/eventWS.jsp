<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">  
function searchWs(url){alert(w)
	$.ajax({
		type : "post",		
		url : url,
		success : stest, // 페이지요청 성공시 실행 함수
		error : sError
	//페이지요청 실패시 실행함수
	});
}
function stest(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
    $("#gallery").html(aaa);
    
}
function sError(){
    alert("Error");
}

function callway(enumber, wnumber, w){    
	if(w==1){
		alert("이미 당첨자가 뽑힌 이벤트 입니다. 수정 및 삭제는 해당 관리자 페이지를 이용해 주세요");
		return ;
	}
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
	
	<div class="gallery" id="gallery">
		<ul>
			<c:set var="i" value="1" />
			<c:forEach var="eventList" items="${eventList}">
				<c:if test="${(i%3)!=0}">
					<li><img src="${eventList.eimg}" OnClick="callway(${eventList.enumber}, ${eventList.wnumber}, ${eventList.w})" alt="">${eventList.ename}
					</li>
				</c:if>
				<c:if test="${(i%3)==0}">
					<li class="last"><img src="${eventList.eimg}"  OnClick="callway(${eventList.enumber}, ${eventList.wnumber}, ${eventList.w})" alt="">${eventList.ename}					
					</li>
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
						<a href="#" onclick="searchWs('eventWS.nhn?pageNum=${startPage - 10 }&w=${w}')">[이전]</a>
					</c:if>

					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="#" onclick="searchWs('eventWS.nhn?pageNum=${i}&w=${w}')">[${i}]</a>
					</c:forEach>

					<c:if test="${endPage < pageCount}">
						<a href="#" onclick="searchWs('eventWS.nhn?pageNum=${startPage + 10 }&w=${w}')">[다음]</a>
					</c:if>
				</c:if></li>
		</ul>
	</div>
</body>
</html>