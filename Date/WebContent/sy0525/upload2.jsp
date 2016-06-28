<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<c:if test="${check == 1 }">
	<script>
			alert("등록되었습니다");
			window.location.href="couple.nhn?chk=1";
	</script>
    	
 </c:if>

 <c:if test="${check == 2 }">
 	<script>
 		alert("이미지크기가 큽니다.");
 	</script>
 </c:if>
 