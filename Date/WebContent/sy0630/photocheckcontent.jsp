<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table border="1" colspadding="0" cellspacing="0" width="500px">
		<tr>
    		<td>
    			��û��¥
    		</td>  
    		<td>
    			<fmt:formatDate value="${pdb.regdate }" pattern="YYYY-MM-dd HH:mm" />
			</td>    	
    	</tr>

    	<c:forEach var="aa" items="${aa}">
	    	<tr>
	    		<td>
	    			����
	    		</td>
	    		<td>
	    		<img src="syimage/${aa.img }">
				</td>
	    	</tr>
	    	<tr>
	    		<td>
	    			�ۼ���¥
	    		</td>
	    		<td>
	    			${aa.writeday }
				</td>
	    	</tr>
	    	<tr>
	    		<td>
	    			����
	    		</td>
	    		<td>
	    			${aa.content }
				</td>
	    	</tr>
    	</c:forEach>

    </table>
    <a href="#"onclick="callContent4('photocheck.nhn')">�ݱ�</a>