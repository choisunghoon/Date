<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:if test="${check eq 1 }">
    <script>
    alert("공유가 완료 되었습니다.");
    
    </script>
    </c:if>
    <c:if test="${check eq 0 }">
    <script>
    alert("공유가 취소되었습니다.");
    
    </script>
    </c:if>