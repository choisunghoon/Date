<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script language="JavaScript">
var checkflag = "false";
function check(field) {
	if (checkflag == "false") {
		for (i = 0; i < field.length; i++) {
			field[i].checked = true;
		}
	checkflag = "true";
	return "��� ���� ����"; }
	else {
		for (i = 0; i < field.length; i++) {
			field[i].checked = false;
		}
		checkflag = "false";
	return "��� ����"; }
}

function ajaxExample(){
	// name�� ���� üũ�ڽ��� ������ �迭�� ��´�.
	var checkboxValues = [];
	$("#checkbox:checked").each(function(i) {
		checkboxValues.push($(this).val());("��ddddsds��!");
	});
	
	// ����� ID(���ڿ�)�� üũ�ڽ� ����(�迭)�� name/value ���·� ��´�.
	var allData = { "checkArray": checkboxValues };
	
	$.ajax({
		url:"WcoupleA.nhn?enumber="+ $("#enumber").val(),
		type:'GET',
		data: allData,
		success:function(data){
			alert("�Ϸ�");
			window.location.reload("modifyWcouples.nhn?enumber="+$("#enumber").val()+
					"&wnumber="+$("#wnumber").val()+"&w="+$("#w").val());
		},
		error:function(jqXHR, textStatus, errorThrown){
			alert("���� �߻�~~ \n" + textStatus + " : " + errorThrown);
		}
	});
}

</script> 
<title>��÷�� ���� �� ����</title>
</head>
<body>
<form name="form">
<input type="button" name="button" value="��� ����" onClick="this.value=check(this.form.checkbox)">
<table width="600" border="1" cellspacing="0" cellpadding="0" align="center" style="table-layout:fixed;">
	<tr>
		<td align="center" width="100">����</td>
		<td align="center" width="100">Ŀ���̸�</td>
		<td align="center" width="100">����</td>
		<td align="center" width="100">�˸�</td>
	</tr>
	<c:forEach var="appList" items="${appList}">
	<tr>
		<td align="center" width="100"><input type="hidden" name="enumber" id="enumber" value="${appList.enumber}">
		<input type="hidden" name="wnumber" id="wnumber" value="wnumber">
		<input type="hidden" name="w" id="w" value="${w}">
		<c:if test="${appList.checknum==0}">
		<input name="checkbox" type="checkbox" id="checkbox" value="${appList.anumber}">
		</c:if>
		</td>
		<c:if test="${appList.checknum==-1 || appList.checknum == 1}">
		<input name="checkbox" type="hidden" id="checkbox" value="${appList.anumber}">
		</c:if>
		<td align="center" width="100">${appList.couplename}</td>
		<td align="center" width="100"> 
		<c:if test="${appList.checknum==0}">
		<a href="deleteWcouples.nhn?enumber=${enumber}&wcouples=${appList.couplename}"><input type="button" name="way" value="����"></a>
		</c:if>
		<c:if test="${appList.checknum==-1 || appList.checknum == 1}">-</c:if>
		</td>	
		<td align="center" width="100">
		<c:if test="${appList.checknum==0}">��</c:if>
		<c:if test="${appList.checknum==-1}">��(��������)</c:if>
		<c:if test="${appList.checknum==1}">��(��������)</c:if>
		</td>
	</tr>
	</c:forEach>
</table>
<a href="wWay.nhn?enumber=${enumber}&wnumber=${wnumber}&w=${w}"><img src="/Date/button/z48.png" style="margin-left:25px; margin-bottom:10px;"></a>
<a href="#" onclick="ajaxExample()"><img src="/Date/button/z47.png" style="margin-left:400px; margin-bottom:10px;"></a>
</form>
</body>
</html>