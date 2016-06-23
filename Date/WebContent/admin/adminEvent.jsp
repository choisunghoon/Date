<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9be7455c7d33a4e2b750d3537e1179d8&libraries=services"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">

	function checkSS() {
    	if (document.form.keyword.value == "") {
        	alert("검색어를 입력하세요.");
        	document.form.keyword.focus();
        	return false;
    	}
    	else if(document.form.keyword.value != ""){
    		callAjaxSS('adminEventPro.nhn');
    		
    	}
	}
 
    function callAjaxSS(nhn){
        $.ajax({
	        type: "post",
	        url : nhn,
	        data:{
	        	states : $('#states').val(),
	        	pick : $('#pick').val(),
	        	keyword: $("#keyword").val()
	        },
	        success: refreshSS,	// 페이지요청 성공시 실행 함수
	        error: whenErrorSS	//페이지요청 실패시 실행함수
     	});
    }
    function refreshSS(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $("#subMain1").html(aaa);
        
    }
    function whenErrorSS(){
        alert("Error");
    }
    
    function callAjaxSSS(nhn){
        $.ajax({
	        type: "post",
	        url : nhn,
	        data:{
	        	states : $('#states').val(),
	        	pick : $('#pick').val(),
	        	keyword: $("#keyword").val()
	        },
	        success: refreshSSS,	// 페이지요청 성공시 실행 함수
	        error: whenErrorSSS	//페이지요청 실패시 실행함수
     	});
    }
    function refreshSSS(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $("#subMain").html(aaa);
        
    }
    function whenErrorSSS(){
        alert("Error");
    }
    


  </script>

<body>
<div id="a">
<center><h2>당첨자 확인(전체 내역 : ${count})</h2>
		
		<form name="form" method="post" onSubmit="check()" >
			<input type="hidden" name="search" value="1">
			<input type="text" id="keyword" name="keyword" value="" size="15" maxlength="15">
			
			
			<select name="states" id="states">
				<option value="1">이벤트 이름</option>
				<option value="2">당첨 커플</option>
			</select>
				<input type="button" value="검색" onclick="checkSS()">
				<select name="pick" id="pick" onchange="callAjaxSS('adminEventPro1.nhn')">
				<option value="1">추첨</option>
				<option value="0">미추첨</option>
			</select>
			
		</form>	
		</div>
<div id="subMain1" style="float:center;width:86%">	

<table width="1000" border="1" cellspacing="0" cellpadding="0"   align="center">
	<tr height="30" >
		<td align="center" width="100">이벤트 번호</td>
		<td align="center" width="150">이벤트 이름</td>
		<td align="center" width="350">진행 날짜</td>
		<td align="center" width="100">당첨자 수</td>
		<td align="center" width="100">추첨 유무</td>
		<td align="center" width="200">당첨 커플 이름</td>
	</tr>	
	<c:if test="${count == 0}">
	<tr>
		<td colspan="6" align="center">당첨자 정보가 없어요.</td>
	</tr>
	</c:if>
	
	<c:if test="${count != 0}">
	<c:forEach var="eventList" items="${eventList}">
	<tr>
		<td align="center" width="100">${eventList.enumber}</td>
		<td align="center" width="150">${eventList.ename}</td>
		<td align="center" width="350">${eventList.sdate}~${eventList.edate}</td>
		<td align="center" width="100">${eventList.wnumber}</td>
		<td align="center" width="100">${eventList.w}</td>
		<td align="center" width="200">${eventList.wcouples}</td>
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