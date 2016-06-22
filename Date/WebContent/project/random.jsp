<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<c:if test="${count<=0}">신청 커플이 없습니다.</c:if>
<c:if test="${count>0}">
<c:forEach var="i" begin="0" end="${wnumber}">
${rList[i]}<br/>
</c:forEach>
</c:if>
</body>
</html>