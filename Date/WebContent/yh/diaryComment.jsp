<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Comment</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
      $("#like").click(function(){

    	  callAjax1();
      });
    });

    function callAjax1(){
        $.ajax({
	        type: "post",
	        url : "shareDiaryLikeCount.nhn?num=${dto.num}&couplename=${couplename}",
	        
	        success: test2,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
     	});
    }
    function test2(){
        $.ajax({
	        type: "post",
	        url : "shareDiaryCount.nhn?num=${dto.num}&likecount=${dto.likecount}",
	        
	        success: test,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
     	});
    }
    function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $("#ajaxReturn").html(aaa);
        console.log(resdata);
    }
    function whenError(){
        alert("Error");
    }
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
</script>
</head>
<body>
<form name="comment" method="post">
	<table width="500" border="1" cellspacing="0" cellpadding="0" >
	
	<tr align="center">
		<td width="500"> ${id} </td>
	<tr>
	
	<tr align="center">
		<td><textarea name="comment" cols="30" rows="4" /></td>
		<td><input type="button" name="commentup" value="commentup" href="#" onclick="callAjax1('shareDiaryBoard.nhn')"> 
	
	</tr>
	</table>
	
	
	<table width="500" border="1" cellspacing="0" cellpadding="0" >

	<tr align="center">
		<td width="100"> id </td> 
		<td width="300"> 내용 </td> 
		<td width="100"> 작성시간 </td>
	</tr>
	
	<c:forEach var="list" items="${list }">
	<tr align="center">
		<td>${list.id }</td>
		<td align="left">&nbsp;
		<a href="#" onclick=""> 
		${list.diarycomment}</a></td>
		<td>${list.regdate}</td>
	</tr>
	
	</c:forEach>
		
	<c:if test="${list.size()} <= 0">
	<tr align="center">
		<td colspan="5" > 등록된 댓글이 없습니다</td>
	</tr>
	</c:if>
		<tr align="center">
		<td colspan="5"> ${pagingHtml}</td>
	</tr>
</table>        
</form>
</body>
</html>