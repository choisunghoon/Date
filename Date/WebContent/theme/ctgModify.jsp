<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>카테고리 수정</title>
</head>
<script type="text/javascript">
	function checkSS() {
    	if (document.test.save.value == "") {
        	alert("수정할 사진을 선택해주세요.");
        	return false;
    	}
	}
</script>
<body>
<form method="post" name="test" action="ctgModifyPro.nhn?ctg_num=${ctg_num}" ENCTYPE="multipart/form-data">
	<table width="500" border="1" cellspacing="0" cellpadding="3" align="center">
    		<tr height="30">
    			<td align="center" colspan="2"> 카테고리 수정 </td>
    		</tr>
    		<tr>
				<td align="center" width="50">카테고리 번호</td>
				<td align="center">${dto.ctg_num}</td>
			</tr>
				<tr height="30">
				<td align="center" width="50">카테고리 이름 입력</td>
				<td align="center" width="700"><input type="text" name="ctg_name" value="${dto.ctg_name}"></td>
			</tr>
    		<tr height="30">
    			<td align="center" width="50">카테고리 대표사진</td>
				<td align="center" width="700"><img src="theme/themeimg/${dto.ctg_img}" alt=""><input type="file" name="save" value="${dto.ctg_img}"></td>
			</tr>
    	</table>
    	<br/>
    	<center><input type="submit" value="등록"></center>
    </form>
</body>
</html>