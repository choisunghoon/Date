<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">  
function confirmPwPro(){
  	 $.ajax({    		
	        type: "post", 
	       data : { "appnumber" : $("#appnumber").val(),
	    	   		"enumber" : $("#enumber").val(),
	    	   		"wnumber" : $("#wnumber").val(),
	    	   		"tab" : $("#tab").val(),
	    	   		"pageNum" : $("#pageNum").val(),
	    	   		
	       },
	        url : "appContent.nhn",
	        success: test,	// ��������û ������ ���� �Լ�
	        error: whenError	//��������û ���н� �����Լ�
    	});
  }
    function confrimPwRe(){
   	 $.ajax({    		
	        type: "post", 
	       data : { "appnumber" : $("#appnumber").val(),
	    	   		"enumber" : $("#enumber").val(),
	    	   		"wnumber" : $("#wnumber").val(),
	    	   		"tab" : $("#tab").val(),
	    	   		"pageNum" : $("#pageNum").val(),
	    	   		
	       },
	        url : "confirmPw.nhn",
	        success: test,	// ��������û ������ ���� �Լ�
	        error: whenError	//��������û ���н� �����Լ�
     	});
   }
    
    function confrimPwCon(){
      	 $.ajax({    		
   	        type: "post", 
   	       data : { "enumber" : $("#enumber").val()
   	    	   		
   	       },
   	        url : "eventContent.nhn",
   	        success: test,	// ��������û ������ ���� �Լ�
   	        error: whenError	//��������û ���н� �����Լ�
        	});
      }
    
    function test(aaa){	// ��û������ ������������ aaa ������ �ݹ�ȴ�. 
        $(".modal-bodyy").html(aaa);	//id�� ajaxReturn�� �κп� �־��
    }
    function whenError(){
        alert("Error");
    }
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>

<input type="hidden" id="appnumber" name="appnumber" value="${appnumber}">
<input type="hidden" id="wnumber" name="wnumber" value="${wnumber}">
<input type="hidden" id="enumber" name="enumber" value="${enumber}">
<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
<input type="hidden" id="tab" name="tab" value="${tab}">
<center>
<c:if test="${check==1}">
<script>
	confirmPwPro();
</script>
</c:if>
<c:if test="${check==0}">
<h2>��й�ȣ�� ���� �ʽ��ϴ�.</h2>
<button type="button" class="btn btn-default" onclick='confrimPwRe()'>�ٽ� �Է�</button>
<button type="button" class="btn btn-default" onclick='confrimPwCon()'>�̺�Ʈ �� ��������</button>	
</c:if>
</center>
</body>
</html>