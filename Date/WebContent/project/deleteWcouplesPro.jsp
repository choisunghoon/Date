<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<c:set var="chk" value="1" />
<script type="text/javascript">
	alert("삭제완료!");
	window.close();
	opener.parent.callAjax('adminEvent.nhn');
</script>

</body>
</html>