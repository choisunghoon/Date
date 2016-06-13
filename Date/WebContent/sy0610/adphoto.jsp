<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script language="JavaScript">
	function openState(regdate,couplename) {
	    // url과 사용자 입력 id를 조합합니다.
	    url = "state.nhn?couplename="+couplename+"&regdate="+regdate;
	    
	    // 새로운 윈도우를 엽니다.
	    open(url, "confirm", 
	    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
	}
	
	function content(regdate,couplename){
		 url = "photocontent.nhn?couplename1="+couplename+"&regdate1="+regdate;
		window.location.href = url;
	}
</script>  
<div id="check">  
포토북 신청 확인
<form method="post">
<table border="1px" cellspadding="0" cellspacing="0">
	<tr>
		<td>커플아이디</td>
		<td>포토북 신청날짜</td>
		<td>신청상태</td>
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