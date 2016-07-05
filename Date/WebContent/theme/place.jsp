<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/sy0526/topmenu.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript">  
 	 function callAjax(ctg_num,cos_num,checkNum){
 		 $.ajax({
 			 type:"post",
 			 url:"likeCount.nhn",
 			 data:{
 				 ctg_num : ctg_num,
 				 cos_num : cos_num,
 				 checkNum : checkNum
 			 }, 
 			 success: test2,
 			 error: whenError
 		 });
 	 }
 	 function test2(aaa){
 		 $("#ajaxReturn").html(aaa);
 	 }
    function callContent(ctg_num, cos_num, loc_num ){    
    	 $.ajax({    		
 	        type: "post", 	 
 	        url : "placeView.nhn?ctg_num="+ctg_num+"&cos_num="+cos_num+"&loc_num="+loc_num,
 	        success: test,	// 페이지요청 성공시 실행 함수
 	        error: whenError	//페이지요청 실패시 실행함수
      	});
    	 document.getElementById("loc_num").value=loc_num;
    	 document.getElementById("ctg_num").value=ctg_num;
    	 document.getElementById("cos_num").value=cos_num;
    	 
    }
    function callContent1(ctg_num, cos_num){    
    	 $.ajax({    		
    	 	 type: "post", 	 
    	 	 url : "addPlace.nhn?ctg_num="+ctg_num+"&cos_num="+cos_num,
    	 	 success: test,	// 페이지요청 성공시 실행 함수
    	 	 error: whenError	//페이지요청 실패시 실행함수
    	 });
    }
    function callContent2(ctg_num, cos_num){    
   	 $.ajax({    		
   	 	 type: "post", 	 
   	 	 url : "courseModify.nhn?ctg_num="+ctg_num+"&cos_num="+cos_num,
   	 	 success: test,	// 페이지요청 성공시 실행 함수
   	 	 error: whenError	//페이지요청 실패시 실행함수
   	 });

   }
    function callContent3(ctg_num, cos_num){    
      	 $.ajax({    		
      	 	 type: "post", 	 
      	 	 url : "cosDel.nhn?ctg_num="+ctg_num+"&cos_num="+cos_num,
      	 	 success: test,	// 페이지요청 성공시 실행 함수
      	 	 error: whenError	//페이지요청 실패시 실행함수
      	 });

      }
    function callAddApp(){    	
   	 $.ajax({
	        type: "post", 	        
	        url : "placeModify.nhn?loc_num="+document.getElementById("loc_num").value + "&ctg_num="+ document.getElementById("ctg_num").value + "&cos_num=" + document.getElementById("cos_num").value,
	        success: test1,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
     	});
   	}
    function callAddApp1(){    	
      	 $.ajax({
   	        type: "post", 	        
   	        url : "placeDel.nhn?loc_num="+document.getElementById("loc_num").value + "&ctg_num="+ document.getElementById("ctg_num").value + "&cos_num=" + document.getElementById("cos_num").value,
   	        success: test1,	// 페이지요청 성공시 실행 함수
   	        error: whenError	//페이지요청 실패시 실행함수
        	});
      }
    function callAddApp2(){    	
     	 $.ajax({
  	        type: "post", 	        
  	        url : "placeReply.nhn?loc_num="+document.getElementById("loc_num").value + "&ctg_num="+ document.getElementById("ctg_num").value + "&cos_num=" + document.getElementById("cos_num").value,
  	        success: test1,	// 페이지요청 성공시 실행 함수
  	        error: whenError	//페이지요청 실패시 실행함수
       	});
     }
    function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $(".modal-body").html(aaa);	//id가 ajaxReturn인 부분에 넣어라
    }
    function test1(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $(".modal-body1").html(aaa);	//id가 ajaxReturn인 부분에 넣어라
    }
    
    function whenError(){
        alert("Error");
    }
  </script>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<style>

.gallery {
	display: block;
	width: 100%;
	line-height: 1.6em;
	margin-left: 70px;
}

.gallery ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

.gallery li {
	display: block;
	float: left;
	width: 350px;
	margin: 35px 5px 5px 35px;
	padding: 0;
}

.gallery li.last {
	margin-right: 0;
}
.gallery li.page {
	margin-left: 45%;
}

