<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
	function memberDelete(id,nhn){
		
		$.ajax({
	        type: "post",
	        url : "AdminMemberPro.nhn?id="+id,
	        	 
     	});
		reload(nhn);
    }
function reload(nhn){
		
		$.ajax({
	        type: "post",
	        url : nhn,
	        success: refresh,
	        error: whenError2
	        	 
     	});
		
    }
function refresh(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
    $("#refresh").html(aaa);
    alert("삭제가 완료 되었습니다.");
    
}
function whenError2(){
    alert("Error");
}
    
</script>
</head>
<!-- This goes in the document HEAD so IE7 and IE8 don't cry -->
	<!--[if lt IE 9]>
	<style type="text/css">
		table.gradienttable th {
			filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d5e3e4', endColorstr='#b3c8cc',GradientType=0 );
			position: relative;
			z-index: -1;
		}
		table.gradienttable td {
			filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ebecda', endColorstr='#ceceb7',GradientType=0 );
			position: relative;
			z-index: -1;
		}
	</style>
	<![endif]-->

<!-- CSS goes in the document HEAD or added to your external stylesheet -->
<style type="text/css">
table.gradienttable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}
table.gradienttable th {
	padding: 0px;
	background: #d5e3e4;
	background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2Q1ZTNlNCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjQwJSIgc3RvcC1jb2xvcj0iI2NjZGVlMCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNiM2M4Y2MiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
	background: -moz-linear-gradient(top,  #d5e3e4 0%, #ccdee0 40%, #b3c8cc 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#d5e3e4), color-stop(40%,#ccdee0), color-stop(100%,#b3c8cc));
	background: -webkit-linear-gradient(top,  #d5e3e4 0%,#ccdee0 40%,#b3c8cc 100%);
	background: -o-linear-gradient(top,  #d5e3e4 0%,#ccdee0 40%,#b3c8cc 100%);
	background: -ms-linear-gradient(top,  #d5e3e4 0%,#ccdee0 40%,#b3c8cc 100%);
	background: linear-gradient(to bottom,  #d5e3e4 0%,#ccdee0 40%,#b3c8cc 100%);
	border: 1px solid #999999;
}
table.gradienttable td {
	padding: 0px;
	background: #ebecda;
	background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ViZWNkYSIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjQwJSIgc3RvcC1jb2xvcj0iI2UwZTBjNiIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNjZWNlYjciIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
	background: -moz-linear-gradient(top,  #ebecda 0%, #e0e0c6 40%, #ceceb7 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ebecda), color-stop(40%,#e0e0c6), color-stop(100%,#ceceb7));
	background: -webkit-linear-gradient(top,  #ebecda 0%,#e0e0c6 40%,#ceceb7 100%);
	background: -o-linear-gradient(top,  #ebecda 0%,#e0e0c6 40%,#ceceb7 100%);
	background: -ms-linear-gradient(top,  #ebecda 0%,#e0e0c6 40%,#ceceb7 100%);
	background: linear-gradient(to bottom,  #ebecda 0%,#e0e0c6 40%,#ceceb7 100%);
	border: 1px solid #999999;
}
table.gradienttable th p{
	margin:0px;
	padding:8px;
	border-top: 1px solid #eefafc;
	border-bottom:0px;
	border-left: 1px solid #eefafc;
	border-right:0px;
}
table.gradienttable td p{
	margin:0px;
	padding:8px;
	border-top: 1px solid #fcfdec;
	border-bottom:0px;
	border-left: 1px solid #fcfdec;;
	border-right:0px;
}
</style>

<!-- Table goes in the document BODY -->
<div id="refresh">
<table class="gradienttable">
	<tr>
		<th><p></p></th><th><p>아이디</p></th><th><p>닉네임</p></th><th><p>관심지역</p></th><th><p>커플</p></th><th><p>탈퇴</p></th>
	</tr>
	<c:forEach var="dto" items="${dto}">
	
	<tr>
		<td><p><input type="checkbox" /></p></td>	
		<td><p>${dto.id}</p></td>
		<td><p>${dto.nickname}</p></td>
		<td><p>${dto.location}</p></td>
		<td><p>${dto.couple}</p></td>

		<td><p><input type="button" onclick="memberDelete('${dto.id}','AdminMember.nhn')" value="강퇴" /></p></td>

		

	</tr>
	
	</c:forEach>
</table>
</div>
</html>