<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/sy0526/topmenu.jsp" %>

<html>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9be7455c7d33a4e2b750d3537e1179d8&libraries=services"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">

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
  <body>
  <form name="chkF">
  
    
    
    <div style="width:100%;float:left;" >
		<div style="width:12%;float:left;margin-left:0">
			<a href="#" onclick="callAjax('adphoto.nhn')"><img src="syimage/mm9.png" onmouseover='this.src="syimage/mm10.png"' onmouseout='this.src="syimage/mm9.png"' /></a>
			<a href="#" onclick="callAjax('point.nhn')"><img src="syimage/mm11.png" onmouseover='this.src="syimage/mm12.png"' onmouseout='this.src="syimage/mm11.png"' /></a>	
			<a href="#" onclick="callAjax('AdminMember.nhn')"><img src="syimage/mm7.png" onmouseover='this.src="syimage/mm8.png"' onmouseout='this.src="syimage/mm7.png"' /></a>
			<a href="#" onclick="callAjax('adminEvent.nhn')"><img src="syimage/mm131.png" onmouseover='this.src="syimage/mm141.png"' onmouseout='this.src="syimage/mm131.png"' /></a>	
		</div>
		<div style="float:left;width:2%">&nbsp;&nbsp;&nbsp;</div>
		<div id="subMain" style="float:left;width:86%">		
		</div>
	</div>
    
    
      </form>
    
    
    
    
    
    </body>
    </html>