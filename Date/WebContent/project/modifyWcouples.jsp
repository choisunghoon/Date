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
field[i].checked = true;}
checkflag = "true";
return "모두 선택 해제"; }
else {
for (i = 0; i < field.length; i++) {
field[i].checked = false; }
checkflag = "false";
return "모두 선택"; }
}
</script> 
<title>당첨자 수정 및 삭제</title>
</head>
<body>
<form name="form">
<input type="button" name="button" value="모두 선택" onClick="this.value=check(this.form.checkbox)">
<table width="600" border="1" cellspacing="0" cellpadding="0" align="center" style="table-layout:fixed;">
	<tr>
		<td align="center" width="100">선택</td>
		<td align="center" width="100">커플이름</td>
		<td align="center" width="200">id</td>
		<td align="center" width="100">삭제</td>
		<td align="center" width="100">알림</td>
	</tr>
	<c:forEach var="idid" items="${idid}">
	<tr>
		<td align="center" width="100"><input name="checkbox" type="checkbox" value=""></td>
		<td align="center" width="100">${idid.coupleName}</td>
		<td align="center" width="200">${idid.id1},${idid.id2}</td>
		<td align="center" width="100"> 
		<a href="deleteWcouples.nhn?enumber=${enumber}&wcouples=${idid.coupleName}"><input type="button" name="way" value="삭제"></a>
		</td>	
		<td align="center" width="100"></td>
	</tr>
	</c:forEach>
</table>
</form>
<a href="wWay.nhn?enumber=${enumber}&wnumber=${wnumber}&w=${w}"><input type="button" name="way" value="당첨자 추가"></a>
</body>
</html>