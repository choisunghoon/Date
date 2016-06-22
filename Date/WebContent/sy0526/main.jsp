<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script language="javascript" src="http://connect.facebook.net/ko_KR/all.js" type="text/javascript"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">
body{
	top:0px;
	height:1750px;
	background-image: url("mainimg/ASD.png");
	background-repeat: no-repeat;
	}
	/*background-repeat: repeat-x; 처음위치에서 이미지가 수평으로 반복*/
	/* background-repeat: repeat-y; */ /*처음위치에서 이미지가 수직으로 반복*/
	/* background-repeat: no-repeat; */ /*이미지가 반복되지 않고 하나의 이미지만 표시*/

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
#bestcourse{
	width:100%;
	height:290px;
	}
#recentcourse{
	width:100%;
	height:290px;
	}
#bestcouple{
	width:100%;
	height:290px;
	}
#menu {
	width:100%;
	height:200px;
	}
#menu ul li{
	float:left;
	width:240px;
		}
li{
	list-style:none;
	color:#8C8C8C;
	}
#topmenu {
	margin-top:5px;
	margin-left:74%;
	}
	#top2{
	}
#topmenu ul li{
	font-size:15px;
	}
#topmenu1 {
	margin-top:5px;
	margin-left:73%;
	}
#topmenu1 ul li{
	font-size:15px;
	color:#B8B8B8
	}
	img {
		border:0}
</style>
<html xmlns:fb="http://ogp.me/ns/fb#">
<div id="fb-root"></div>
<script type="text/javascript">
  


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
	            	
	            	
	                window.location.href = 'loginPro.nhn?id='+user.id+'&hidden=fb';
	                
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
<c:if test="${id eq 'undefined'}">
	<% 
		session.invalidate();
		response.sendRedirect("main.nhn");
	%>
</c:if>
<c:if test="${id ne null and nickcheck eq 1}">
<script>
	alert("별명을 입력하지 않으시면 사이트 이용에 제한이 됩니다.회원정보 변경 메뉴에서 별명을 입력해주세요");
	<%response.sendRedirect("modifyForm.nhn");%>
	</script>
</c:if>
<script type="text/javascript">
    function asdf(nhn){
        $.ajax({
	        type: "post",
	        url : nhn,
	        
	        success: test,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
     	});
    }
    function test(aaaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $(".modal-body").html(aaaa);
        
    }
    function whenError(){
        alert("Error");
    }
</script>
<body>
	<div class="container">

		<!-- 모달 팝업 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog" style="width:80%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					</div>
				<div class="modal-body">
				</div>    
			</div>
		</div>
	</div>
</div>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<div id="topmenu">
	<ul>
		<li class="top2">
			<c:if test="${id eq null }">
				<a href="#"onclick="asdf('loginForm.nhn')" data-toggle="modal" data-target="#myModal" style="color:#B8B8B8">로그인</a> &nbsp;|&nbsp;
				<a href="#" onclick="asdf('inputForm.nhn')" data-toggle="modal" data-target="#myModal" style="color:#B8B8B8">회원가입</a>&nbsp;|&nbsp;
				<div class="fb-login-button" data-max-rows="1" data-size="medium" data-show-faces="false" data-auto-logout-link="true"></div>
			</c:if>
			<c:if test="${id ne null  and (check eq 'yes')}">
			<%@include file="/dc/test/alertify.js-0.3.11/example/index.jsp" %>
				${ id}님 환영합니다.
				&nbsp;|&nbsp;<div class="fb-login-button" data-max-rows="1" data-size="medium" data-show-faces="false" data-auto-logout-link="true"></div> 
			</c:if>
			<c:if test="${id ne null  and (check eq 'no')}">
			<%@include file="/dc/test/alertify.js-0.3.11/example/index.jsp" %>
				${ id}님 환영합니다.
				&nbsp;|&nbsp;<a href="logout.nhn" style="color:#B8B8B8">로그아웃</a> 
			</c:if>
		</li>
	</ul>
</div>

<div id="menu">
	<ul style="margin-left:5%; margin-top:35.5%;">
		<li>
			<a href="couple.nhn"><img src="mainimg/as.png" onmouseover='this.src="mainimg/as1.png"' onmouseout='this.src="mainimg/as.png"' ></a>
		</li>
		<li>
			<a href="share.nhn"><img src="mainimg/as3.png" onmouseover='this.src="mainimg/as4.png"' onmouseout='this.src="mainimg/as3.png"'></a>
		</li>
		<li>
			<a href="addCtgView.nhn"><img src="mainimg/as5.png" onmouseover='this.src="mainimg/as6.png"' onmouseout='this.src="mainimg/as5.png"'></a>
		</li>
		<li>
			<a href="event.nhn"><img src="mainimg/as7.png" onmouseover='this.src="mainimg/as8.png"' onmouseout='this.src="mainimg/as7.png"'></a>
		</li>
		<li>
			<c:if test="${id != 'admin'}">
			<a href="mypage.nhn?fbcheck=no&id=${id}"><img src="mainimg/as9.png" onmouseover='this.src="mainimg/as10.png"' onmouseout='this.src="mainimg/as9.png"'></a>
			</c:if>
			<c:if test="${id == 'admin'}">
			<a href="adminpage.nhn"><img src="mainimg/a12.png" onmouseover='this.src="mainimg/a11.png"' onmouseout='this.src="mainimg/a12.png"'></a>
			</c:if>
		</li>
	</ul>
</div>

<div id="bestcourse">
	<a href="#"><img src="mainimg/bestcourse.jpg" style="margin-top:4.4%; margin-left:48%; opacity:0.7;"></a>
</div>
<div id="recentcourse">	
	<a href="#"><img src="mainimg/recentcourse.jpg" style="margin-top:7.4%; margin-left:22%; opacity:0.7;"></a>
</div>

<div id="bestcouple">
	<a href="#">
	<img src="mainimg/text.jpg" style="opacity:0.7; margin-left:37%; margin-top:15%;">
	</a>
</div>

</body>
</html>
