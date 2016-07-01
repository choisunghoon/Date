<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9be7455c7d33a4e2b750d3537e1179d8&libraries=services"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>


<script type="text/javascript">

     function HereAjax(nhn,regdate,i){
        $.ajax({
	        type: "post",
	        url : nhn,
	        data : {
	        	regdate1 : regdate
	        },
	        success: function(aaa){
	        	$("#here"+i).html(aaa);
	        },	// ��������û ������ ���� �Լ�
	        error: whenError2	//��������û ���н� �����Լ�
     	});
    }
    
    function whenError2(){
        alert("Error");
    }
  </script>
<table border="1" colspadding="0" cellspacing="0" width="500px" style="margin-left:185px;">
		<tr>	
			<td>
				��û��¥
			</td>
			<td>
				����� ��û ����
			</td> 
			<td>
				���뺸��
			</td>
		</tr>
		<c:set var="i" value="1"/>
		<c:set var="igk" value="0"/> 
    	<c:forEach var="photo" items="${photo}">
		<tr>
    		<td>
    			<fmt:formatDate value="${photo.regdate }" pattern="YYYY-MM-dd HH:mm" />
    		</td>  
    		<td>
				${photo.state }
			</td> 
			<!--    
			<td>
				<a href="#" onclick="callContent5('photocheckcontent.nhn','${photo.regdate}')">Ȯ��</a>
			</td>
			 -->
			 <td>
			 	<a href="#" onclick="">Ȯ��</a>
			 </td>	
    	</tr>
    	
			
			<c:forTokens items="${photo.img}" delims="," var="photo">
				<tr><td colspan="3"><img src="syimage/${photo}"></td></tr>
				<c:forTokens items="${photo.content}" begin="${igk}" end="${igk}" delims="," var="content"><tr><td colspan="3">${content}</td></tr></c:forTokens>
				<c:forTokens items="${photo.writeday}" begin="${igk}" end="${igk}" delims="," var="writeday"><tr><td colspan="3">${writeday }</td></tr></c:forTokens>
				<c:set var="igk" value="${igk+1}" />
				<tr><td>${igk}</td></tr>
			</c:forTokens>
				<c:set var="igk" value="0" />
		
	</c:forEach>
</table>