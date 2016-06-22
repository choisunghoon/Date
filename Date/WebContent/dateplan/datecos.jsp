<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	function callMap(num){
		$.ajax({
			type : "post" ,
			data : {
				num : num
			},
			url : "datePlan.nhn",
			success : cossuc,
			error : coserr
		})
		
	}
	function cossuc(cos){
		$("#cos").html(cos);
	}
	function coserr(){
		alert("Error");
	}
	
</script>

<div id="cos">
<c:forEach var="cosList" items="${cosList}">
	<a href="#" onclick="callMap(${cosList.num})" >${cosList.subject}</a>
</c:forEach>

</div>