<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>코스 삭제</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<c:if test="${check==1}">
<body>
<form method="post" action="course.nhn?ctg_num=${ctg_num}&cos_num=${cos_num}" name="userinput" >
<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr> 
    <td height="39" align="center">
	  <font size="+1" ><b>코스가 삭제되었습니다.</b></font></td>
  </tr>
  <tr>
    <td align="center"> 
      <p>흑흑.... 서운합니다. 안녕히 가세요.</p>
      <meta http-equiv="Refresh" content="5;url=course.nhn?ctg_num=${ctg_num}&cos_num=${cos_num}" >
    </td>
  </tr>
  <tr>
    <td align="center"> 
      <input type="submit" value="확인">
    </td>
  </tr>
</table>
</form>
</c:if>
<c:if test="${check != 1}">
	<script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
</c:if>

</body>
</html>