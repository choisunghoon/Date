<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body{
	top:0px;
	height:1750px;
	background-image: url("sy0526/ASD.jpg");
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
	width:1335px;
	height:290px;
	}
#recentcourse{
	width:1335px;
	height:290px;
	}
#bestcouple{
	width:1335px;
	height:290px;
	}

</style>
</head>
<body>
<%@include file="/sy0526/topmenu.jsp" %>


<div id="bestcourse">
	<a href="#"><img src="sy0526/bestcourse.jpg" style="margin-top:650px; margin-left:48%; opacity:0.7;"></a>
</div>
<div id="recentcourse">	
	<a href="#"><img src="sy0526/recentcourse.jpg" style="margin-top:690px; margin-left:22%; opacity:0.7;"></a>
</div>
<div id="bestcouple">
	<a href="#">
	<img src="sy0526/text.jpg" style="opacity:0.7; margin-left:37%; margin-top:732px;">
	</a>
</div>
</body>
</html>