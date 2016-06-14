<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<body>

                <table width="500" border="1" cellspacing="0" cellpadding="3" align="center">
    				<tr height="30">
    					<td align="center" colspan="2"> 코스 상세 정보</td>
    				</tr>
    				<tr>
						<td align="center" width="50">코스 이름</td>
						<td align="center">${dto.loc_name}</td>
					</tr>
					<tr>
						<td align="center" width="50">한줄평</td>
						<td align="center">${dto.loc_content}</textarea></td>
					</tr>
					<tr>
						<td align="center" width="50">평 점</td>
						<td align="center">${dto.rate}
					</td>
    				<tr height="30">
    					<td align="center" width="50">장소사진</td>
						<td align="center" width="700"><img src="theme/${dto.loc_pic}" alt=""></td>
					</tr>
					<tr height="30">
    					<td align="center" width="50">장소사진</td>
						<td align="center" width="700"><img src="theme/${dto.loc_pic1}" alt=""></td>
					</tr>
				</table>
				</br>
