<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script language='javascript'>
	function checkApp(){
		var c = document.getElementsByName('apppwC');
		if(c[1].checked==true){
			if(addApp.apppw.value == "")
				{
					alert("비공개를 원하실 경우 비밀번호를 입력해주셔야 합니다!");
					
					return;
				
				}			
		}
		if(c[0].checked==true){
			if(addApp.apppw.value != ""){
				alert("비공개를 원하실 경우에만 비밀번호를 입력해주셔야 합니다!");
				return;
				}
		}
		$.ajax({
			type : "post",
			data : {
				"appsubject" : $("#appsubject").val(),
				"enumber" : $("#enumber").val(),
				"couplename" : $("#couplename").val(),
				"apppw" : $("#apppw").val(),
				"appcomment" : $("#appcomment").val(),
				"appimg" : $("#appimg").val()
			},
			url : "addAppPro.nhn",
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
		document.addApp.appimg.value = imotappimg;
		imotappimgDiv.style.visibility = "hidden";
	}

	function viewimotappimg(){
		imotappimgDiv.style.visibility = "visible";
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이벤트 참여</title>
</head>
<body>
	<form method="post" name="addApp">
		<table border="1" width="350" cellpadding="0" cellspacing="0"
			align="center">
			<input type=hidden id="appimg" name=appimg value='1.png'>
			<tr height="30">
				<td align="center" width="100">제목</td>
				<td align="center" colspan="2"><input type="text" id="appsubject" name="appsubject">
									<input type="hidden" id="enumber" name="enumber" value="${enumber}"></td>
			</tr>
			<tr height="30">
				<td align="center" width="100">커플 이름</td>
				<td align="center" width="200">${couplename}</td>
				<td align="center" style="CURSOR: pointer;" onclick=viewimotappimg(); style="width:32;height:29"><input type="hidden" id="couplename" name="couplename" value="${couplename}">
				<DIV id=imotappimgImg name="imotiImg" style="width:32"><IMG src="/Date/project/ee/8.png"></DIV></td>
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
			<tr height="30">
				<td align="center" width="100">비밀번호</td>
				<td align="center" colspan="2"><input type=radio name="apppwC" checked>공개&nbsp;&nbsp; 
									<input type=radio name="apppwC">비공개<br/>
									*비공개시 비밀번호를 입력해주세요!
								   <input id="apppw" name="apppw" type="text"></td>
			</tr>			
			<tr height="30">
				<td align="center" colspan=3 >이벤트 신청 내용</td>
			</tr>
			<tr>
				<td align="center" colspan=3>
				<textarea name="appcomment" id="appcomment" rows="13"cols="50"></textarea></td>
			</tr>
			<tr>
				<td colspan=3 align="center">
				<button type="button" class="btn btn-default" onclick='checkApp()'>신청</button>				
			</tr>				
		</table>
	</form>
</body>
</html>