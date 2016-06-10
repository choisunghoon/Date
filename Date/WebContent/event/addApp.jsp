<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language='javascript'>
     function check(){
    	 cw=screen.availWidth;     //화면 넓이
    	 ch=screen.availHeight;    //화면 높이

    	 sw=400;    //띄울 창의 넓이
    	 sh=200;    //띄울 창의 높이

    	 ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
    	 mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치	 
    	 
    	 
      var gsWin = window.open('addAppPro,.jsp','viewer','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
      var frm =document.addApp;
      frm.action = 'addAppPro.nhn';
      frm.target ="viewer";
      frm.method ="post";
      frm.submit();
     }
     
    </script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이벤트 참여</title>
</head>
<body>
	<form method="post" name="addApp" >
		<table border="1" width="500" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="30">
				<td align="center" width="100">제목</td>
				<td align="center"><input type="text" name="appsubject">
									<input type="hidden" name="enumber" value="${enumber}">
									<input type="hidden" name="couplename" value="커플잉11111"></td>
			</tr>
			<tr height="30">
				<td align="center" width="100">비밀번호</td>
				<td align="center"><input type="text" name="apppw"><br/>
									*비밀번호 설정시 자동으로 비밀글이 됩니다.</td>
			</tr>			
			<tr height="30">
				<td align="center" colspan=2 >이벤트 신청 내용</td>
			</tr>
			<tr>
				<td align="center" colspan=2>
				<textarea name="appcomment" rows="13"cols="50"></textarea></td>
			</tr>
			<tr>
				<td colspan=2 align="center">
				<button type="submit" class="btn btn-default" data-dismiss="modal" onclick='check()'>신청</button>				
			</tr>				
		</table>
	</form>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->		
</body>
</html>