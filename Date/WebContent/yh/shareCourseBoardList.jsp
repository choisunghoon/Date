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
<title> 코스 공유 게시판 </title>	
</head>
<link href="/Date/table.css" rel="stylesheet" type="text/css">
<body>
<br/><br/>
<center>
<form method="post">

	<table class="table14_1" width="700" border="0" cellspacing="0" cellpadding="2">
	
		<tr>
			<td align="center" colspan="0"> <h2>코스 공유 게시판</h2></td>
		</tr>
	</table>

	<br/>
	<table class="table14_1" width="700" border="1" cellspacing="0" cellpadding="2">
	<tr align="center">
		<th width="70">조회</td>
		<th width="460">제목</td>
		<th width="100">커플네임</td>
		<th width="70">좋아요</td>
	</tr>
	
	<c:forEach var="list" items="${list }">
	<tbody>
	<tr align="center">
		<td>${list.readcount}</td>
		<td align="left">&nbsp;
		<a href="#" onclick="callAjax('shareCourseBoardView.nhn?num=${list.num}&couplename=${couplename}&id=${id}')"> 
		
		${list.subject}</a></td>
		<td align="center"> ${list.couplename}</td>
		<td>${list.likecount}</td>
	</tr>
	</tbody>
	</c:forEach>
		
	<c:if test="${list.size() <= 0}">
	<tr align="center">
		<td colspan="5" > 등록된 게시글이 없습니다</td>
	</tr>
	</c:if>

	</table><br/>
	<tr align="center">
		<td colspan="5"> ${pagingHtml}</td>
	</tr>
            
</form>
</body>
</html>
