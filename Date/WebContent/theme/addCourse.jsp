<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ī�װ� �Է�</title>
</head>
<body>
<form method="post" name="test" action="addCoursePro.nhn?ctg_num=${ctg_num}" ENCTYPE="multipart/form-data">
	<table width="500" border="1" cellspacing="0" cellpadding="3" align="center">
    		<tr height="30">
    			<td align="center" colspan="2"> �ڽ� �Է� </td>
    		</tr>
    		<tr>
    			<td align="center" width="50">ī�װ� ��ȣ</td>
    			<td align="center">${ctg_num}</td>
    		<tr>
				<td align="center" width="50">�ڽ� ��ȣ �Է�</td>
				<td align="center"><input type="text" name="cos_num"></td>
			</tr>
				<tr height="30">
				<td align="center" width="50">�ڽ� �̸� �Է�</td>
				<td align="center" width="700"><input type="text" name="cos_name"></td>
			</tr>
    		<tr height="30">
    			<td align="center" width="50">�ڽ� ��ǥ����</td>
				<td align="center" width="700"><input type="file" name="save[1]"></td>
			</tr>
			<tr>
				<td align="center" width="50">�ڽ� ��������</td>
				<td align="center" width="700"><input type="file" name="save[2]"></td>
			</tr>
			<tr>
				<td align="center" width="50">�ڽ� ����</td>
				<td align="center" width="700"><textarea rows="5" cols="40" name="content"></textarea></td>
			</tr>
    	</table>
    	<br/>
    	<center><input type="submit" value="���"></center>
    </form>
</body>
</html>