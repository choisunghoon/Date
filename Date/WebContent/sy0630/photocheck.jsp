<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table border="1" colspadding="0" cellspacing="0" width="500px" style="margin-left:185px;">
		<tr>	
			<td>
				신청날짜
			</td>
			<td>
				포토북 신청 상태
			</td> 
			<td>
				내용보기
			</td>
		</tr>
    	<c:forEach var="photo" items="${photo}">
		<tr>
    		<td>
    			<fmt:formatDate value="${photo.regdate }" pattern="YYYY-MM-dd HH:mm" />
    		</td>  
    		<td>
				${photo.state }
			</td>    
			<td>
				<a href="#" onclick="callContent5('photocheckcontent.nhn','${photo.regdate}')">확인</a>
			</td>	
    	</tr>
	</c:forEach>
</table>