<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ī�װ� �Է�</title>
</head>
<body>
<form method="post" name="test" action="addCtgPro.nhn" ENCTYPE="multipart/form-data">
	<table width="500" border="1" cellspacing="0" cellpadding="3" align="center">
    		<tr height="30">
    			<td align="center" colspan="2"> ī�װ� �Է� </td>
    		</tr>
    		<tr>
				<td align="center" width="50">ī�װ� ��ȣ �Է�</td>
				<td align="center"><input type="text" name="ctg_num"></td>
			</tr>
				<tr height="30">
				<td align="center" width="50">ī�װ� �̸� �Է�</td>
				<td align="center" width="700"><input type="text" name="ctg_name"></td>
			</tr>
    		<tr height="30">
    			<td align="center" width="50">ī�װ� ��ǥ����</td>
				<td align="center" width="700"><input type="file" name="save"></td>
			</tr>
    	</table>
    	<br/>
    	<center><input type="submit" value="���"></center>
    </form>
</body>
</html>