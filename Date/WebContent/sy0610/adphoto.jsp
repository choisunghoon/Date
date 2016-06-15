<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
 
    function callAjax(nhn,regdate,couplename){
        $.ajax({
	        type: "post",
	        url : nhn,
	        data : {
	        	regdate1 : regdate,
	        	couplename1 : couplename
	        },		
	        success: refresh,	// ��������û ������ ���� �Լ�
	        error: whenError2	//��������û ���н� �����Լ�
     	});
    }
    function refresh(aaa){	// ��û������ ������������ aaa ������ �ݹ�ȴ�. 
        $("#check").html(aaa);
        
    }
    function whenError2(){
        alert("Error");
    }
  </script>
















<script language="JavaScript">
	function openState(regdate,couplename) {
	    // url�� ����� �Է� id�� �����մϴ�.
	    url = "state.nhn?couplename="+couplename+"&regdate="+regdate;
	    
	    // ���ο� �����츦 ���ϴ�.
	    open(url, "confirm", 
	    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
	}
	
	//function content(regdate,couplename){
	//	 url = "photocontent.nhn?couplename1="+couplename+"&regdate1="+regdate;
	//	window.location.href = url;
	//}
</script>  
<style>
 td{align:center;}
 tr{align:center;}
</style>

<div id="check">  
����� ��û Ȯ��
<form method="post"> 
<table border="1px" cellspadding="0" cellspacing="0" width="400px" style="align:center;">
	<tr>
		<td>Ŀ�þ��̵�</td>
		<td>����� ��û��¥</td>
		<td>��û����</td>
	</tr>
	<c:forEach items="${photo}" var="photo">
		<tr>
			<td><a href="#" onclick="callAjax('photocontent.nhn','${photo.regdate }','${photo.couplename }')">${photo.couplename }</a></td>
			<td><fmt:formatDate value="${photo.regdate }" pattern="YYYY-MM-dd" /></td>
			<td><a href="#" onclick="openState('${photo.regdate }','${photo.couplename }')">${photo.state}</a></td>
		</tr>
	</c:forEach>
</table>
</form>
</div>
