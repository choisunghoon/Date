<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

couplename  : ${pdb.couplename }<br/>
신청날짜	: <fmt:formatDate value="${pdb.regdate }" pattern="YYYY-MM-dd" /><br/>

<c:forEach var="admin" items="${admin }">
	
	<img src="${admin.img }">
	${admin.writeday }
	${admin.content }

</c:forEach>
<input type="button" onclick="">확인</button>

  
