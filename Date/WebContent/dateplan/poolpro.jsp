<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:if test="${check eq 1 }">
    <script>
    alert("������ �Ϸ� �Ǿ����ϴ�.");
    
    </script>
    </c:if>
    <c:if test="${check eq 0 }">
    <script>
    alert("������ ��ҵǾ����ϴ�.");
    
    </script>
    </c:if>