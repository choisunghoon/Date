<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<html>
<%@include file="/sy0526/topmenu.jsp" %>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9be7455c7d33a4e2b750d3537e1179d8&libraries=services"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
 
     function callAjax2(nhn){
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
<style>
	body{
		top:0px;
		}
</style>
<body>
<br /><br />
<c:if test="${chk eq '1' }">
	<script>
		callAjax2('diaryMenu.nhn');
	</script>
</c:if>
	<div style="width:100%;float:left;" >
		<div style="width:12%;float:left;margin-left:0">
			<a href="#" onclick="callAjax2('diaryMenu.nhn')"><img src="syimage/mm3.png" onmouseover='this.src="syimage/mm4.png"' onmouseout='this.src="syimage/mm3.png"' /></a>
			<br />
			<a href="#" onclick="callAjax2('DateMap.nhn')"><img src="syimage/mm1.png" onmouseover='this.src="syimage/mm2.png"' onmouseout='this.src="syimage/mm1.png"' /></a>
			<br />
			<a href="#" onclick="callAjax2('datecos.nhn')"><img src="syimage/mm5.png" onmouseover='this.src="syimage/mm6.png"' onmouseout='this.src="syimage/mm5.png"' /></a>
			<br />
			<a href="#" onclick="callAjax2('datePostscript.nhn')"><img src="syimage/mm33.png" onmouseover='this.src="syimage/mm34.png"' onmouseout='this.src="syimage/mm33.png"' /></a>
		</div>
		<div style="float:left;width:2%">&nbsp;&nbsp;&nbsp;</div>
		<div id="subMain" style="float:left;width:86%">		
		</div>
	</div>
 
</body>
</html>