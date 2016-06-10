<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
<c:forEach var="str" items="${str}">
	${str}
</c:forEach>
 -->    
 
 <c:forEach var="photo" items="${photo}">
	${photo.content}
	<img src="syimg/${photo.img }">
	
</c:forEach>
    