<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script language="JavaScript">

	function callAjaxyj(num1){
		cw = screen.availWidth; //ȭ�� ����
		ch = screen.availHeight; //ȭ�� ����
		
		url = "coursecontent.nhn?num="+num1;
		sw = 700; //��� â�� ����
		sh = 650; //��� â�� ����
	
		ml = (cw - sw) / 2; //��� �������� â�� x��ġ
		mt = (ch - sh) / 2;
	//	open.window()
	
		url = nhn;
		open(url, "way",
				"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,"
						+ "width=" + sw + ",height=" + sh + ",top=" + mt
						+ ",left=" + ml);
		self.close();
	}
	
	function openState(num1) {
	    // url�� ����� �Է� id�� �����մϴ�.
	    url = "coursecontent.nhn?num="+num1;
	    
	    // ���ο� �����츦 ���ϴ�.
	    open(url, "confirm", 
	    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=1100, height=520");
	}

	//function content(regdate,couplename){
	//	 url = "photocontent.nhn?couplename1="+couplename+"&regdate1="+regdate;
	//	window.location.href = url;
	//}
</script>  
<c:set var="i" value="0"/>
<c:forEach var="best" items="${best}">
	<div id="course${i}" style="border:1px solid; width:220px;float:left; margin-left:40px;margin-top:48px;">
	<c:forEach begin="${i}" end="${i}" items="${couple}" var="couple">
	<div id="img${i}" style="margin-left:5px;width:210px; height:300px; border:1px solid">
	<center><a href="#" onclick="openState('${best.num}')" ><img src="${couple.coupleimage}"></a></center>
	</div>
	</c:forEach>
	<c:set var="i" value="${i+1 }"/>
	<center>${best.couplename}</center>
	<center>${best.subject}</center>
	</div>

	<c:set var="i" value="${i+0 }"/>
</c:forEach>