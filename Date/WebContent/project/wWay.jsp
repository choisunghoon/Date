<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script language="JavaScript">

function checkWcount(nhn) {
	var a =  document.wWay.wnumber.value-document.wWay.wcount.value;
	if($("#test").val() > a){
		alert(a+"보다 같거나 작은숙자를 입력하세요");
		return false;
	}
	else{
		 document.wWay.action =nhn;
	     document.wWay.submit();
	}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>당첨 선발 방법 선택</title>
</head>
<body>
<c:if test="${count==0}">
<center><h2>참여자가 없습니다!!!</h2></center>
</c:if>
<c:if test="${count>0}">
	<form name="wWay" method="post">
		<table width="500" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="center"><p>
					<input type="hidden" name="enumber" value="${enumber}"> 
					<input type="hidden" name="wnumber" value="${wnumber}"> 
					<input type="hidden" name="w" value="${w}"> 
					예정 당첨자 수 : ${wnumber}<br/>
					뽑힌 당첨자 수 : 					
					<input type="hidden" name="wcount" value="${wcount}">${wcount} <br/>	
					원하는 당첨자 수 :&nbsp;<input type="text" id="test" name=Cwcount > <br/>					
					<input type="button" name="way" value="랜덤" onClick="checkWcount('random.nhn?enumber=${enumber}&wnumber=${wnumber}')">
					<input type="button" name="way" value="선택" onClick="checkWcount('choice.nhn?enumber=${enumber}&wnumber=${wnumber}')">				
				</td>
			</tr>
		</table>
	</form>
</c:if>

</body>
</html>