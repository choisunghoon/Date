<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<title>alertify.js - example page</title>
	<link rel="stylesheet" href="/Date/dc/test/alertify.js-0.3.11/themes/alertify.core.css" />
	<link rel="stylesheet" href="/Date/dc/test/alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />
	<meta name="viewport" content="width=device-width">
	<style>
		.alertify-log-custom {
			background: blue;
		}
	</style>
</head>
<body>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="/Date/dc/test/alertify.js-0.3.11/lib/alertify.min.js"></script>
<c:if test="${adto.content eq 'coupleRequest' and ca eq 1}">	
	<script>
	$(document).ready(function() { 
		alert();
	});
	/*  $(document).ready(function(){
	    	window.setInterval('alert()', 5000); 

	    });*/
		function alert(){
			reset();
			alertify.set({ delay: 1000*60*60*24 });
			alertify.log("<a href='/Date/mypage.nhn' class='alert-link'>커플 신청이 왔습니다!</a>");
			return false;
		};
	</script>
</c:if>
<c:if test="${couple1 eq 'couple1'}">	
	<script>
	$(document).ready(function() { 
		alert();
	});
	 /* $(document).ready(function(){
	    	window.setInterval('alert()', 10000); //10초마다 alert()를 반복!
	    }); */
		function alert(){
			reset();
			alertify.set({ delay: 1000*60*60*24 });
			alertify.log("<a href='/Date/mypage.nhn' class='alert-link'>상대방이 커플 신청을 수락 했습니다!</a>");
			return false;
		};
	</script>
</c:if>
<script>
function reset () {
	$("#toggleCSS").attr("href", "/Date/dc/test/alertify.js-0.3.11/themes/alertify.default.css");
	alertify.set({
		labels : {
			ok     : "OK",
			cancel : "Cancel"
		},
		delay : 5000,
		buttonReverse : false,
		buttonFocus   : "ok"
	});
}

</script>
</body>
</html>