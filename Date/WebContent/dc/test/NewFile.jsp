<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
    $('#modi').click(function(){
    	alert("Ŭ��");
    	callAjax();
    });
   
    function callAjax(){
    	alert("call");
    	id=document.getElementById('modi').value;
    	$.ajax({
            url:'modify.nhn?id='+id,
            type:'post',				
            success: test,	// ��������û ������ ���� �Լ�
 	        error: whenError	//��������û ���н� �����Լ�
      	});
    }
    function test(aaa){	// ��û������ ������������ aaa ������ �ݹ�ȴ�.
    	alert("test");
        $("#if").html(aaa);	//id�� ajaxReturn�� �κп� �־��
    }
    function whenError(){
        alert("Error");
    }
    
</script>