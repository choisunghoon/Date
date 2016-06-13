<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

couplename  : ${pdb.couplename }<br/>
신청날짜	: <fmt:formatDate value="${pdb.regdate }" pattern="YYYY-MM-dd" /><br/>


<c:forEach items="${content }" var="content">
	<img src="${content }">
</c:forEach>
<c:forEach items="${content1 }" var="content1">
	${content1 }
</c:forEach>
<c:forEach items="${content2 }" var="content2">
	${content1 }
</c:forEach>

  