.gallery li img {
	display: block;
	width: 100%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<c:if test="${id == 'admin'}">
<a href="#"  onclick="callContent3(${ctg_num},${cos_num})" id="test" data-toggle="modal" data-target="#myModal"><img src="button/z20.png"></a>
<a href="#"  onclick="callContent2(${ctg_num},${cos_num})" id="test" data-toggle="modal" data-target="#myModal"><img src="button/z22.png"></a>
<c:if test="${placeCount <= 2}">
<a href="#"  onclick="callContent1(${ctg_num},${cos_num})" id="test" data-toggle="modal" data-target="#myModal"><img src="button/z23.png"></a>
</c:if>
</c:if>
<a href="#"  onclick="document.location.href='addCtgView.nhn'"><img src="button/z18.png"></a>
<a href="#"  onclick="document.location.href='course.nhn?ctg_num=${ctg_num}'"><img src="button/z10.png"></a>

</br>
		<center><h2>${dto1.cos_name}</h2></center>
	
	<table border="0" width="500" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td align="center" width="500">${dto.cos_img}<img src="theme/themeimg/${dto1.cos_img}" alt=""></td>
		</tr>
	</table>
	</br>
	<table border="0" width="700" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td align="center"><b>에디터 한마디:</b></td>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td align="center"><b>${dto1.content}</b></td>
		</tr>
	</table>
	</br>
	<table border="1" width="300" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td align="center" height="20"><b>조회수</b></td>
			<td align="center" height="20"><b>좋아요</b></td>
		</tr>
		<tr>
			<td align="center" height="50">${dto1.readCount}</td>
			<td align="center" height="50">${dto1.likeCount}</td>
		</tr>
		<input type="hidden" name="ctg_num" value="${ctg_num}" />
		<input type="hidden" name="cos_num" value="${cos_num}" />
		<input type="hidden" name="checkNum" value="${checkNum}"/>
	</table>
	<br/>
	<br/>
	<center>
<c:if test="${id != null}">
<c:if test="${id != 'null' and checkNum != 1}">
	<div id="like"  method="post">
		<span id="ajaxReturn"><a href="#" onclick="callAjax(${ctg_num},${cos_num},${checkNum})"><img src="button/z31.png"></a>${dto.likeCount}</span>
	</div>
</c:if>
<c:if test="${id != 'null' and checkNum == 1}">
	<div id="like"  method="post">
		<span id="ajaxReturn"><a href="#" onclick="callAjax(${ctg_num},${cos_num},${checkNum})"><img src="button/z32.png"></a>${dto.likeCount}</span>
	</div>
</c:if>
</c:if>
	</center>
</br>
</center>
    <div class="gallery">
			<ul>
				<c:set var="i" value="1" />
				<c:forEach var="placeList" items="${placeList}">
					<c:if test="${(i%3)!=0}">						
						<li>
						<h2><center>코스${placeList.step_num}</center></h2>					
						<img src="theme/themeimg/${placeList.loc_pic}" onclick="callContent(${placeList.ctg_num},${placeList.cos_num},${placeList.loc_num})" id="test" data-toggle="modal" data-target="#myModal1" alt="">
							</li>
					</c:if>
					<c:if test="${(i%3)==0}">
						<li class="last">
						<h2><center>코스${placeList.step_num}</center></h2>
						<img src="theme/themeimg/${placeList.loc_pic}" onclick="callContent(${placeList.ctg_num},${placeList.cos_num},${placeList.loc_num})" id="test" data-toggle="modal" data-target="#myModal1" alt="">
							</li>
					</c:if>
					<c:set var="i" value="${i+1}" />
				</c:forEach>
			</ul>
	</div>
		<br/>
		<br/>

<!-- 모달 팝업 -->
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-focus-on="input:first">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">닫기</span></button>
		<h4 class="modal-title" id="myModalLabel">Modal titlezzz</h4>
	      </div>
	      <div class="modal-body">
		   
	      </div>
	      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
		<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-focus-on="input:first">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">닫기</span></button>
		<h4 class="modal-title" id="myModalLabel">장소 상세 정보</h4>
	      </div>
	      <div class="modal-body">
		   
	      </div>
	      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		<c:if test="${id == 'admin'}">
		<button type="button" class="btn btn-default" data-toggle="modal" href="#appModal" onclick="callAddApp()">정보 수정</button>
		<button type="button" class="btn btn-default" data-toggle="modal" href="#app1Modal" onclick="callAddApp1()">장소 삭제</button>
		</c:if>
		<input type="hidden" value="" id="loc_num" />
		<input type="hidden" value="" id="ctg_num" />
		<input type="hidden" value="" id="cos_num" />
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="appModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-focus-on="input:first">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">장소 수정</h4>
	      </div>
	      <div class="modal-body1">	 
	      </div>
	      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
		<div class="modal fade" id="app1Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-focus-on="input:first">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">장소 삭제</h4>
	      </div>
	      <div class="modal-body1">	 
	      </div>
	      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->	
</body>
</html>