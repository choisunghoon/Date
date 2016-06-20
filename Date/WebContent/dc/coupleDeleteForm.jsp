<%@ page language="java" contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<html>
<head><title>커플삭제</title>
<link href="style.css" rel="stylesheet" type="text/css">

   <script language="javascript">
     <!--
       function begin(){
         document.myform.pw.focus();
       }

       function checkIt(){
		  if(!document.myform.pw.value){
           alert("비밀번호를 입력하지 않으셨습니다.");
           document.myform.passwd.focus();
           return false;
         }
	   }   
     -->
   </script>
</head>
<BODY onload="begin()">
<form name="myform" action="coupleDelete.nhn" method="post" onSubmit="return checkIt()">
<TABLE class="table" cellSpacing=0 cellPadding=0 width="260" border=0 align="center" >
  
  <TR height="30">
    <TD colspan="2" align="middle" >
	  <font size="+1" ><b>커플삭제</b></font></TD></TR>
  
  <TR height="30">
    <TD width="110"  align=center>비밀번호</TD>
    <TD width="150" align=center>
      <INPUT type=password name="pw"  size="15" maxlength="12"></TD></TR>
  <TR height="30">
    <TD colspan="2" align="middle"  >
      <INPUT type=submit value="커플삭제"> 
      <input type="button" value="취  소" onclick="javascript:window.location='mypage.nhn'"></TD></TR>
</TABLE>
</form>
</BODY>
</HTML>
