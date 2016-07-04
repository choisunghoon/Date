<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">  
function confirmPwPro(){
  	 $.ajax({    		
	        type: "post", 
	       data : { "appnumber" : $("#appnumber").val(),
	    	   		"enumber" : $("#enumber").val(),
	    	   		"wnumber" : $("#wnumber").val(),
	    	   		"tab" : $("#tab").val(),
	    	   		"pageNum" : $("#pageNum").val(),
	    	   		
	       },
	        url : "appContent.nhn",
	        success: test,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
    	});
  }
    function confrimPwRe(){
   	 $.ajax({    		
	        type: "post", 
	       data : { "appnumber" : $("#appnumber").val(),
	    	   		"enumber" : $("#enumber").val(),
	    	   		"wnumber" : $("#wnumber").val(),
	    	   		"tab" : $("#tab").val(),
	    	   		"pageNum" : $("#pageNum").val(),
	    	   		
	       },
	        url : "confirmPw.nhn",
	        success: test,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
     	});
   }
    
    function confrimPwCon(){
      	 $.ajax({    		
   	        type: "post", 
   	       data : { "enumber" : $("#enumber").val()
   	    	   		
   	       },
   	        url : "eventContent.nhn",
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
</head>

<input type="hidden" id="appnumber" name="appnumber" value="${appnumber}">
<input type="hidden" id="wnumber" name="wnumber" value="${wnumber}">
<input type="hidden" id="enumber" name="enumber" value="${enumber}">
<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
<input type="hidden" id="tab" name="tab" value="${tab}">
<center>
<c:if test="${check==1}">
<script>
	confirmPwPro();
</script>
</c:if>
<c:if test="${check==0}">
<h2>비밀번호가 맞지 않습니다.</h2>
<a href="#" onclick="confrimPwRe()"><img src="/Date/button/z56.png"></a>
<a href="#" onclick="confrimPwCon()"><img src="/Date/button/z55.png"></a>
</c:if>
</center>
</body>
</html>