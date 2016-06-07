<%@ page  contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script language="javascript" src="http://connect.facebook.net/ko_KR/all.js" type="text/javascript"></script>
<html xmlns:fb="http://ogp.me/ns/fb#">

<html>
<meta charset="UTF-8">
    <body>
        <div id="fb-root"></div>
        <script>
  
        window.fbAsyncInit = function() {
          FB.init({
            appId      : '1136320869764141', // 앱 ID
            status     : true,          // 로그인 상태를 확인
            cookie     : true,          // 쿠키허용
            xfbml      : true           // parse XFBML
          });
         
          FB.getLoginStatus(function(response) {
              if (response.status === 'connected') {
                  
                  FB.api('/me', function(user) {
                      if (user) {
                          var image = document.getElementById('image');
                          image.src = 'http://graph.facebook.com/' + user.id + '/picture';
                          var name = document.getElementById('name');
                          name.innerHTML = user.name
                          var id = document.getElementById('id');
                          id.innerHTML = user.id
                      }
                  });    
                   
              } else if (response.status === 'not_authorized') {

              } else {
                  
              }
          });

          FB.Event.subscribe('auth.login', function(response) {
        	  alert("로그인 되었습니다.");
              document.location.reload();
          });
       
        FB.Event.subscribe('auth.logout', function(response) {
      	  alert("로그아웃 되었습니다.");
            document.location.reload();
        });
      
      
        // Load the SDK Asynchronously
        (function(d){
           var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
           if (d.getElementById(id)) {return;}
           js = d.createElement('script'); js.id = id; js.async = true;
           js.src = "//connect.facebook.net/ko_KR/all.js";
           ref.parentNode.insertBefore(js, ref);
         }(document));}
      </script>
      
      <p>로그인 버튼 추가</p>
      <fb:login-button show-faces="false" width="200" max-rows="1"data-auto-logout-link="true"></fb:login-button>
      
      <p>사용자정보 출력</p>
      <div align="left">
          <img id="image"/>
          <div id="name"></div>
          <div id="id"></div>
      </div>
  </body>