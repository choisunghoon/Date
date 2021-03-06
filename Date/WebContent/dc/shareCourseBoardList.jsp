<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="quickpager2.jquery.js"></script>
<script type="text/javascript">
</script>
</style>
<title>MY COURSE LIST</title>	
</head>

<body>
<center>
<form method="post">
	<table width="600" border="1" cellspacing="0" cellpadding="2">
	
		<tr>
			<td align="center" colspan="2"> <h2>MY COURSE LIST</h2></td>
		</tr>
	</table>

	
	<table width="600" border="1" cellspacing="0" cellpadding="2">
	<c:if test="${list.size() >= 0}">
	<tr align="center">
		<td width="50">글번호</td>
		<td width="50">제목</td>
		<td width="50">커플네임</td>
		<td width="50">조회</td>
		<td width="50">추천</td>
	</tr>
	
	<c:forEach var="list" items="${list }">
	<tbody>
	<tr align="center">
		<td>${list.num }</td>
		<td align="left">&nbsp;
		<a href="#" onclick="callAjax('shareCourseBoardView.nhn?num=${list.num}&couplename=${couplename}&id=${id}')"> 
		
		${list.subject}</a></td>
		<td align="center"> ${list.couplename}</td>
		<td>${list.readcount}</td>
		<td>${list.likecount}</td>
	</tr>
	</tbody>
	</c:forEach>
	</c:if>
	<c:if test="${non eq 'non'}">
	<tr align="center">
		<td colspan="5" > 등록된 게시글이 없습니다</td>
	</tr>
	</c:if>

	<tr align="center">
		<td colspan="5"> ${pagingHtml}</td>
	</tr>
            
	</table>

</form>
</center>
</body>
</html>
