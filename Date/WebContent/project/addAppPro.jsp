<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script language='javascript'>
function checkPro() {
		$.ajax({
			type : "post",
			data : {
				"enumber" : $("#enumber").val()
			},
			url : "eventContent.nhn",
			success : test, // ��������û ������ ���� �Լ�
			error : whenError
		//��������û ���н� �����Լ�
		});
	}
	function test(aaa){	// ��û������ ������������ aaa ������ �ݹ�ȴ�. 
        $(".modal-body").html(aaa);	//id�� ajaxReturn�� �κп� �־��
    }
    function whenError(){
        alert("Error");
    }
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�̺�Ʈ ����</title>
</head>
<body>
<input type="hidden" id="enumber" name="enumber" value="${enumber}">
<center>
<c:if test="${test==0}">
<h2> �������ּż� �����մϴ� ^0^ </h2>
<h2> �̺�Ʈ ��ǥ ����� �� Ȯ�����ּ���! </h2>
</c:if>
<c:if test="${test!=0}">
<h2> �̹� ��û�ϼ̽��ϴ�! </h2>
<h2> Ŀ�ô� �ѹ��� ��û �����մϴ�.</h2>
</c:if>
<button type="button" class="btn btn-default" onclick='checkPro()'>�̺�Ʈ â����</button>	
</center>
</body>
</html>