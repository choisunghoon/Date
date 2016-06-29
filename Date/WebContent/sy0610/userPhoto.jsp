<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table border="1" colspadding="0" cellspacing="0" style="margin-left:200px;">
		<tr>	
			<td>
				제목 
			</td>
			<td>
				${ddb.subject }
			</td> 
		</tr>
		<tr>
    		<td>
    			이미지
    		</td>  
    		<td>
    			<img src="syimage/${ddb.img }">
			</td>    	
    	</tr>
    	<tr>
    		<td>
    			내용
    		</td>
    		<td>
    			<textarea name="content" theme="simple" cols="50" rows="10" >${ddb.content }</textarea>
			</td>
    	</tr>
    </table>

		
        