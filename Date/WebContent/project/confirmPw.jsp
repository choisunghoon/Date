<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">  
    function confrimPw(){
    	 $.ajax({    		
 	        type: "post", 
 	       data : { "apppw" : $("#apppw").val() ,
 	    	   		"appnumber" : $("#appnumber").val(),
 	    	   		"enumber" : $("#enumber").val(),
 	    	   		"wnumber" : $("#wnumber").val(),
 	    	   		"tab" : $("#tab").val(),
 	    	   		"pageNum" : $("#pageNum").val(),
 	    	   		
 	       },
 	        url : "confirmPwPro.nhn",
 	        success: test,	// ��������û ������ ���� �Լ�
 	        error: whenError	//��������û ���н� �����Լ�
      	});
    }
    function test(aaa){	// ��û������ ������������ aaa ������ �ݹ�ȴ�. 
        $(".modal-body").html(aaa);	//id�� ajaxReturn�� �κп� �־��
    }
    function whenError(){
        alert("Error");
    }
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��� ��й�ȣ Ȯ��</title>
</head>
<body>
<form method="post" name="confirmPw">
<h2>��й�ȣ�� �Է����ּ���.</h2>
��й�ȣ : <input type="password" id="apppw" name="apppw">
<input type="hidden" id="appnumber" name="appnumber" value="${appnumber}">
<input type="hidden" id="wnumber" name="wnumber" value="${wnumber}">
<input type="hidden" id="enumber" name="enumber" value="${enumber}">
<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
<input type="hidden" id="tab" name="tab" value="${tab}">
<button type="button" class="btn btn-default" onclick="confrimPw()">Ȯ��</button>
</form>
</body>
</html>