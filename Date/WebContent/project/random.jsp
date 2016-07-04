<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">	
function randomE(){
window.close();
	opener.parent.callAjax('adminEvent.nhn');
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<c:if test="${count>0}">
<c:forEach var="i" begin="0" end="${wnumber}">
${rList[i]}<br/>
</c:forEach>
</c:if>
<c:set var="chk" value="1" />
<a href="#" onclick="randomE()"><img src="/Date/button/z44.png"></a>
</body>
</html>