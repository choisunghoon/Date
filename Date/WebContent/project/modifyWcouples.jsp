<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

function get_chked_values(){
	  var chked_val = "";
	  $(":checkbox[name='checkbox']:checked").each(function(pi,po){
	    chked_val += ","+po.value;
	  });
	  if(chked_val!="")chked_val = chked_val.substring(1);
	  return chked_val;
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
		<td align="center" width="100"><input name="checkbox" type="checkbox" value="${appList.anumber}"></td>
		<td align="center" width="100">${appList.couplename}</td>
		<td align="center" width="100"> 
		<a href="deleteWcouples.nhn?enumber=${enumber}&wcouples=${appList.couplename}"><input type="button" name="way" value="����"></a>
		</td>	
		<td align="center" width="100">
		<c:if test="${appList.checknum==0}">${��}</c:if>
		<c:if test="${appList.checknum==1}">${��}</c:if>
		</td>
	</tr>
	</c:forEach>
</table>
</form>
<a href="wWay.nhn?enumber=${enumber}&wnumber=${wnumber}&w=${w}"><input type="button" name="way" value="��÷�� �߰�"></a>
<a href="WcoupleA.nhn?enumber=${enumber}&wcouples=${appList.couplename}"><input type="button" value="�˸�������"></a>
</body>
</html>