<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9be7455c7d33a4e2b750d3537e1179d8&libraries=services"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
 
    function callAjax(nhn){
    	alert(loc_num)
        $.ajax({
	        type: "post",
	        url : "placeReply.nhn?loc_num=${loc_num}",
	        		
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
</head>
<body>
<form name="loc_reply" method="post">
	<table width="500" border="1" cellspacing="0" cellpadding="0" >
	
	<tr align="center">
		<td width="100"> ${id} </td>
		<td width="300"><textarea name="loc_reply" id="loc_reply" cols="35" rows="4" /></td>
		<td width="100"><input type="button" name="loc_reply" value="댓글쓰기" href="#" onclick="callAjax('replyUp.nhn')"> 
	
	</tr>
	</table>
	
	<table width="500" border="1" cellspacing="0" cellpadding="0" >

	<tr align="center">
		<td width="100"> id </td> 
		<td width="300"> 내용 </td> 
		<td width="100"> 작성시간 </td>
	</tr>
	
	<c:forEach var="replyList" items="${replyList}">
	<tr align="center">
		<td width="100">${replyList.id}</td>
		<td width="300">&nbsp;${replyList.loc_reply}</td>
		<td width="100">${replyList.regdate}</td>
	</tr>
	
	</c:forEach>

	<c:if test="${replyList.size()} <= 0">
	<tr align="center">
		<td colspan="5" > 등록된 게시글이 없습니다</td>
	</tr>
	</c:if>
	</tr>
</table>  

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
        <a href="#" onclick="callAjax('placeReply.nhn?pageNum=${startPage - 10 }&loc_num=${loc_num}')">[이전]</a>     
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="#" onclick="callAjax('placeReply.nhn?pageNum=${i}&loc_num=${loc_num}')">[${i}]</a>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="#" onclick="callAjax('placeReply.nhn?pageNum=${startPage + 10 }&loc_num=${loc_num}')">[다음]</a>
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
</html>