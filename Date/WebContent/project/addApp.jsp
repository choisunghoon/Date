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
					alert("������� ���Ͻ� ��� ��й�ȣ�� �Է����ּž� �մϴ�!");
					
					return;
				
				}			
		}
		if(c[0].checked==true){
			if(addApp.apppw.value != ""){
				alert("������� ���Ͻ� ��쿡�� ��й�ȣ�� �Է����ּž� �մϴ�!");
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�̺�Ʈ ����</title>
</head>
<body>
	<form method="post" name="addApp">
		<table border="1" width="500" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="30">
				<td align="center" width="100">����</td>
				<td align="center"><input type="text" id="appsubject" name="appsubject">
									<input type="hidden" id="enumber" name="enumber" value="${enumber}">
									<input type="hidden" id="couplename" name="couplename" value="3"></td>
			</tr>
			<tr height="30">
				<td align="center" width="100">��й�ȣ</td>
				<td align="center"><input type=radio name="apppwC" checked>����&nbsp;&nbsp; 
									<input type=radio name="apppwC">�����<br/>
									*������� ��й�ȣ�� �Է����ּ���!
								   <input id="apppw" name="apppw" type="text"></td>
			</tr>			
			<tr height="30">
				<td align="center" colspan=2 >�̺�Ʈ ��û ����</td>
			</tr>
			<tr>
				<td align="center" colspan=2>
				<textarea name="appcomment" name="appcomment" rows="13"cols="50"></textarea></td>
			</tr>
			<tr>
				<td colspan=2 align="center">
				<button type="button" class="btn btn-default" onclick='checkApp()'>��û</button>				
			</tr>				
		</table>
	</form>
</body>
</html>