<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${check == 1 }">
	<script type="text/javascript">
				alert("�����Ǿ����ϴ�!");
				window.location.replace("couple.nhn?chk=1");
	</script>	
</c:if>
<c:if test="${check == 0 }">
	<script type="text/javascript">
				alert("������ ��� �Ǿ����ϴ�!");
				window.location.replace("couple.nhn?chk=1");
	</script>
</c:if>