<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script type="text/javascript">  
    function callAppM(appnumber, enumber){    
    	 $.ajax({    		
 	        type: "post", 	 
 	        url : "appModify.nhn?appnumber="+appnumber+"&enumber="+enumber,
 	        success: test,	// 페이지요청 성공시 실행 함수
 	        error: whenError	//페이지요청 실패시 실행함수
      	});
    }
    function callAppD(appnumber, enumber){  
   	 $.ajax({    		
	        type: "post", 	 
	        url : "appDelete.nhn?appnumber="+appnumber+"&enumber="+enumber,
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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>댓글보기</title>
</head>
<body>
<form method="post" name="appContent" action="appW.nhn?enumber=${enumber}&pageNum=${pageNum}">
<table border="1" width="500" height="300" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="20">
				<td align="center" width="100">제목</td>
				<td align="center">${app.appsubject}</td>
			</tr>
			<tr height="20">
				<td align="center" width="100">커플 이름</td>
				<td align="center"><input type=hidden name="couplename" value="${app.couplename}">
				<input type="hidden" name="enumber" value="${enumber}">
				<input type="hidden" name="wnumber" value="${wnumber}">
				<input type=hidden name="appnumber" value="${app.appnumber}">${app.couplename} <img src="${app.appimg}" style="width:32;height:29"></td>
			</tr>			
			<tr height="40">
				<td align="center" width="100">이벤트 신청 내용</td>
				<td align="center">${app.appcomment}</td>
			</tr> 
			<c:if test="${id == app.couplename || tab==1}">					
			<tr height="20">
				<td colspan="2" align="center">
				 <a href="#" onclick="callAppM(${app.appnumber},${enumber})"><input type="button" value="수정"></a>
				 <a href="#" onclick="callAppD(${app.appnumber},${enumber})"><input type="button" value="삭제"></a></td>
			</tr>		
			</c:if>
		</table>		
		</form>
</body>
</html>