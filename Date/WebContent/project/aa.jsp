<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<SCRIPT>
	function setImoticon(imoticon){
		imoticonImg.innerHTML = imoticonImg.innerHTML = "<img src=\"/Date/project/ee/" + imoticon + ".png\" >";
		document.inputform.icon.value = imoticon;
		imoticonDiv.style.visibility = "hidden";
	}

	function viewimoticon(){
		imoticonDiv.style.visibility = "visible";
	}
</SCRIPT>
<body>
<form name=inputform>
<TABLE cellSpacing=0 cellPadding=0 width="32" border=0>
<input type=hidden name=icon value='1'>
	<TR>
		<TD style="CURSOR: pointer;" onclick=viewimoticon(); width=32><DIV id=imoticonImg name="imotiImg"><IMG src="/Date/project/ee/8.png"></DIV></TD>
		<TD>
			<DIV id=imoticonDiv style="Z-INDEX: 1000; VISIBILITY: hidden; WIDTH: 220px; POSITION: absolute; HEIGHT: 40px">
				<TABLE cellSpacing=0 cellPadding=0 border=0>
					<TR>
						<TD style="PADDING-LEFT: 2px">
							<TABLE cellSpacing=1 cellPadding=0 bgColor=#dedede border=0>
								<TR bgColor=#ffffff>
									<TD style="CURSOR: pointer;" onclick="setImoticon('1');"><IMG src="/Date/project/ee/1.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('2');"><IMG src="/Date/project/ee/2.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('3');"><IMG src="/Date/project/ee/3.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('4');"><IMG src="/Date/project/ee/4.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('5');"><IMG src="/Date/project/ee/5.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('6');"><IMG src="/Date/project/ee/6.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('7');"><IMG src="/Date/project/ee/7.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('8');"><IMG src="/Date/project/ee/8.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('9');"><IMG src="/Date/project/ee/9.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('10');"><IMG src="/Date/project/ee/10.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('11');"><IMG src="/Date/project/ee/11.png"></TD>
                                	<TD style="CURSOR: pointer;" onclick="setImoticon('12');"><IMG src="/Date/project/ee/12.png"></TD>
                                </TR>
                                <TR bgColor=#ffffff>
                                	<TD style="CURSOR: pointer;" onclick="setImoticon('13');"><IMG src="/Date/project/ee/13.png"></TD>
                                	<TD style="CURSOR: pointer;" onclick="setImoticon('14');"><IMG src="/Date/project/ee/14.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('15');"><IMG src="/Date/project/ee/15.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('16');"><IMG src="/Date/project/ee/16.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('17');"><IMG src="/Date/project/ee/17.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('18');"><IMG src="/Date/project/ee/18.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('19');"><IMG src="/Date/project/ee/19.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('20');"><IMG src="/Date/project/ee/20.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('25');"><IMG src="/Date/project/ee/25.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('22');"><IMG src="/Date/project/ee/22.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('24');"><IMG src="/Date/project/ee/24.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImoticon('25');"><IMG src="/Date/project/ee/25.png"></TD>
                                </TR>
							</TABLE>
						</TD>
					</TR>
				</TABLE>
			</DIV>
		</TD>
	</TR>
</TABLE>
</form>
</body>
</html>