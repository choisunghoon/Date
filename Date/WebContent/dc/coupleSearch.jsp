<%@ page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>커플 찾기</title>


<script>

	
</script>
<script language="JavaScript">


   <!-- 
    
   function openSNickname(userinput) {
       // 별명을 입력했는지 검사
       if (userinput.nickname.value == "") {
           alert("별명을 입력하세요");
           return;
       }
       // url과 사용자 입력 id를 조합합니다.
       url = "searchNickname.nhn?nickname=" + userinput.nickname.value ;
       
       // 새로운 윈도우를 엽니다.
       open(url, "confirm", 
       "toolbar=no, location1=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
   }
   function openCCName(userinput) {
       // 별명을 입력했는지 검사
       if (userinput.coupleName.value == "") {
           alert("커플명을 입력하세요");
           return;
       }
       // url과 사용자 입력 id를 조합합니다.
       url = "confirmCoupleName.nhn?coupleName=" + userinput.coupleName.value ;
       
       // 새로운 윈도우를 엽니다.
       open(url, "confirm", 
       "toolbar=no, location1=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
   }
-->
</script>





<body>
<form method="post" action="coupleSearchPro.nhn?id=${id }" name="userinput" onsubmit="return checkIt()">

  <table width="600" border="1" cellspacing="0" cellpadding="3"  align="center">
    <tr > 
      <td  colspan="2" height="39" align="center">
	     <font size="+1" ><b>커플 찾기</b></font></td>
    </tr>
    <tr>
      <td colspan="2" class="normal" align="center">상대방의 별명으로 검색합니다.함께 사용하실 커플명도 입력 해주세요.</td>
    </tr>

    <tr> 
      <td  width="200">상대방 별명</td>
      <td  width="400"><input type="text" name="nickname">
      	<input type="button" value="별명확인" OnClick="openSNickname(this.form)">
      </td>
    </tr>
 
    <tr> 
      <td   width="200">커플명</td>
      <td  width="400"> 
        <input type="text" name="coupleName" size="15" maxlength="30">
      	<input type="button" value="커플명 중복확인" OnClick="openCCName(this.form)">
      </td>
    </tr>
  <tr> 
      <td colspan="2" align="center" > 
       <input type="submit" value="커플 신청" >
       <input type="button" value="취  소" onclick="javascript:window.location='mypage.nhn'">      
      </td>
    </tr>
  </table>
</form>
</body>

</html>