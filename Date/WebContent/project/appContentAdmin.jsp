<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ۺ���</title>
</head>
<body>
<form method="post" name="appContent" action="appW.nhn?enumber=${enumber}&pageNum=${pageNum}">
<table border="1" width="500" height="300" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="20">
				<td align="center" width="100">����</td>
				<td align="center">${app.appsubject}</td>
			</tr>
			<tr height="20">
				<td align="center" width="100">Ŀ�� �̸�</td>
				<td align="center"><input type=hidden name="couplename" value="${app.couplename}">
				<input type="hidden" name="enumber" value="${enumber}">
				<input type="hidden" name="wnumber" value="${wnumber}">
				<input type=hidden name="appnumber" value="${app.appnumber}">${app.couplename}</td>
			</tr>			
			<tr height="40">
				<td align="center" width="100">�̺�Ʈ ��û ����</td>
				<td align="center">${app.appcomment}</td>
			</tr> 
			<tr height="20">
				<td colspan="2" align="center">
				<input type="submit" name="addW" value="��÷�ڷ� ���">
			</tr>		
		</table>		
		</form>
</body>
</html>

