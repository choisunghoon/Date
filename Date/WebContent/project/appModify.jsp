<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">  
function modify() {
	$.ajax({
		type : "post",
		data : {
			"enumber" : $("#enumber").val(),
			"appsubject" : $("#appsubject").val(),
			"appcomment" : $("#appcomment").val(),
			"appnumber" : $("#appnumber").val(),
		},
		url : "appModifyPro.nhn",
		success : test, // 페이지요청 성공시 실행 함수
		error : whenError
	//페이지요청 실패시 실행함수
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
<title>이벤트 댓글 수정</title>
</head>
<body>
<form method="post" name="appModify" >
<table border="1" width="500" height="300" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="30">
				<td align="center" width="100">제목</td>
				<td align="center"><input type="text" id="appsubject" name="appsubject" value="${app.appsubject}"></td>
			</tr>
			<tr height="30">
				<td align="center" width="100">커플 이름</td>
				<td align="center"><input type=hidden name="couplename" value="${app.couplename}">
				<input type=hidden id="appnumber" name="appnumber" value="${app.appnumber}">
				<input type=hidden id="enumber" name="enumber" value="${enumber}">${app.couplename}</td>
			</tr>			
			<tr height="30">
				<td align="center" width="100">이벤트 신청 내용</td>
				<td align="center"><textarea id="appcomment" name="appcomment" rows="13"cols="50">${app.appcomment}</textarea></td>
			</tr> 
			<tr>
				<td colspan="2" align="center">				
				<button type="button" class="btn btn-default" onclick='modify()'>수정완료</button>					
			</tr>	
			</table>
			</form>

</body>
</html>