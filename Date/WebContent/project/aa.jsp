<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="./images/jquery_mini.js" type="text/javascript"></script>
<script src="./images/jquery.dimensions.js" type="text/javascript"></script>
<!-- ½ºÅ©·Ñ -->
<script type="text/javascript">
// <![CDATA[
	var name = "#floatMenu";
	var menuYloc = null;
	
		$(document).ready(function(){
			menuYloc = parseInt($(name).css("top").substring(0,$(name).css("top").indexOf("px")))
			$(window).scroll(function () { 
				offset = menuYloc+$(document).scrollTop()+"px";
				$(name).animate({top:offset},{duration:500,queue:false});
			});
		}); 
// ]]>
</script> 
<style>
/* #floatMenu */
#floatMenu{
text-align:left;
position:absolute;
width:40px;
top:200px;
right:10px;
padding:0;
margin:0;
z-index:1000;
}
#floatMenu a{
text-decoration:none;
display:block;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<!-- floating menu -->
<div id="floatMenu">
	<ul>
		<li><a href="#">menu1</a></li>
		<li><a href="#">menu2</a></li>
		<li><a href="#">menu3</a></li>
		<li><a href="#">menu4</a></li>
		<li><a href="#">menu5</a></li>
	</ul>
</div>
<!-- //floatMenu -->
</body>
</html>