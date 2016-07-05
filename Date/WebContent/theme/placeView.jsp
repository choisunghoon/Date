<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<html xmlns="http://www.w3.org/1999/xhtml">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
</script>
<body>
	<form name="placeView" method="post">
                <table width="500" border="1" cellspacing="0" cellpadding="3" align="center">
    				<tr height="30">
    					<td align="center" colspan="2"> 코스 상세 정보</td>
    				</tr>
    				<tr>
    					<td align="center" colspan="2" height="15"><b>코 스 명</b></td>
    				</tr>
    				<tr>
						<td align="center" colspan="2" height="100">${dto.loc_name}</td>
					</tr>
					<tr>
						<td align="center" colspan="2" height="15"><b>한 줄 평</b></td>
					</tr>
					<tr>
						<td align="center" colspan="2" height="100">${dto.loc_content}</textarea></td>
					</tr>
					<tr>
						<td align="center" width="250"><b>평 점</b></td>
						<td align="center" width="250"><b>조 회 수</b></td>
					</tr>
					<tr>	
						<td align="center" height="100">${dto.rate}</td>
						<td align="center" height="100">${dto.readCount}</td>
					</tr>
					<tr>
						<td align="center" colspan="2" height="15"><b>장 소 사 진</b></td>
					</tr>
    				<tr height="30">
						<td align="center" width="700" colspan="2"><img src="theme/themeimg/${dto.loc_pic}" alt=""></td>
					</tr>
					<tr height="30">
						<td align="center" width="700" colspan="2"><img src="theme/themeimg/${dto.loc_pic1}" alt=""></td>
					</tr>
					<tr height="30">
						<td align="center" width="700" colspan="2"><img src="theme/themeimg/${dto.loc_pic2}" alt=""></td>
					</tr>
					<tr height="30">
						<td align="center" width="700" colspan="2"><img src="theme/themeimg/${dto.loc_pic3}" alt=""></td>
					</tr>
				</table>
			</form>
				</br>
