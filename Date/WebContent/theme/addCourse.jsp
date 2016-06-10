<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>카테고리 입력</title>
</head>
<body>
<form method="post" name="test" action="addCoursePro.nhn?ctg_num=${ctg_num}" ENCTYPE="multipart/form-data">
	<table width="500" border="1" cellspacing="0" cellpadding="3" align="center">
    		<tr height="30">
    			<td align="center" colspan="2"> 코스 입력 </td>
    		</tr>
    		<tr>
    			<td align="center" width="50">카테고리 번호</td>
    			<td align="center">${ctg_num}</td>
    		<tr>
				<td align="center" width="50">코스 번호 입력</td>
				<td align="center"><input type="text" name="cos_num"></td>
			</tr>
				<tr height="30">
				<td align="center" width="50">코스 이름 입력</td>
				<td align="center" width="700"><input type="text" name="cos_name"></td>
			</tr>
    		<tr height="30">
    			<td align="center" width="50">코스 대표사진</td>
				<td align="center" width="700"><input type="file" name="save[1]"></td>
			</tr>
			<tr>
				<td align="center" width="50">코스 지도사진</td>
				<td align="center" width="700"><input type="file" name="save[2]"></td>
			</tr>
			<tr>
				<td align="center" width="50">코스 설명</td>
				<td align="center" width="700"><textarea rows="5" cols="40" name="content"></textarea></td>
			</tr>
    	</table>
    	<br/>
    	<center><input type="submit" value="등록"></center>
    </form>
</body>
</html>