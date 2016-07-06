<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
function callAjax(nhn){
    $.ajax({
        type: "post",
        url : nhn,
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
<br/><br/>
<center>
<title> 다이어리 공유 게시판 </title>	
</head>

<body>
<form method="post">
	<table width="600" border="0" cellspacing="0" cellpadding="2">
	
		<tr>
			<td align="center" colspan="0"> <h2> 다이어리 공유 게시판 </h2></td>
		</tr>
	</table>

	<br/>	
	<table width="800" border="1" cellspacing="0" cellpadding="2">
	<tr align="center">
		<td width="70">글번호</td>
		<td width="510">제목</td>
		<td width="80">커플네임</td>
		<td width="70">조회</td>
		<td width="70">좋아요</td>
	</tr>
	
	<c:forEach var="list" items="${list }">
	<tr align="center">
		<td>${list.num }</td>
		<td align="left">&nbsp;
		<a href="#" onclick="callAjax('shareDiaryBoardView.nhn?num=${list.num }&id=${id}')"> ${list.subject}</a></td>
		<td align="center"> ${list.couplename}</td>
		<td>${list.readcount}</td>
		<td>${list.likecount}</td>
	</tr>
	</c:forEach>
		
	<c:if test="${list.size() <= 0} ">
	<tr align="center">
		<td colspan="5" > 등록된 게시글이 없습니다</td>
	</tr>
	</c:if>
	</table><br/>
		<tr align="center">
		<td colspan="5"> ${pagingHtml}</td>
	</tr>
	
</form>
</body>
</html>
