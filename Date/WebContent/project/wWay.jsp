<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="JavaScript">

	function wayFn(wWay) {
		cw = screen.availWidth; //ȭ�� ����
		ch = screen.availHeight; //ȭ�� ����

		sw = 800; //��� â�� ����
		sh = 500; //��� â�� ����

		ml = (cw - sw) / 2; //��� �������� â�� x��ġ
		mt = (ch - sh) / 2;
	//	open.window()
	

	    
		if(wWay.way.value==1){
			if (wWay.wnumber.value<=0) {
		        alert("��÷�� ���� 0���� ũ�� �Է��ϼ���");
		        return false;	}
		url = "random.nhn?enumber=" + wWay.enumber.value + "&wnumber=" + wWay.wnumber.value;
		open(url, "way",
				"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,"
						+ "width=" + sw + ",height=" + sh + ",top=" + mt
						+ ",left=" + ml);
		self.close();
		}
	
		
		if(wWay.way.value==2){
			if (wWay.wnumber.value<=0) {
		        alert("��÷�� ���� 0���� ũ�� �Է��ϼ���");
		        return false;	}
			url = "choice.nhn?enumber=" + wWay.enumber.value + "&wnumber=" + wWay.wnumber.value;
			open(url, "way",
					"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,"
							+ "width=" + sw + ",height=" + sh + ",top=" + mt
							+ ",left=" + ml);
			self.close();
			}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��÷ ���� ��� ����</title>
</head>
<body>
	<form name="wWay" method="post">
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="center"><p>
						<input type="hidden" name="enumber" value="${enumber}"> 
						<input type="hidden" name="wnumber" value="${wnumber}"> 
						���� ��÷�� �� : ${wnumber} <br/>
						<input type=radio name="way" value="1">����
						<input type=radio name="way" value="2">����<br/>						
						<input type="button" name="wayC" value="����" OnClick="wayFn(this.form)"><br/></td>
			</tr>
		</table>
	</form>
</body>
</html>