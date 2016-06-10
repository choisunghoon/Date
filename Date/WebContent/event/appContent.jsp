<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>댓글보기</title>
</head>
<body>
<table border="1" width="500" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="30">
				<td align="center" width="100">제목</td>
				<td align="center">${app.appsubject}</td>
			</tr>
			<tr height="30">
				<td align="center" width="100">커플 이름</td>
				<td align="center">${app.couplename}</td>
			</tr>			
			<tr height="30">
				<td align="center" width="100">이벤트 신청 내용</td>
				<td align="center">${app.appcomment}</td>
			</tr>				
		</table>
</body>
</html>