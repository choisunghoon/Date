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
    function callAjax2(nhn){
        $.ajax({
            type: "post",
            url : nhn,
            success: refresh2,	// 페이지요청 성공시 실행 함수
            error: whenError2	//페이지요청 실패시 실행함수
     	});
    }
    function refresh2(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $("#ajaxReturn1").html(aaa);
        
    }
    
</script>
</head>

<body>
<form name="shareview" method="post">
	<br/>
	<br/>
	<table width="500" border="0" cellspacing="0" cellpadding="0" >

	<tr align="center">
		<td width="90"> ${dto.couplename } </td><td width="230"> ${dto.subject} </td>
		<td width="90">${dto.num }번글</td><td width="90">조횟수 ${dto.readcount }</td> 
	</tr>

	</table>
	<br/>
	<table width="500" border="0" cellspacing="0" cellpadding="0">
	<tr>
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
 			<input type="button" name="list" value="목록" class="inputb" href="#" onclick="callAjax('shareDiaryBoard.nhn')"> 
 		<br/>
 		<br/>
		
			<input type="button" name="comment" value="댓글보기" href="#" onclick="callAjax2('diaryComment.nhn?num=${num}')"> 
		<br/>
			<span id="ajaxReturn1" > </span><br/>
			
</form>
</body>
</html>
