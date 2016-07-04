<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

		<span id="ajaxReturn">
			<c:if test="${check ==1 }"> 
			<img src="yh/img/c31.png" type= "button" name="goodLike" style="margin-top:5px;">&nbsp;&nbsp; ${likecount} 
			</c:if>
			<c:if test="${check ==0 }"> 
			<img src="yh/img/c32.png" type= "button" name="goodLike" style="margin-top:5px;">&nbsp;&nbsp; ${likecount} 
			</c:if>
		</span>
				