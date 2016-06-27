<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<form name="comment" method="post">
	<table width="500" border="1" cellspacing="0" cellpadding="0" >
	
	<tr align="center">
		<td width="100"> ${id} </td>
		<td width="300"><textarea name="comment" cols="35" rows="4" /></td>
		<td width="100"><input type="button" name="commentup" value="commentup" href="#" onclick="callAjax2('diaryCommentUp.nhn?comment=${comment}&num=${num }')"> 
	
	</tr>
	</table>
	<table width="500" border="1" cellspacing="0" cellpadding="0" >

	<tr align="center">
		<td width="100"> id </td> 
		<td width="300"> 내용 </td> 
		<td width="100"> 작성시간 </td>
	</tr>
	
	<c:forEach var="list" items="${commentList }">
	<tr align="center">
		<td>${commentList.id }</td>
		<td align="left">&nbsp;
		<td>${commentList.diarycomment}</td>
		<td>${commentList.regdate}</td>
	</tr>
	
	</c:forEach>

	<c:if test="${list.size()} <= 0">
	<tr align="center">
		<td colspan="5" > 등록된 게시글이 없습니다</td>
	</tr>
	</c:if>
	</tr>
</table>   
</form>
</body>
</html>