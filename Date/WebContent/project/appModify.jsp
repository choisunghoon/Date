<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">  
function modify() {
	$.ajax({
		type : "post",
		data : {
			"enumber" : $("#enumber").val(),
			"appsubject" : $("#appsubject").val(),
			"appcomment" : $("#appcomment").val(),
			"appnumber" : $("#appnumber").val(),
			"appimg" : $("#appimg").val()
		},
		url : "appModifyPro.nhn",
		success : test, // 페이지요청 성공시 실행 함수
		error : whenError
	//페이지요청 실패시 실행함수
	});
}
function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
    $(".modal-bodyy").html(aaa);	//id가 ajaxReturn인 부분에 넣어라
}
function whenError(){
    alert("Error");
}
function setImotappimg(imotappimg){
	imotappimgImg.innerHTML = imotappimgImg.innerHTML = "<img src=\"/Date/project/ee/" + imotappimg + "\" >";
	document.appModify.appimg.value = imotappimg;
	imotappimgDiv.style.visibility = "hidden";
}

function viewimotappimg(){
	imotappimgDiv.style.visibility = "visible";
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이벤트 댓글 수정</title>
</head>
<body>
<form method="post" name="appModify" >
<table border="1" width="350" cellpadding="0" cellspacing="0" align="center">
			<input type=hidden id="appimg" name=appimg value="${app.appimg}">
			<tr height="30">
				<td align="center"  width="100">제목</td>
				<td align="center" colspan="2"><input type="text" id="appsubject" name="appsubject" value="${app.appsubject}">
				<input type=hidden name="couplename" value="${app.couplename}">
				<input type=hidden id="appnumber" name="appnumber" value="${app.appnumber}">
				<input type=hidden id="enumber" name="enumber" value="${enumber}">
				</td>
			</tr>
			<tr height="30">
				<td align="center" width="100">커플 이름</td>
				<td align="center" width="200">${app.couplename}</td>
				<td align="center" width="32" style="CURSOR: pointer;" onclick=viewimotappimg();>
				<DIV id=imotappimgImg name="imotiImg" style="width:32"><IMG src="/Date/project/ee/${app.appimg}"></DIV></td>
				<td>
				<DIV id=imotappimgDiv style="Z-INDEX: 1000; VISIBILITY: hidden; WIDTH: 220px; POSITION: absolute; HEIGHT: 40px">
				<TABLE cellSpacing=0 cellPadding=0 border=0>
					<TR>
						<TD style="PADDING-LEFT: 2px">
							<TABLE cellSpacing=1 cellPadding=0 bgColor=#dedede border=0>
								<TR bgColor=#ffffff>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('1.png');"><IMG src="/Date/project/ee/1.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('2.png');"><IMG src="/Date/project/ee/2.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('3.png');"><IMG src="/Date/project/ee/3.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('4.png');"><IMG src="/Date/project/ee/4.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('5.png');"><IMG src="/Date/project/ee/5.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('6.png');"><IMG src="/Date/project/ee/6.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('7.png');"><IMG src="/Date/project/ee/7.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('8.png');"><IMG src="/Date/project/ee/8.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('9.png');"><IMG src="/Date/project/ee/9.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('10.png');"><IMG src="/Date/project/ee/10.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('11.png');"><IMG src="/Date/project/ee/11.png"></TD>
                                	<TD style="CURSOR: pointer;" onclick="setImotappimg('12.png');"><IMG src="/Date/project/ee/12.png"></TD>
                                </TR>
                                <TR bgColor=#ffffff>
                                	<TD style="CURSOR: pointer;" onclick="setImotappimg('13.png');"><IMG src="/Date/project/ee/13.png"></TD>
                                	<TD style="CURSOR: pointer;" onclick="setImotappimg('14.png');"><IMG src="/Date/project/ee/14.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('15.png');"><IMG src="/Date/project/ee/15.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('16.png');"><IMG src="/Date/project/ee/16.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('17.png');"><IMG src="/Date/project/ee/17.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('18.png');"><IMG src="/Date/project/ee/18.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('19.png');"><IMG src="/Date/project/ee/19.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('20.png');"><IMG src="/Date/project/ee/20.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('25.png');"><IMG src="/Date/project/ee/25.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('22.png');"><IMG src="/Date/project/ee/22.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('24.png');"><IMG src="/Date/project/ee/24.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('25.png');"><IMG src="/Date/project/ee/25.png"></TD>
                                </TR>
							</TABLE>
						</TD>
					</TR>
				</TABLE>
			</DIV>
			 </td>
			</tr>			
			<tr>
				<td align="center" width="100">이벤트 신청 내용</td>
				<td align="center" colspan="2"><textarea id="appcomment" name="appcomment" rows="13"cols="50">${app.appcomment}</textarea></td>
								
			</tr> 
			<tr height="30">
				<td colspan="3" align="center">				
				<button type="button" class="btn btn-default" onclick='modify()'>수정완료</button>					
			</tr>	
			</table>
			</form>

</body>
</html>