<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>댓글보기</title>
</head>
<body>
<form method="post" name="appContent" action="appW.nhn?enumber=${enumber}&pageNum=${pageNum}&w=${w}">
<table border="1" width="500" height="300" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="20">
				<td align="center" width="100">제목</td>
				<td align="center">${app.appsubject}</td>
			</tr>
			<tr height="20">
				<td align="center" width="100">커플 이름</td>
				<td align="center"><input type=hidden name="couplename" value="${app.couplename}">
				<input type="hidden" name="enumber" value="${enumber}">
				<input type="hidden" name="wnumber" value="${wnumber}">
				<input type="hidden" name="Cwcount" value="${Cwcount}">
				<input type="hidden" name="appnumber" value="${app.appnumber}">${app.couplename} <img src="${app.appimg}" style="width:32;height:29"></td>
			</tr>			
			<tr height="40">
				<td align="center" width="100">이벤트 신청 내용</td>
				<td align="center">${app.appcomment}</td>
			</tr> 
			<tr height="20">
				<td colspan="2" align="center">
				<input type="image" name="submit" value="당첨자로 등록" src="/Date/button/z51.png"></td>
			</tr>		
		</table>		
		</form>
</body>
</html>

