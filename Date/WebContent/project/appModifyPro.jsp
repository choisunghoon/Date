<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script language='javascript'>
function modifyPro() {
		$.ajax({
			type : "post",
			data : {"enumber" : $("#enumber").val()},
			url : "eventContent.nhn",
			success : test, // 페이지요청 성공시 실행 함수
			error : whenError
		//페이지요청 실패시 실행함수
		});
	}
	function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $(".modal-body").html(aaa);	//id가 ajaxReturn인 부분에 넣어라
    }
    function whenError(){
        alert("Error");
    }
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이벤트 댓글 수정</title>
</head>
<body>
<center>
<input type="hidden" id="enumber" name="enumber" value="${enumber}">
<h2>수정이 완료되었습니다!</h2>
<button type="button" class="btn btn-default" onclick='modifyPro()'>이벤트 창으로</button>		
</center>
</body>
</html>