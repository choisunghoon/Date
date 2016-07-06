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
		if(document.shareview.likelimit.value > 5){
			alert("좋아요 숫자 초과");
		}else{
				success:callAjax1();
		}
      });
    });
    function callAjax1(){
        $.ajax({
	        type: "post",
	        url : "shareDiaryLikeCount.nhn?num=${dto.num}&couplename=${couplename}&check1=${check1}",
	        
	        success:test,	// 페이지요청 성공시 실행 함수
	        error: whenError
     	});
    }
    function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $("#ajaxReturn").html(aaa);
        console.log(resdata);
    }
    function whenError(){
        alert("하루 가능한 좋아요 횟수 초과");
    }
    
    function callAjax3(nhn){
        $.ajax({
            type: "post",
            url : "commentUp.nhn?num=${num}&id=${id}",
            data : {diarycomment : $('#diarycomment').val(),
            	   img : $('#appimg').val()},
            success: callAjax2,	// 페이지요청 성공시 실행 함수
            error: whenError2	//페이지요청 실패시 실행함수
     	});
    }
    function callAjax2(nhn){
        $.ajax({
            type: "post",
            url : "dairyComment.nhn?num=${dto.num}&id=${id}",
            success: refresh2,	// 페이지요청 성공시 실행 함수
            error: whenError2	//페이지요청 실패시 실행함수
     	});
        
        
    }
    function refresh2(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $("#ajaxReturn1").html(aaa);
        console.log(resdata);
    }
    
</script>
</head>
<br/><br/>
<center>
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
		<td><center>
			<img src="syimage/${dto.img }" style="width:500px; height:300px;">	
			<br/>
			<br/>
			
			${dto.content }
			</center>
			<br/>
		<div id="like" method="post"><center>
			<span id="ajaxReturn">

			<c:if test="${check ==0 }"> 
				<img src="yh/img/c31.png" type= "button" name="goodLike" style="margin-top:5px;">&nbsp;&nbsp; ${dto.likecount} 
			</c:if>
			<c:if test="${check !=0 }"> 
				<img src="yh/img/c32.png" type= "button" name="goodLike" style="margin-top:5px;">&nbsp;&nbsp; ${dto.likecount} 
			</c:if>
			</span><br/>
					
		</center>   
		</div>	     
		</td>
		</tr>                                                       
 		<td align="right">
 		<br/><br/>
 		
 			 <c:if test="${id=='admin'}">
 				<img src="yh/img/c3.png" type="button" value="delete" onclick="callAjax('deleteDiaryList.nhn?num=${dto.num }')"/>&nbsp;&nbsp;
 			</c:if>
 				<img src="yh/img/z59.png" type="button" name="list" value="글 목록" class="inputb" href="#" onclick="callAjax('shareDiaryBoard.nhn')"/>&nbsp;&nbsp;
				<img src="yh/img/z57.png" type="button" name="comment" value="댓글 보기"  href="#" onclick="callAjax2('dairyComment.nhn')" /> </td>
		<input id="likelimit" name="likelimit" value="${check1}" type="hidden">
		</input>
		</table>
		<tr>
		<br/>
		<div alingn="left">
		<td><span id="ajaxReturn1" > </span><br/></td>
		</tr>  
		<br/>

		<br/>
 			
</form>
</body>
</html>
