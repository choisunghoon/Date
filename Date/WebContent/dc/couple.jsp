<%@ page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>커플 정보</title>


<script>

	
</script>
<script language="JavaScript">


   <!-- 
    function checkIt() {
        var userinput = eval("document.userinput");
               
        if(!userinput.pw.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        if(userinput.pw.value != userinput.pw2.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }
       
        if(!userinput.username.value) {
            alert("사용자 이름을 입력하세요");
            return false;
        }
        
    }
   function openConfirmnickname(userinput) {
       // 아이디를 입력했는지 검사
       if (userinput.nickname.value == "") {
           alert("별명 입력하세요");
           return;
       }
       // url과 사용자 입력 id를 조합합니다.
       url = "confirmNickname.nhn?nickname=" + userinput.nickname.value ;
       
       // 새로운 윈도우를 엽니다.
       open(url, "confirm", 
       "toolbar=no, location1=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
   }
-->
</script>





<body>
<c:if test="${check1 eq 0 and check2 eq 0}">
<%@include file="/dc/coupleSearch.jsp" %>
</c:if>
<c:if test="${check1 eq 1 and couple.couple eq '0'}">
상대방의 수락을 기다리는 중입니다.
</c:if>
<c:if test="${check2 eq 1 and couple.couple eq '0'}">
커플신청이 왔습니다.
</c:if>


</body>

</html>