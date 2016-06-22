<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.image {

 position:relative;
 
 float:left; /* optional */

}

.image .text {

 position:absolute;

 top:40px; /* in conjunction with left property, decides the text position */



 width:300px; /* optional, though better have one */

}




</style>
<script>
	function callMap(num){
		$.ajax({
			type : "post" ,
			data : {
				num : num
			},
			url : "datePlan.nhn",
			success : cossuc,
			error : coserr
		})
		
	}
	function cossuc(cos){
		$("#cos").html(cos);
	}
	function coserr(){
		alert("Error");
	}
	
</script>

<div id="cos">
<c:forEach var="cosList" items="${cosList}">
	<a href="#" onclick="callMap(${cosList.num})" >${cosList.subject}</a>
</c:forEach>

</div>
<div class="image">

    <img alt="" src="dateplan/test.png" style="width:300px;height:200px" />

      <div class="text">

       <center><h3>텍스트를 입력해 주세요.asdfasdfasdfsasdfsdfsdfsdfsdfdfsgdfsggdsfdfgdddgdddfssdfdf</h3></center>
   </div>

</div>