<%@ page  contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script language="javascript" src="http://connect.facebook.net/ko_KR/all.js" type="text/javascript"></script>

<html xmlns:fb="http://ogp.me/ns/fb#">
<body>
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
    <style type="text/css">
#topclass{
	width:1335px;
	height:630px;}

#topmenu{
	background-color:#FFFFFF !important; 
	margin-top:50px;
	width:1335px; 
	height:45px; 
	opacity:0.7;}
.top{
	padding-left:373px;}
.top1{
	float:left; 
	list-style:none; 
	padding-right:10px; 
	height:10px; 
	line-height:50px; 
	font-size:15px;
	}
.top2{
	float:left;
	list-style:none; 
	padding-left:80px;
	height:10px;
	line-height:50px;
	font-size:15px;}
a{ 
	border:0;
	}
a:link, a:visited{ 
	color:#000; 
	text-decoration:none;
	}
a:hover{ 
	font-weight:bold;
	}

</style>
<div id="topclass">
<div id="topmenu">

<ul class="top">
		<li class="top1"><a href="couple.nhn">커플 페이지</a>&nbsp; /</li>
		<li class="top1"><a href="share.nhn">정보공유게시판</a>&nbsp; /</li>
		<li class="top1"><a href="theme.nhn">테마별 데이트코스</a>&nbsp; /</li>
		<li class="top1"><a href="event.nhn">이벤트 페이지</a>&nbsp; /</li>
		<li class="top2">

<c:if test="${id eq null }">

            <a href="loginForm.nhn">일반로그인</a>&nbsp;
            <div class="fb-login-button" data-max-rows="1" data-size="medium" data-show-faces="false" data-auto-logout-link="true"></div>
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="inputForm.nhn">회원가입</a>
            
</c:if>
     <c:if test="${(id ne null) and (check eq 'yes')}">

            ${ id}님 환영합니다.&nbsp;&nbsp;&nbsp;&nbsp;
     
             <div class="fb-login-button" data-max-rows="1" data-size="medium" data-show-faces="false" data-auto-logout-link="true"></div>&nbsp;&nbsp;
             <a href="mypage.nhn?fbcheck=yes&id=${id}">개인페이지</a>

     <br>
 </c:if>
 <c:if test="${(id ne null) and (check eq 'no')}">

            ${ id}님 환영합니다.&nbsp;&nbsp;&nbsp;&nbsp;
            
		  
          <a href="logout.nhn">로그아웃</a>&nbsp;&nbsp;
          <a href="mypage.nhn?fbcheck=no&id=${id}">개인페이지</a>

 </c:if>
</div></body>
		</li>
		
</ul>
</div>