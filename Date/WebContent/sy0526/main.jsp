<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
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
	margin-left:82%;
	}
#topmenu ul li{
	font-size:15px;
	}
#topmenu1 {
	margin-top:5px;
	margin-left:75%;
	}
#topmenu1 ul li{
	font-size:15px;
	color:#B8B8B8
	}
	img {
		border:0}
</style>
</head>
<body>
<c:if test="${id eq null }">
<div id="topmenu">
	<ul>
		<li class="top2">
		<a href="#"onclick="asdf('loginForm.nhn')" data-toggle="modal" data-target="#myModal" style="color:#B8B8B8">로그인</a> &nbsp;|&nbsp;
		 <a href="#" onclick="asdf('inputForm.nhn')" data-toggle="modal" data-target="#myModal" style="color:#B8B8B8">회원가입</a></li>

		</li>
	</ul>
</div>
</c:if>
<c:if test="${id ne null }">
<div id="topmenu1">
	<ul>
		<li class="top2">
		${ id}님 환영합니다.&nbsp;&nbsp;|&nbsp;&nbsp;
          <a href="logout.nhn" style="color:#B8B8B8">로그아웃</a>
         </li>
	</ul>
</div>
</c:if>
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
<div id="menu">
	<ul style="margin-left:5%; margin-top:35%;">
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
			<a href="personal.nhn"><img src="mainimg/as9.png" onmouseover='this.src="mainimg/as10.png"' onmouseout='this.src="mainimg/as9.png"'></a>
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
	<img src="mainimg/text.jpg" style="opacity:0.7; margin-left:37%; margin-top:14.5%;">
	</a>
</div>

</body>
</html>