<%@ page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>별명 중복확인</title>




<body>
<c:if test="${check==1 }">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr> 
    <td height="39" align="center">${nickname }   <br>이미 사용중인 별명입니다.</td>
  </tr>
</table>
<form name="checkForm" method="post" action="confirmNickname.nhn">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td align="center"> 
       다른 별명 선택하세요.<p>
       <input type="text" size="10" maxlength="12" name="id"> 
       <a href="javascript:submit()"><img src="button/z12.png"></a>
    </td>
  </tr>
</table>
</form>
</c:if>
<c:if test="${check==0 }">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr> 
    <td align="center"> 
      <p>입력하신 ${nickname } 는 사용하실 수 있는 별명입니다. </p>
      <a href="javascript:setnickname()"><img src="button/z4.png"></a>
    </td>
  </tr>
</table>
</c:if>
</body>
</html>
<script language="javascript">
<!--
  function setnickname()
    {		
    	opener.document.userinput.nickname.value="${nickname}";
		self.close();
		}
		
function submit(){     
    
    document.checkForm.method = "post"     // method 선택, get, post
    document.checkForm.action = "confirmNickname.nhn";  // submit 하기 위한 페이지 
    document.checkForm.submit();
   
}		
		-->
</script>
