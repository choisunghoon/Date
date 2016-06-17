<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script language="javascript" src="http://connect.facebook.net/ko_KR/all.js" type="text/javascript"/>
<html xmlns:fb="http://ogp.me/ns/fb#">
<head><title>로그인</title>
   <script language="javascript">
     <!--
       function begin(){
         document.myform.id.focus();
       }
       function checkIt(){
         if(!document.myform.id.value){
           alert("아이디를 입력하지 않으셨습니다.");
           document.myform.id.focus();
           return false;
         }
         if(!document.myform.pw.value){
           alert("비밀번호를 입력하지 않으셨습니다.");
           document.myform.pw.focus();
           return false;
         }
         
       }
     -->
   </script>
</head>
<BODY onload="begin()" >
<div id="fb-root"></div>
<script language="javascript" type="text/javascript">

window.fbAsyncInit = function() {
    FB.init({
      appId      : '1136320869764141', // 앱 ID
      status     : true,          // 로그인 상태를 확인
      cookie     : true,          // 쿠키허용
      xfbml      : true           // parse XFBML
    });
   
    FB.getLoginStatus(function(response) {
        if (response.status === 'connected') {
        	
        	
        	
        } else if (response.status === 'not_authorized') {
        
        	
        	
        } else {
        	
        	
        }
    });
    
    FB.Event.subscribe('auth.login', function(response) {
    	FB.api('/me', function(user) {
            if (user) {
            	
            	
            	
                window.location.href = 'loginPro.nhn?fbid='+user.id+'&hidden=fb';
                
            }
        }); 
    	
    	//document.location.reload();
    });
    FB.Event.subscribe('auth.logout', function(response) {
    	
    	
    	session.invalidate();
    	document.location.href='main.nhn';
	});
   
  }

  // Load the SDK Asynchronously
 
	
</script>
<form name="myform" action="loginPro.nhn" method="post" onSubmit="return checkIt()">
<TABLE cellSpacing=1 cellPadding=1 width="260" border=1 align="center" >
  
  <TR height="30">
    <TD colspan="2" align="middle" ><STRONG>회원로그인</STRONG></TD></TR>
  
  <TR height="30">
    <TD width="110"  align=center>아이디</TD>
    <TD width="150"  align=center>
       <INPUT type="text" name="id" size="15" maxlength="12"></TD></TR>
  <TR height="30">
    <TD width="110"  align=center>비밀번호</TD>
    <TD width="150"  align=center>
      <INPUT type=password name="pw"  size="15" maxlength="12"></TD></TR>
  <TR height="30">
    <TD colspan="2" align="middle"  >
      <input type="hidden" name="hidden" id="hidden" value="nomal">
      <INPUT type=submit value="로그인"> 
      <INPUT type=reset value="다시입력">
<div class="fb-login-button" data-max-rows="1" data-size="medium" data-show-faces="false" data-auto-logout-link="true"></div>
     </TD></TR>

      </TD></TR>

</TABLE>
</form>
</BODY>
</HTML>