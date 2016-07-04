<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9be7455c7d33a4e2b750d3537e1179d8&libraries=services"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>


<script type="text/javascript">

     function HereAjax(nhn,regdate){
        $.ajax({
	        type: "post",
	        url : nhn,
	        data : {
	        	regdate1 : regdate
	        },
	        success: refresh,
	        error: whenError2	//페이지요청 실패시 실행함수
     	});
    }
     function refresh(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
     	$("#subMain").html(aaa);    	
     }  
    function whenError2(){
        alert("Error");
    }
  </script>
<table border="1" colspadding="0" cellspacing="0" width="500px" style="margin-left:185px;">
		<tr>	
			<td>
				신청날짜
			</td>
			<td>
				포토북 신청 상태
			</td> 
			<td>
				내용보기
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
			<td>
				<a href="#" onclick="callContent5('photocheckcontent.nhn','${photo.regdate}')">확인</a>
			</td>
		
	</c:forEach>
</table>