<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 
<script language="JavaScript">
	function checkIt(){
		var addLoc = eval("document.addLoc");
		
		if(addLoc.count.value > 2){
			alert("���� �ڽ� �Է��� �Ұ����մϴ�");
			return false;
		}
	}
</script> 

 
 
<form method="post" name="addLoc" action="addPlacePro.nhn" ENCTYPE="multipart/form-data" onsubmit="return checkIt()">
   <table width="500" border="1" cellspacing="0" cellpadding="3" align="center">
  	<input type="hidden" name="ctg_num" value="${ctg_num}" />
	<input type="hidden" name="cos_num" value="${cos_num}" />
	<input type="hidden" name="count" value="${count}" />
    				<tr height="30">
    					<td align="center" colspan="2"> �ڽ� �Է� </td>
    				</tr>
    				<tr>
    					<td align="center" width="50">step</td>
    					<td aling="center"><select name="step_num"><option>1</option><option>2</option>
							<option>3</option></select>
						</td>
					</tr>
    				<tr>
						<td align="center" width="50">�ڽ� �̸�</td>
						<td align="center"><input type="text" name="loc_name"></td>
					</tr>
					<tr>
						<td align="center" width="50">������</td>
						<td align="center"><textarea rows="5" cols="40" name="loc_content"></textarea></td>
					</tr>
					<tr>
						<td align="center" width="50">�� ��</td>
						<td align="center"><select name="rate"><option>1</option><option>2</option>
							<option>3</option><option>4</option><option>5</option></select></select>
					</td>
    				<tr height="30">
    					<td align="center" width="50">��һ���</td>
						<td align="center" width="700"><input type="file" name="pho"></td>
					</tr>
					<tr height="30">
    					<td align="center" width="50">��һ���</td>
						<td align="center" width="700"><input type="file" name="pho1"></td>
					</tr>
				</table>
		<center><input type="submit" value="���"></center>
	</form>