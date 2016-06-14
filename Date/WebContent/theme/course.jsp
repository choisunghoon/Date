<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/sy0526/topmenu.jsp" %>
<html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <script type="text/javascript">  
    function callContent(ctg_num){    
    	 $.ajax({    		
 	        type: "post", 	 
 	        url : "ctgDel.nhn?ctg_num="+ctg_num,
 	        success: test,	// 페이지요청 성공시 실행 함수
 	        error: whenError	//페이지요청 실패시 실행함수
      	});
    }
    function callContent1(ctg_num){    
   	 $.ajax({    		
	        type: "post", 	 
	        url : "ctgModify.nhn?ctg_num="+ctg_num,
	        success: test,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
     	});
   	}
    function callContent2(ctg_num){    
      	 $.ajax({    		
   	        type: "post", 	 
   	        url : "addCourse.nhn?ctg_num="+ctg_num,
   	        success: test,	// 페이지요청 성공시 실행 함수
   	        error: whenError	//페이지요청 실패시 실행함수
        	});
    }
    function callApp(){    	
   	 $.ajax({
   		//data : {"enumber" : enumber},
	        type: "post", 	        
	        url : "addApp.nhn?enumber="+document.getElementById("enumber2").value,
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
.gallery{display :block; width :100%; line-height :1.6em;}
.gallery ul{margin :0; padding :0; list-style :none;}
.gallery li{display :block; float :left; width :350px; margin :35px 5px 5px 35px; padding :0;}
.gallery li.last{margin-right :0;}
.gallery li img{display : block; width : 340px; height : 430px;}
</style>
</head>
<body>

<div class="gallery"> 
  <ul>
    <c:set var="i" value="1"/>
    <c:forEach var="courseList" items="${courseList}">  
     <c:if test="${(i%3)!=0}">
      <li><a href="place.nhn?ctg_num=${ctg_num}&cos_num=${courseList.cos_num}"><img src="${courseList.cos_img}" alt=""></a>${courseList.cos_name} 카운트:${count} i:${i}</li>
     </c:if>
     <c:if test="${(i%3)==0}">
      <li class="last"><a href="place.nhn?ctg_num=${ctg_num}&cos_num=${courseList.cos_num}"><img src="${courseList.cos_img}" alt=""></a>${courseList.cos_img} 카운트:${count} i:${i}</li>
     </c:if>
     <c:set var="i" value="${i+1}"/>
    </c:forEach>
  </ul>
</div>  

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
	

	

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js --> 

</body>
<c:if test="${id == 'admin'}">
<input type="button" value="카테고리 수정" align="center" onclick="callContent1(${ctg_num})" id="test" data-toggle="modal" data-target="#myModal">
<input type="button" value="카테고리 삭제" align="center" onclick="callContent(${ctg_num})" id="test" data-toggle="modal" data-target="#myModal">
<input type="button" value="코스 추가" align="center" onclick="callContent2(${ctg_num})" id="test" data-toggle="modal" data-target="#myModal">
</c:if>
<input type="button" value="카테고리로" align="center" onclick="document.location.href='addCtgView.nhn'">