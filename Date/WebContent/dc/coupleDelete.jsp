<%@ page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ccheck eq 1 and ucheck eq 1}">
 <script>alert("성공적으로 헤어졌습니다.");</script>
</c:if>
<c:if test="${ccheck eq 0 and ucheck eq 1}">
 <script>alert("헤어질 상대가 없습니다.");</script>
</c:if>
<c:if test="${ ucheck eq 0}">
 <script>alert("비밀번호가 틀렸습니다");</script>
 <meta http-equiv="Refresh" content="0;url=mypage.nhn" >
</c:if>
<meta http-equiv="Refresh" content="0;url=mypage.nhn" >