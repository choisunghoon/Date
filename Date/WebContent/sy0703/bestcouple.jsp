<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="i" value="0"/>    	
<c:forEach var="bestcouple" items="${bestcouple}">
	<div id="couple${i}" style="border:1px solid; width:220px;float:left;margin-left:10px;">
	<c:forEach begin="${i}" end="${i}" items="${dd}" var="dd">
	<div id="img${i}" style="margin-left:5px;width:210px; height:300px; border:1px solid"><center><img src="${dd.coupleimage}"></center></div>
	</c:forEach>
	<c:set var="i" value="${i+1 }"/>
	<center>${bestcouple.couplename}</center>
	</div>
</c:forEach> 
    	
    	
    	
    	
    	