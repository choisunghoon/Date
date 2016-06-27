<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>당첨 선발 방법 선택</title>
</head>
<body>
	<form name="wWay" method="post">
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="center"><p>
					<input type="hidden" name="enumber" value="${enumber}"> 
					<input type="hidden" name="wnumber" value="${wnumber}"> 
					예정 당첨자 수 : ${wnumber} <br/>
					<a href="random.nhn?enumber=${enumber}&wnumber=${wnumber}"><input type="button" name="way" value="랜덤"></a>
					<a href="choice.nhn?enumber=${enumber}&wnumber=${wnumber}"><input type="button" name="way" value="선택"></a>				
				</td>
			</tr>
		</table>
	</form>
</body>
</html>