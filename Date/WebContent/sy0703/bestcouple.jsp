<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="i" value="0"/>    	
<c:forEach var="bestcouple" items="${bestcouple}">
	<div id="couple${i}" style="border:1px solid; position:relative; width:220px;float:left; margin-left:40px;margin-top:48px;">
	<img src="button/crown.png" style="position:absolute; top:-35px; width:80px; height:66px; left:-36px">
	<c:forEach begin="${i}" end="${i}" items="${dd}" var="dd">
	<div style="margin-left:4px;width:210px; height:300px; border:1px solid"><center><img src="syimage/${dd.coupleimage}"></center></div>
	</c:forEach>
	<c:set var="i" value="${i+1 }"/>
	<center>${bestcouple.couplename}</center>
	</div>
</c:forEach> 
    	
    	
    	
    	
    	