<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language='javascript'>
     function check(){
    	 cw=screen.availWidth;     //ȭ�� ����
    	 ch=screen.availHeight;    //ȭ�� ����

    	 sw=400;    //��� â�� ����
    	 sh=200;    //��� â�� ����

    	 ml=(cw-sw)/2;        //��� �������� â�� x��ġ
    	 mt=(ch-sh)/2;         //��� �������� â�� y��ġ	 
    	 
    	 
      var gsWin = window.open('addAppPro,.jsp','viewer','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
      var frm =document.addApp;
      frm.action = 'addAppPro.nhn';
      frm.target ="viewer";
      frm.method ="post";
      frm.submit();
     }
     
    </script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�̺�Ʈ ����</title>
</head>
<body>
	<form method="post" name="addApp" >
		<table border="1" width="500" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="30">
				<td align="center" width="100">����</td>
				<td align="center"><input type="text" name="appsubject">
									<input type="hidden" name="enumber" value="${enumber}">
									<input type="hidden" name="couplename" value="Ŀ����11111"></td>
			</tr>
			<tr height="30">
				<td align="center" width="100">��й�ȣ</td>
				<td align="center"><input type="text" name="apppw"><br/>
									*��й�ȣ ������ �ڵ����� ��б��� �˴ϴ�.</td>
			</tr>			
			<tr height="30">
				<td align="center" colspan=2 >�̺�Ʈ ��û ����</td>
			</tr>
			<tr>
				<td align="center" colspan=2>
				<textarea name="appcomment" rows="13"cols="50"></textarea></td>
			</tr>
			<tr>
				<td colspan=2 align="center">
				<button type="submit" class="btn btn-default" data-dismiss="modal" onclick='check()'>��û</button>				
			</tr>				
		</table>
	</form>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->		
</body>
</html>