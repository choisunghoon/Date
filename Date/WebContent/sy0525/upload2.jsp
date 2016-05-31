<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${check == 1 }">
	<script>
			alert("등록되었습니다");
	</script>
    <meta http-equiv="Refresh" content="0;url=diaryMenu.nhn" >
 </c:if>

 <c:if test="${check == 2 }">
 	<script>
 		alert("이미지크기가 큽니다.");
 	</script>
 	<meta http-equiv="Refresh" content="0;url=ex.nhn" >
 </c:if>