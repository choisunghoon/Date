<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�̺�Ʈ ����</title>
</head>
<body>
<center>
<c:if test="${test==0}">
<h2> �������ּż� �����մϴ� ^0^ </h2>
<h2> �̺�Ʈ ��ǥ ����� �� Ȯ�����ּ���! </h2>
</c:if>
<c:if test="${test!=0}">
<h2> �̹� ��û�ϼ̽��ϴ�! </h2>
<h2> Ŀ�ô� 1���� ��û �����մϴ�.</h2>
</c:if>
</center>

</body>
</html>