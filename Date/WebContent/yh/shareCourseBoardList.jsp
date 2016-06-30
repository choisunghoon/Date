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

/* <![CDATA[ */

$(document).ready(function() {
	$(".pageme tbody").quickPager( {
		pageSize: 5,
		naviSize: 3,
		currentPage: 1,
		holder: ".pager"
	});
});

/* ]]> */
</script>
<style type="text/css">


p {
	background: #e5e5e5;
	margin-bottom:1px;
	margin-top:0px;
}

ul.paging li {
    padding: 10px;
    background: #83bd63;
    font-family: georgia;
    font-size: 24px;
    color: #fff;
    line-height: 1;
    width: 180px;
    margin-bottom: 1px;
}

ul.pageNav li{
    display:block;
    floaT: left;
    padding: 3px;
    font-family: georgia;
}

ul.pageNav li a{
    color: #333;
    text-decoration: none;
}

li.currentPage {
	background: red;
        background: #83bd63;	
}

ul.pageNav li.currentPage a {
	color: #fff;	
}

table.pageme {
    border-collapse: collapse;
    border: 1px solid #ccc;
}  

table.pageme td {
    border-collapse: collapse;
    border: 1px solid #ccc;
}      

table, div {
	display:block;
	clear: both
}


</style>
<title>SHARE COURSE BOARD</title>	
</head>

<body>
<form method="post">
	<table width="600" border="1" cellspacing="0" cellpadding="2">
	
		<tr>
			<td align="center" colspan="2"> <h2>SHARE COURSE BOARD</h2></td>
		</tr>
	</table>

	
	<table width="600" border="1" cellspacing="0" cellpadding="2" class="pageme">
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
		
	<c:if test="${list.size()} <= 0">
	<tr align="center">
		<td colspan="5" > 등록된 게시글이 없습니다</td>
	</tr>
	</c:if>
	<tr align="center" >
		<div class="pager"></div>
	</tr>
	</table>
</form>
</body>
</html>
