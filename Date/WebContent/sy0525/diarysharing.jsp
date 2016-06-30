<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${check == 1 }">
	<script type="text/javascript">
				alert("공유되었습니다!");
				window.location.replace("couple.nhn?chk=1");
	</script>	
</c:if>
<c:if test="${check == 0 }">
	<script type="text/javascript">
				alert("공유가 취소 되었습니다!");
				window.location.replace("couple.nhn?chk=1");
	</script>
</c:if>