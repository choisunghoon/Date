<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 
<table>
	couplename  : ${pdb.couplename }<br/>
	��û��¥	: <fmt:formatDate value="${pdb.regdate }" pattern="YYYY-MM-dd" /><br/>
	
	<c:forEach var="admin" items="${admin }">
		
		<img src="${admin.img }">
		${admin.writeday }
		${admin.content }
	
	</c:forEach>
	<input type="button" onclick="">Ȯ��</button>
</table>
 -->
<table border="1" colspadding="0" cellspacing="0" width="500px" style="margin-left:180px;">
		<tr>	
			<td>
				couplename
			</td>
			<td>
				${pdb.couplename }
			</td> 
		</tr>
		<tr>
    		<td>
    			��û��¥
    		</td>  
    		<td>
    			<fmt:formatDate value="${pdb.regdate }" pattern="YYYY-MM-dd" />
			</td>    	
    	</tr>
    	<c:forEach var="admin" items="${admin }">
    	<tr>
    		<td>
    			����
    		</td>
    		<td>
    			<img src="${admin.img }">
			</td>
    	</tr>
    	<tr>
    		<td>
    			�ۼ���¥
    		</td>
    		<td>
    			${admin.writeday }
			</td>
    	</tr>
    	<tr>
    		<td>
    			����
    		</td>
    		<td>
    			${admin.content }
			</td>
    	</tr>
    	</c:forEach>
    </table>
  
