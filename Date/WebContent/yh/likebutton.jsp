<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<span id="ajaxReturn2">	
	<c:if test="${check==1}">		
		<input type="button" name="goodLike" value="�����޾��" />
	</c:if>	
	<c:if test="${check!=1}">
		<input type="button" name="goodLike" value="���ƿ�" />
	</c:if>
</span>