<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
	body{
		top:0px;
		background-image: url("sy0526/sub.jpg");
		background-repeat: no-repeat;
		}
</style>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9be7455c7d33a4e2b750d3537e1179d8&libraries=services"></script>
<%@include file="/sy0526/topmenu.jsp" %>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
 
    function callAjax(nhn){
        $.ajax({
	        type: "post",
	        url : nhn,
	        success: refresh,	// ��������û ������ ���� �Լ�
	        error: whenError2	//��������û ���н� �����Լ�
     	});
    }
    function refresh(aaa){	// ��û������ ������������ aaa ������ �ݹ�ȴ�. 
        $("#subMain").html(aaa);
        
    }
    function whenError2(){
        alert("Error");
    }
  </script>

<body>
<br /><br />
 <div id="sub_wrap" width="1335px">
	<div style="width:100%;">
		<div style="width:12%;float:left;">
			<a href="#"><img src="sy0526/aa.png"></a>
			<a href="#" onclick="callAjax('datePlan.nhn')"><img src="sy0526/mycourse.png"></a>
		</div>
		<div style="float:left;width:2%">&nbsp;&nbsp;&nbsp;</div>
		<div id="subMain" style="float:left;width:86%">		
		</div>
	</div>
 </div>
</body>