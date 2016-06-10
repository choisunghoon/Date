<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="i" value="0"/>
<c:forEach var="str" items="${str}">
	${str.[i]}
</c:forEach>
    
    