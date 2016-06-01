<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
    $('#modi').click(function(){
    	alert("클릭");
    	callAjax();
    });
   
    function callAjax(){
    	alert("call");
    	id=document.getElementById('modi').value;
    	$.ajax({
            url:'modify.nhn?id='+id,
            type:'post',				
            success: test,	// 페이지요청 성공시 실행 함수
 	        error: whenError	//페이지요청 실패시 실행함수
      	});
    }
    function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다.
    	alert("test");
        $("#if").html(aaa);	//id가 ajaxReturn인 부분에 넣어라
    }
    function whenError(){
        alert("Error");
    }
    
</script>