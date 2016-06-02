<%@ page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>별명 확인</title>




<body>
<c:if test="${check==0 }">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr> 
    <td height="39" >${nickname }존재하지 않는 별명입니다.</td>
  </tr>
</table>
<form name="checkForm" method="post" action="searchNickname.nhn">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td align="center"> 
       다른 별명 선택하세요.<p>
       <input type="text" size="10" maxlength="12" name="nickname"> 
       <input type="submit" value="별명 확인">
    </td>
  </tr>
</table>
</form>
</c:if>
<c:if test="${check==1 }">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr> 
    <td align="center"> 
      <p>${nickname }에게 커플 신청을 합니다.  </p>
      <input type="button" value="닫기" onclick="setnickname()">
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
    	
		self.close();
		}
		-->
</script>
