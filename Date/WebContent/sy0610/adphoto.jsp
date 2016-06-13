<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script language="JavaScript">
	function openState(regdate,couplename) {
	    // url�� ����� �Է� id�� �����մϴ�.
	    url = "state.nhn?couplename="+couplename+"&regdate="+regdate;
	    
	    // ���ο� �����츦 ���ϴ�.
	    open(url, "confirm", 
	    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
	}
	
	function content(regdate,couplename){
		 url = "photocontent.nhn?couplename1="+couplename+"&regdate1="+regdate;
		window.location.href = url;
	}
</script>  
<div id="check">  
����� ��û Ȯ��
<form method="post">
<table border="1px" cellspadding="0" cellspacing="0">
	<tr>
		<td>Ŀ�þ��̵�</td>
		<td>����� ��û��¥</td>
		<td>��û����</td>
	</tr>
	<c:forEach items="${photo}" var="photo">
		<tr>
			<td><a href="#" onclick="content('${photo.regdate }','${photo.couplename }')">${photo.couplename }</a></td>
			<td><fmt:formatDate value="${photo.regdate }" pattern="YYYY-MM-dd" /></td>
			<td><a href="#" onclick="openState('${photo.regdate }','${photo.couplename }')">${photo.state}</a></td>
		</tr>
	</c:forEach>
</table>
</form>
</div>