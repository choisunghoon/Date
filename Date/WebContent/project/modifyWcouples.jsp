<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��÷�� ���� �� ����</title>
</head>
<body>
<table width="500" border="1" cellspacing="0" cellpadding="0" align="center" style="table-layout:fixed;">
	<tr>
		<td align="center" width="100">Ŀ���̸�</td>
		<td align="center" width="100">���</td>
	</tr>
	<c:forEach var="i" begin="0" end="${Lsize-1}">
	<tr>
		<td align="center" width="100">${wcList[i]}</td>
		<td align="center"> 
		<a href="deleteWcouples.nhn?enumber=${enumber}&wcouples=${wcList[i]}"><input type="button" name="way" value="����"></a>
		</td>	
	</tr>
	</c:forEach>
</table>
<a href="wWay.nhn?enumber=${enumber}&wnumber=${wnumber}&w=${w}"><input type="button" name="way" value="��÷�� �߰�"></a>
</body>
</html>