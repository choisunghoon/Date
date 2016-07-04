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
	function checkSS(form) {    
		if (document.form.states.value != "1") {
			if (document.form.keyword.value == "") {
				alert("검색어를 입력하세요.");
				document.form.keyword.focus();
				return false;
			}
			else if (document.form.keyword.value != "") {
				callAjaxSS('adminEventPro.nhn', document.form.way.value);
			}
		} 
		else if (document.form.states.value == "1") {
			if (document.form.keyword.value != "") {
				alert("전체 조건 선택 후 검색어를 입력하지 마세요.");
				document.form.keyword.focus();
				return false;
			}
			else if (document.form.keyword.value == ""){
				callAjaxSS('adminEventPro.nhn', document.form.way.value);
			}
		}
	}

	function callAjaxSS(nhn) {
		$.ajax({
			type : "post",
			url : nhn,
			data : {
				states : $('#states').val(),
				pick : $('#pick').val(),
				keyword : $("#keyword").val(),
				way : $("#way").val()
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

		sw = 800; //띄울 창의 넓이
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
<center><h2>이벤트 전체 리스트(전체 : ${count})</h2>	
		<form name="form" method="post" onSubmit="check()" >
			<input type="hidden" name="search" value="1">
			<input type=radio name="way" id="way" value="3" checked>전체
			<input type=radio name="way" id="way" value="1">추첨
			<input type=radio name="way" id="way" value="0">미추첨&nbsp;
			<input type="text" id="keyword" name="keyword" value="" size="15" maxlength="15">       			
			<select name="states" id="states">
				<option value="1">전체</option>
				<option value="2">이벤트 이름</option>
				<option value="3">당첨 커플</option>
			</select>
			<a href="#" onclick="checkSS(this.form)"><img src="/Date/button/z1.png"></a>
		</form></center>
		</div>
		<a href="#" onclick="callAjaxyj3('addEvent.nhn')"><img src="/Date/button/z50.png" style="margin-left:905px; margin-bottom:10px;"></a>
<div id="subMain1" style="float:center;width:86%">
<input type="hidden" onchange="reload('adminEvent.nhn')" value="0" id="chk" />	
<center>
<table width="1000" border="1" cellspacing="0" cellpadding="0" align="center" style="table-layout:fixed;">
	<tr height="auto">
		<td align="center" width="50">이벤트 번호</td>
		<td align="center" width="150">이벤트 이름</td>
		<td align="center" width="200">진행 날짜</td>
		<td align="center" width="50">당첨자 수</td>
		<td align="center" width="150">추첨<br/>유무</td>
		<td align="center" width="200">당첨 커플 이름</td>
		<td align="center" width="100">비고</td>
	</tr>	
	<c:if test="${count == 0}">
	<tr>
		<td colspan="6" align="center">당첨자 정보가 없어요.</td>
	</tr>
	</c:if>
	
	<c:if test="${count != 0}">
	<c:forEach var="WList" items="${WList}">
	<tr>
		<td align="center" width="50">${WList.enumber}</td>
		<td align="center" width="150"><a href="#" onclick="callAjaxyj('test.nhn?enumber=${WList.enumber}&pageNum=${currentPage}')" >
		${WList.ename}</a></td>
		<td align="center" width="200">${WList.sdate}~${WList.edate}</td>
		<td align="center" width="50">${WList.wnumber}</td>
		<c:if test="${WList.w==0}"><c:set var="w" value="무"></c:set></c:if>
		<c:if test="${WList.w==1}"><c:set var="w" value="유"></c:set></c:if>
		<td align="center" width="150">${w}<c:if test="${WList.wc!=0}"><br/>필요 당첨자 수:${WList.wc}</c:if></td>
		<td align="center" width="200">${WList.wcouples}</td>
		<td align="center" width="100">
		<c:if test="${WList.w==0}">
		<a href="#" onclick="callAjaxyj2('wWay.nhn?enumber=${WList.enumber}&wnumber=${WList.wnumber}&w=${WList.w}')"><img src="/Date/button/z48.png"></a>
		</c:if>
		<c:if test="${WList.w==1}">
		<a href="#" onclick="callAjaxyj2('modifyWcouples.nhn?enumber=${WList.enumber}&wnumber=${WList.wnumber}&w=${WList.w}')"><img src="/Date/button/z49.png"></a>
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