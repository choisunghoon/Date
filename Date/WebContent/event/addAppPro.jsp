<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이벤트 참여</title>
</head>
<body>
<center>
<c:if test="${test==0}">
<h2> 참여해주셔서 감사합니다 ^0^ </h2>
<h2> 이벤트 발표 결과를 꼭 확인해주세요! </h2>
</c:if>
<c:if test="${test!=0}">
<h2> 이미 신청하셨습니다! </h2>
<h2> 커플당 1번만 신청 가능합니다.</h2>
</c:if>
</center>

</body>
</html>