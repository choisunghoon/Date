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
		success : test, // ��������û ������ ���� �Լ�
		error : whenError
	//��������û ���н� �����Լ�
	});
}
function test(aaa){	// ��û������ ������������ aaa ������ �ݹ�ȴ�. 
    $(".modal-bodyy").html(aaa);	//id�� ajaxReturn�� �κп� �־��
}
function whenError(){
    alert("Error");
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�̺�Ʈ ��� ����</title>
</head>
<body>
<form method="post" name="appModify" >
<table border="1" width="500" height="300" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="30">
				<td align="center" width="100">����</td>
				<td align="center"><input type="text" id="appsubject" name="appsubject" value="${app.appsubject}"></td>
			</tr>
			<tr height="30">
				<td align="center" width="100">Ŀ�� �̸�</td>
				<td align="center"><input type=hidden name="couplename" value="${app.couplename}">
				<input type=hidden id="appnumber" name="appnumber" value="${app.appnumber}">
				<input type=hidden id="enumber" name="enumber" value="${enumber}">${app.couplename}</td>
			</tr>			
			<tr height="30">
				<td align="center" width="100">�̺�Ʈ ��û ����</td>
				<td align="center"><textarea id="appcomment" name="appcomment" rows="13"cols="50">${app.appcomment}</textarea></td>
			</tr> 
			<tr>
				<td colspan="2" align="center">				
				<button type="button" class="btn btn-default" onclick='modify()'>�����Ϸ�</button>					
			</tr>	
			</table>
			</form>

</body>
</html>