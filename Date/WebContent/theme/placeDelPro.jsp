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
      <meta http-equiv="Refresh" content="0;url=place.nhn?ctg_num=${ctg_num}&cos_num=${cos_num}" >
</c:if>
<c:if test="${check != 1}">
	<script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
</c:if>

</body>
</html>