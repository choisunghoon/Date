<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title> 게시판</title>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
      $("#like").click(function(){

    	  callAjax();
      });
    });

    function callAjax(){
        $.ajax({
	        type: "post",
	        url : "shareDiaryLikeCount.nhn?num=${dto.num}&couplename=${dto.couplename}",
	        
	        success: test2,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
     	});
    }
    function test2(){
        $.ajax({
	        type: "post",
	        url : "shareCount.nhn?num=${dto.num}&likecount=${dto.likecount}",
	        
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
    function callAjax1(nhn){
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
<form name="shareview" method="post">
	<table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td align="center"> <h2> 게시판 </h2></td>
	</tr>

	</table>

	<table width="600" border="1" cellspacing="0" cellpadding="0">

	<tr>
		<td>번호</td>
		<td>${dto.num }</td>
	</tr>
	
	<tr>
		<td> 조횟수</td>
		<td>${dto.readcount }</td>
	</tr>

	<tr>
		<td width="100"> 제목</td>
		<td width="500">${dto.subject}</td>	
	</tr>

	<tr>
		<td> 글쓴이</td>
		<td>${dto.couplename } </td>
	</tr>

	<tr>
		<td> 내용</td>
		<td>
			<img src="syimage/${dto.img }" style="width:500px; height:500px;">	
			<br/>
			<br/>
			
			${dto.content }
			
			<br/>
			<br/>
			
		<div id="like" method="post"><center>
			<input type="button" name="goodLike" value="like" />
			
			<span id="ajaxReturn" > ${dto.likecount }</span><br/>
		   
		</center>   
		</div>	     
		</td>
	</tr>
	</table>                                                         
 		<br/>
 			<input type="button" name="list" value="목록" class="inputb" href="#" onclick="callAjax1('shareDiaryBoard.nhn')"> 
</form>
</body>
</html>
