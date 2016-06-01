<%@ page  contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="color.jsp"%>
<script language="javascript" src="http://connect.facebook.net/ko_KR/all.js" type="text/javascript"></script>

<html xmlns:fb="http://ogp.me/ns/fb#">
<head><title>메인입니다..</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>


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

                window.location.href = 'loginPro.nhn?fbid=' + user.id+'&hidden=fb';
                
            }
        }); 
    	//document.location.reload();
    });
  };

  // Load the SDK Asynchronously
  (function(d){
     var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
     if (d.getElementById(myId)) {return;}
     js = d.createElement('script'); js.id = id; js.async = true;
     js.src = "//connect.facebook.net/ko_KR/all.js";
     ref.parentNode.insertBefore(js);
   }(document));
	function getMyProfile() {
		FB.api('/me', function(user) {
			var myId = user.id;
			window.location.href = 'main.nhn?id=' + myId;
		});

	}

	function focusIt() {
		document.inform.id.focus();
	}
</script>
<c:if test="${id eq 'undefined' }">
<% 
	session.invalidate();
	response.sendRedirect("main.nhn");
	%>
</c:if>
<c:if test="${id ne null and nickcheck eq 1}">
<script>
	alert("별명을 입력하지 않으시면 사이트 이용에 제한이 됩니다.회원정보 변경 메뉴에서 별명을 입력해주세요");
</script>
</c:if>
<c:if test="${id eq null }">

<body onLoad="focusIt();" >
  <table width="500" cellpadding="0" cellspacing="0"  align="center" >
       <form name="inform" method="post" action="loginForm.nhn"  onSubmit="return checkIt();">
           
     
          <td colspan="3"   align="center">
            <input type="submit" value="일반로그인">
			<input type="button"  value="회원가입" onclick="javascript:window.location='inputForm.nhn'">
            <div class="fb-login-button" data-max-rows="1" data-size="medium" data-show-faces="false" data-auto-logout-link="true"></div>
          </td></tr></table></form>
          </body></c:if>
     <c:if test="${(id ne null) and (check eq 'yes')}">
       <table width="500" cellpadding="0" cellspacing="0"  align="center" >
         <tr>
      

           <td rowspan="3"  align="center">
            ${ id}님 환영합니다.<br/>
     
             <div class="fb-login-button" data-max-rows="1" data-size="medium" data-show-faces="false" data-auto-logout-link="true"></div>
             <input type="button" value="마이페이지" onclick="javascript:window.location='mypage.nhn?fbcheck=yes&id=${id}'">
         </td>
        </tr>
       
     </table>
     <br>
 </c:if>
 <c:if test="${(id ne null) and (check eq 'no')}">
       <table width="500" cellpadding="0" cellspacing="0"  align="center">
         <tr>
           <td rowspan="3"  align="center">
            ${ id}님 환영합니다.
            
             <form  method="post" action="logout.nhn">  
             <input type="submit"  value="로그아웃">
             <input type="button" value="마이페이지" onclick="javascript:window.location='mypage.nhn?fbcheck=no&id=${id}'">
             </form>
         </td>
        </tr>
       
     </table>
     <br>
 </c:if>
</div>
</html>
