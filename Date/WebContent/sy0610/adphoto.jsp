<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script language="JavaScript">
	function openConfirmid() {
	    // url�� ����� �Է� id�� �����մϴ�.
	    url = "confirmId.action?id=" + userinput.id.value ;
	    
	    // ���ο� �����츦 ���ϴ�.
	    open(url, "confirm", 
	    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
	}
</script>    
����� ��û Ȯ��
<table border="1px" cellspadding="0" cellspacing="0">
	<tr>
		<td>Ŀ�þ��̵�</td>
		<td>����� ��û��¥</td>
		<td>��û����</td>
	</tr>
	<c:forEach items="${photo }" var="photo">
		<tr>
			<td>${photo.couplename }</td>
			<td><fmt:formatDate value="${photo.regdate }" pattern="YYYY-MM-dd" /></td>
			<td><a href="#">${photo.state}</a></td>
		</tr>
	</c:forEach>
</table>