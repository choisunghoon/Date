<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 
                <table width="500" border="1" cellspacing="0" cellpadding="3" align="center">
    				<tr height="30">
    					<td align="center" colspan="2"> �ڽ� 1 �Է� </td>
    				</tr>
    				<tr>
						<td align="center" width="50">�ڽ� �̸�</td>
						<td align="center">${dto.loc_name}</td>
					</tr>
					<tr>
						<td align="center" width="50">������</td>
						<td align="center">${dto.loc_content}</textarea></td>
					</tr>
					<tr>
						<td align="center" width="50">�� ��</td>
						<td align="center">${dto.rate}
					</td>
    				<tr height="30">
    					<td align="center" width="50">��һ���</td>
						<td align="center" width="700"><img src="theme/${dto.loc_pic}" alt=""></td>
					</tr>
					<tr height="30">
    					<td align="center" width="50">��һ���</td>
						<td align="center" width="700"><img src="theme/${dto.loc_pic1}" alt=""></td>
					</tr>
				</table>