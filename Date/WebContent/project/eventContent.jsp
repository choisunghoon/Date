<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">  
function callEvent(url,pageNum,enumber){    	
  	 $.ajax({   		   
	        type: "post", 	       
	        url : url+"?pageNum="+pageNum+"&enumber="+enumber,
	        success: test,	// ��������û ������ ���� �Լ�
	        error: whenError	//��������û ���н� �����Լ�
    	});
  }

    function callAddApp(url,enumber){    	
   	 $.ajax({   		   
	        type: "post", 	       
	        url : url+"?enumber="+enumber,
	        success: test,	// ��������û ������ ���� �Լ�
	        error: whenError	//��������û ���н� �����Լ�
     	});
   }
    
    function callApp(url,appnumber,wnumber,enumber,pageNum,tab){    
   	 $.ajax({    		
	        type: "post", 	 
	        url : url+"?appnumber="+appnumber+"&wnumber="+wnumber+"&enumber="+enumber+"&pageNum="+pageNum+"&tab="+tab,
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
<style>
.page {
	margin-left: 50%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�̺�Ʈ �� ���� ������</title>
</head>
<body>
	<table border="1" width="500" cellpadding="0" cellspacing="0"
		align="center">
		<tr height="30">
			<td align="center" width="100">�̺�Ʈ �̸�</td>
			<td align="center">${eto.ename}</td>
		</tr>
		<tr>
			<td align="center" width="150">�̴� ��÷�� �� : ${eto.wnumber}</td>
			<td align="center">���� ��¥ : ${eto.sdate}~${eto.edate}</td>
		</tr>
		<tr>
			<td align="center" colspan=2><img src="${eto.eimg}"></td>
		</tr>
	</table>
	<br/>
	<c:if test="${tab==2}">
		<center>
			���� �̺�Ʈ�� ����Ⱓ�� �ƴմϴ�!<br />�̺�Ʈ�� ���� �Ǹ� ���� ��Ź�����^__^
		</center>
	</c:if>
	<c:if test="${tab==1||tab==3}">
		<table border="1" width="500" cellpadding="0" cellspacing="0" align="center">			
			<tr height="30">
				<td align="center" width="50">�� ��ȣ</td>
				<td align="center" width="100">Ŀ�� �̸�</td>
				<td align="center" width="300">����</td>
				<c:forEach var="appList" items="${appList}">
					<tr height="30">
						<td align="center">${appList.appnumber}</td>
						<td align="center">${appList.couplename}</td>
						<td align="center"><c:if test="${appList.apppw!=null}">
								<img src="/Spring/project/lock.png" width="20" height="20">
								<a href="#"
									onclick="callApp('confirmPw.nhn',${appList.appnumber},${eto.wnumber},${eto.enumber},${currentPage}, ${tab})">
									${appList.appsubject}</a>
							</c:if> <c:if test="${appList.apppw==null}">
								<a href="#"
									onclick="callApp('appContent.nhn',${appList.appnumber},${eto.wnumber},${eto.enumber},${currentPage}, ${tab})">
									${appList.appsubject}</a>
							</c:if></td>
					</tr>
				</c:forEach>
		</table>
	</c:if>
	<c:if test="${tab==1}"><button type="button" class="btn btn-default" style="margin-top:5px; margin-left:408px" onclick="callAddApp('addApp.nhn',${eto.enumber})">�̺�Ʈ �����ϱ�</button></c:if><br/>
	<c:if test="${tab==4}">
	<c:forEach var="i" begin="0" end="${eto.wnumber}">
	${rwlist[i]}<br/>
	</c:forEach>
	</c:if>
	<div class="page">
		<c:set var="pageCount"
			value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
		<c:set var="pageBlock" value="${10}" />
		<fmt:parseNumber var="result" value="${currentPage / 10}"
			integerOnly="true" />
		<c:set var="startPage" value="${result * 10 + 1}" />
		<c:set var="endPage" value="${startPage + pageBlock-1}" />
		<c:if test="${endPage > pageCount}">
			<c:set var="endPage" value="${pageCount}" />
		</c:if>

		<c:if test="${startPage > 10}">
			<a href=# onclick="callEvent('eventContent.nhn',${startPage - 10 },${enumber})">[����]</a>
		</c:if>

		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href=# onclick="callEvent('eventContent.nhn',${i},${enumber})">[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCount}">
			<a href=# onclick="callEvent('eventContent.nhn',${startPage + 10 },${enumber})">[����]</a>
		</c:if>
	</div>
</body>
</html>