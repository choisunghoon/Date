<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@include file="/sy0526/topmenu.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"> 

		callAjax('shareCourseBoard.nhn');

    function callAjax(nhn){
        $.ajax({
	        type: "post",
	        url : nhn,
	        success: refresh,	// 페이지요청 성공시 실행 함수
	        error: whenError2	//페이지요청 실패시 실행함수
     	});
    }
    function refresh(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $("#subMain").html(aaa);
        
    }
    function whenError2(){
        alert("Error");
    }
  </script>
  <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9be7455c7d33a4e2b750d3537e1179d8&libraries=services"></script>
</head>
<body>

<div style="width:100%;float:left;" >
		<div style="width:12%;float:left;margin-left:0;margin-top: 40px">
			<a href="#" onclick="callAjax('shareCourseBoard.nhn')"><img src="syimage/mm19.png" onmouseover='this.src="syimage/mm20.png"' onmouseout='this.src="syimage/mm19.png"' /></a>
			<br />
			<a href="#" onclick="callAjax('shareDiaryBoard.nhn')"><img src="syimage/mm21.png" onmouseover='this.src="syimage/mm22.png"' onmouseout='this.src="syimage/mm21.png"' /></a>
		</div>
		<div style="float:left;width:2%">&nbsp;&nbsp;&nbsp;</div>
		<div id="subMain" style="float:left;width:86%">		
		</div>
	</div>
<%@include file="/sy0615/kk.jsp" %>


</body>
</html>