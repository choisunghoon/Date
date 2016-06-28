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
<style>
.table14_1 table {
	margin:15px 0;
	border:0;
}
.table14_1 th {
	font-weight:bold;
	background-color:#FFDEE9;
	color:#FF607F
}
.table14_1,.table14_1 th,.table14_1 td {
	font-size:0.95em;
	text-align:center;
	padding:4px;
	border-collapse:collapse;
}
.table14_1 th,.table14_1 td {
	border: 1px solid #ffffff;
	border-width:1px
}
.table14_1 th {
	border: 1px solid #e7f6fe;
	border-width:1px 0 1px 0
}
.table14_1 td {
	border: 1px solid #eeeeee;
	border-width:1px 0 1px 0
}
.table14_1 tr {
	border: 1px solid #ffffff;
}
.table14_1 tr:nth-child(odd){
	background-color:#f7f7f7;
}
.table14_1 tr:nth-child(even){
	background-color:#ffffff;
}
</style>

<div id="check">  
����� ��û Ȯ��
<form method="post"> 
<table class="table14_1" border="1px" cellspadding="0" cellspacing="0" width="600px" style="align:center;">
	<tr style="height:30px">
		<th>Ŀ�þ��̵�</th>
		<th>����� ��û��¥</th>
		<th>��û����</th>
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
