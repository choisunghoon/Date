<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript">  
 function callAjax1(ctg_num,cos_num,checkNum){
 		 $.ajax({
 			 type:"post",
 			 url:"likeCount.nhn",
 			 data:{
 				 ctg_num : ctg_num,
 				 cos_num : cos_num,
 				 checkNum : checkNum
 			 }, 
 			 success: test29,
 			 error: whenError
 		 });
 	 }
 	 function test29(aaaa){
 		 $("#ajaxReturn").html(aaaa);
 	 }
 </script>
 
<body>
		<span>
		<c:if test="${checkNum eq 1}"><a href="#" onclick="callAjax1(${ctg_num},${cos_num},${checkNum})"><img src="button/z31.png" alt="" style="margin-top:5px;"></a></c:if>
		<c:if test="${checkNum ne 1}"><a href="#" onclick="callAjax1(${ctg_num},${cos_num},${checkNum})"><img src="button/z32.png" alt="" style="margin-top:5px;"></a></c:if>
		</span><br/>
</body>
