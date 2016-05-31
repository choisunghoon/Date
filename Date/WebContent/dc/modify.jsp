<%@ page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <body>
    <p>
    <c:if test="${check eq 'yes' }">
    <a href="modifyForm.nhn?fbcheck=yes">정보수정</a>
    </c:if>
    <c:if test="${check eq 'no' }">
    <a href="modifyForm.nhn?fbcheck=no">정보수정</a>
    <a href="deleteForm.nhn">탈퇴</a>
    </c:if>
    </p>
  </body>
</html>
