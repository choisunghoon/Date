<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">	
function rerere(){
	opener.parent.callAjax('adminEvent.nhn');
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<h2>알람을 보냈습니다!</h2>
<button type="button" onclick='rerere()'>닫기</button>
</body>
</html>