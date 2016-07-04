<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">  
    function confrimPw(){
    	 $.ajax({    		
 	        type: "post", 
 	       data : { "apppw" : $("#apppw").val() ,
 	    	   		"appnumber" : $("#appnumber").val(),
 	    	   		"enumber" : $("#enumber").val(),
 	    	   		"wnumber" : $("#wnumber").val(),
 	    	   		"tab" : $("#tab").val(),
 	    	   		"pageNum" : $("#pageNum").val(),
 	    	   		
 	       },
 	        url : "confirmPwPro.nhn",
 	        success: test,	// 페이지요청 성공시 실행 함수
 	        error: whenError	//페이지요청 실패시 실행함수
      	});
    }
    function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $(".modal-bodyy").html(aaa);	//id가 ajaxReturn인 부분에 넣어라
    }
    function whenError(){
        alert("Error");
    }
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>댓글 비밀번호 확인</title>
</head>
<body>
<form method="post" name="confirmPw">
<center><h2>비밀번호를 입력해주세요.</h2>
비밀번호 : <input type="password" id="apppw" name="apppw">
<input type="hidden" id="appnumber" name="appnumber" value="${appnumber}">
<input type="hidden" id="wnumber" name="wnumber" value="${wnumber}">
<input type="hidden" id="enumber" name="enumber" value="${enumber}">
<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
<input type="hidden" id="tab" name="tab" value="${tab}">
<button type="button" class="btn btn-default" onclick="confrimPw()">확인</button>
</center>
</form>
</body>
</html>