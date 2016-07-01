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
<script type="text/javascript">
	function callAjaxSS(nhn, way) {
		$.ajax({
			type : "post",
			url : nhn + "?way=" + way,
			data : {
				states : $('#states').val(),
				pick : $('#pick').val(),
				keyword : $("#keyword").val()
			},
			success : refreshSS, // 페이지요청 성공시 실행 함수
			error : whenErrorSS
		//페이지요청 실패시 실행함수
		});
	}
	
	function refreshSS(aaa) { // 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
		$("#subMain1").html(aaa);

	}
	function whenErrorSS() {
		alert("Error");
	}

	function callAjaxSSS(nhn) {
		$.ajax({
			type : "post",
			url : nhn,
			data : {
				states : $('#states').val(),
				pick : $('#pick').val(),
				keyword : $("#keyword").val()
			},
			success : refreshSSS, // 페이지요청 성공시 실행 함수
			error : whenErrorSSS
		//페이지요청 실패시 실행함수
		});
	}
	
	function callAjaxyj3(nhn) {
		$.ajax({
			type : "post",
			url : nhn,
			success : refreshSSS, // 페이지요청 성공시 실행 함수
			error : whenErrorSSS
		//페이지요청 실패시 실행함수
		});
	}
	
	function refreshSSS(aaa) { // 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
		$("#subMain").html(aaa);

	}
	function whenErrorSSS() {
		alert("Error");
	}
	
	function callAjaxyj(nhn){
		cw = screen.availWidth; //화면 넓이
		ch = screen.availHeight; //화면 높이

		sw = 700; //띄울 창의 넓이
		sh = 650; //띄울 창의 높이

		ml = (cw - sw) / 2; //가운데 띄우기위한 창의 x위치
		mt = (ch - sh) / 2;
	//	open.window()

		url = nhn;
		open(url, "way",
				"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,"
						+ "width=" + sw + ",height=" + sh + ",top=" + mt
						+ ",left=" + ml);
		self.close();
	}
	
	function callAjaxyj2(nhn){
		cw = screen.availWidth; //화면 넓이
		ch = screen.availHeight; //화면 높이

		sw = 700; //띄울 창의 넓이
		sh = 650; //띄울 창의 높이

		ml = (cw - sw) / 2; //가운데 띄우기위한 창의 x위치
		mt = (ch - sh) / 2;
	//	open.window()

		url = nhn;
		open(url, "way",
				"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,"
						+ "width=" + sw + ",height=" + sh + ",top=" + mt
						+ ",left=" + ml);
		self.close();
	}
	
	function reload(nhn){
		$.ajax({
			type : "post",
			url : nhn,
			success : refreshSSS, // 페이지요청 성공시 실행 함수
			error : whenErrorSSS
		//페이지요청 실패시 실행함수
		});
	}
	
</script>
</head>
<body>
<div id="a">
<center><h2>마이 코스 리스트(전체 : ${count})</h2>	
</center>

<div id="subMain1" style="float:center;width:86%">
<input type="hidden" onchange="reload('adminEvent.nhn')" value="0" id="chk" />	
<center>
<table width="500" border="1" cellspacing="0" cellpadding="0" align="center" style="table-layout:fixed;">
	<tr height="auto">
		<td align="center" width="50">게시글 번호</td>
		<td align="center" width="400">제목</td>
		
		
	
		<td align="center" width="50">비고</td>
	</tr>	
	<c:if test="${count == 0}">
	<tr>
		<td colspan="6" align="center">리스트가 비어있습니다.</td>
	</tr>
	</c:if>
	
	<c:if test="${count != 0}">
	<c:forEach var="eventList" items="${eventList}">
	<tr>
		<td align="center" width="50">${eventList.enumber}</td>
		<td align="center" width="400"><a href="#" onclick="callAjaxyj('test.nhn?enumber=${eventList.enumber}&pageNum=${currentPage}')" >
		${eventList.ename}</a></td>
		<td align="center" width="50">
		<button type="button" onclick="callAjaxyj2('deletelist.nhn')">삭제</button>
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
        <a href="#" onclick="callAjaxSSS('mylist.nhn?pageNum=${startPage - 10 }')">[이전]</a>	
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="#" onclick="callAjaxSSS('mylist.nhn?pageNum=${i}')">[${i}]</a>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="#" onclick="callAjaxSSS('mylist.nhn?pageNum=${startPage + 10 }')">[다음]</a>
   </c:if>
</c:if>
</center>
	
		<div style="float:center;width:2%">&nbsp;&nbsp;&nbsp;</div>


</div>
</body>
</html>