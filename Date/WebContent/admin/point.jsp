<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9be7455c7d33a4e2b750d3537e1179d8&libraries=services"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

	function check() {
    	if (document.form.keyword.value == "") {
        	alert("검색어를 입력하세요.");
        	document.form.keyword.focus();
        	return false;
    	}
    	else if(document.form.keyword.value != ""){
    		callAjax('pointPro.nhn');
    		
    	}
	}
 
    function callAjax(nhn){
        $.ajax({
	        type: "post",
	        url : nhn,
	        data:{
	        	keyword: $("#keyword").val(),
	        	states : $('#states').val()
	        },
	        success: refresh,	// 페이지요청 성공시 실행 함수
	        error: whenError2	//페이지요청 실패시 실행함수
     	});
    }
    function refresh(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $("#subMain").html(aaa);
        
    }
    function whenError2(){
        alert("Error");
    }
 
  </script>

<body>
<center><h2>포인트내역확인(전체 내역 : ${count})</h2>
		
		<form name="form" method="post" onSubmit="check()" >
			<input type="hidden" name="search" value="1">
			<input type="text" id="keyword" name="keyword" value="" size="15" maxlength="15">
			
			
			<select name="states" id="states">
				<option value="1">포토북</option>
				<option value="2">다이어리 공유</option>
				<option value="3">코스 공유</option>
			</select>
				<a href="#"  onclick="check()"><img src="button/z1.png"></a>${dto.likeCount}</span>
		</form>	
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
	<c:if test="${count1 == 0}">
	<tr>
		<td colspan="6" align="center">검색 내역이 없어요</td>
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
        <a href="#" onclick="callAjax('point.nhn?pageNum=${startPage - 10 }')">[이전]</a>     
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="#" onclick="callAjax('point.nhn?pageNum=${i}')">[${i}]</a>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="#" onclick="callAjax('point.nhn?pageNum=${startPage + 10 }')">[다음]</a>
   </c:if>
</c:if>
</form>
</center>
	</div>
		<div style="float:center;width:2%">&nbsp;&nbsp;&nbsp;</div>
		<div id="subMain" style="float:center;width:86%">		
		</div>
	</div>
</body>