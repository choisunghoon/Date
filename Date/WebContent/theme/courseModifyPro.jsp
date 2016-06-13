<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="style.css" rel="stylesheet" type="text/css">

<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr> 
    <td height="39"  align="center">
	  <font size="+1" ><b>코스 수정</b></font></td>
  </tr>
  <tr>
    <td align="center"> 
      <p>코스 수정 완료.</p>
    </td>
  </tr>
  <tr>
    <td align="center"> 
      <form>
	    <input type="button" value="코스로" onclick="window.location='course.nhn?ctg_num=${ctg_num}&cos_num=${cos_num}'">
      </form>
      5초후에 메인으로 이동합니다.<meta http-equiv="Refresh" content="5;url=course.nhn?ctg_num=${ctg_num}&cos_num=${cos_num}" >
    </td>
  </tr>
</table>
</body>
</html>