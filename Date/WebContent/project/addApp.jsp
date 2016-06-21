<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script language='javascript'>
	function checkApp(){
		var c = document.getElementsByName('apppwC');
		if(c[1].checked==true){
			if(addApp.apppw.value == "")
				{
					alert("비공개를 원하실 경우 비밀번호를 입력해주셔야 합니다!");
					
					return;
				
				}			
		}
		if(c[0].checked==true){
			if(addApp.apppw.value != ""){
				alert("비공개를 원하실 경우에만 비밀번호를 입력해주셔야 합니다!");
				return;
				}
		}
		$.ajax({
			type : "post",
			data : {
				"appsubject" : $("#appsubject").val(),
				"enumber" : $("#enumber").val(),
				"couplename" : $("#couplename").val(),
				"apppw" : $("#apppw").val(),
				"appcomment" : $("#appcomment").val()
			},
			url : "addAppPro.nhn",
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이벤트 참여</title>
</head>
<body>
	<form method="post" name="addApp">
		<table border="1" width="500" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="30">
				<td align="center" width="100">제목</td>
				<td align="center"><input type="text" id="appsubject" name="appsubject">
									<input type="hidden" id="enumber" name="enumber" value="${enumber}">
									<input type="hidden" id="couplename" name="couplename" value="3"></td>
			</tr>
			<tr height="30">
				<td align="center" width="100">비밀번호</td>
				<td align="center"><input type=radio name="apppwC" checked>공개&nbsp;&nbsp; 
									<input type=radio name="apppwC">비공개<br/>
									*비공개시 비밀번호를 입력해주세요!
								   <input id="apppw" name="apppw" type="text"></td>
			</tr>			
			<tr height="30">
				<td align="center" colspan=2 >이벤트 신청 내용</td>
			</tr>
			<tr>
				<td align="center" colspan=2>
				<textarea name="appcomment" name="appcomment" rows="13"cols="50"></textarea></td>
			</tr>
			<tr>
				<td colspan=2 align="center">
				<button type="button" class="btn btn-default" onclick='checkApp()'>신청</button>				
			</tr>				
		</table>
	</form>
</body>
</html>