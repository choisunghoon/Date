<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.image {

 position:relative;
 margin-left:10px;
 margin-bottom:10px;
 float:left; /* optional */

}
.image .checkbox{
	position:absolute;
	margin-left:30px;
	margin-top:20px;
	width:100;
}
.image .text {

 position:absolute;

 top:40px; /* in conjunction with left property, decides the text position */

 width:250px; /* optional, though better have one */

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

<form method="post" action="cosdel.nhn">
<div id="cos">
<input type="submit" value="삭제" /> 
<c:forEach var="cosList" items="${cosList}">
<div class="image">
		
		<div id="checkbox">
	  		<input style="width: 20px;height: 20px;" type="checkbox" name="num" value="${cosList.num}">
	  	</div>
	  	
    <a href="#" onclick="callMap(${cosList.num})" >
    	<img alt="" src="syimage/123.png" style="width:250px;height:150px" />
    </a>
    	
      <div class="text">
      	

       <center>
       		<font size="6">
       			<a href="#" onclick="callMap(${cosList.num})" >${cosList.subject}</a>
      	    </font>
       </center>
      </div>
	
</div>
</c:forEach>
</div>
</form>