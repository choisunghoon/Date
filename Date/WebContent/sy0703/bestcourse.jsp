<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script language="JavaScript">

	function callAjaxyj(num1){
		cw = screen.availWidth; //화면 넓이
		ch = screen.availHeight; //화면 높이
		
		url = "coursecontent.nhn?num="+num1;
		sw = 700; //띄울 창의 넓이
		sh = 650; //띄울 창의 높이
	
		ml = (cw - sw) / 2; //가운데 띄우기위한 창의 x위치
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
	    // url과 사용자 입력 id를 조합합니다.
	    url = "coursecontent.nhn?num="+num1;
	    
	    // 새로운 윈도우를 엽니다.
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