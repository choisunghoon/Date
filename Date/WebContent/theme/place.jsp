<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript">  
    function callContent(ctg_num, cos_num, loc_num ){    
    	 $.ajax({    		
 	        type: "post", 	 
 	        url : "placeView.nhn?ctg_num="+ctg_num+"&cos_num="+cos_num+"&loc_num="+loc_num,
 	        success: test,	// 페이지요청 성공시 실행 함수
 	        error: whenError	//페이지요청 실패시 실행함수
      	});
    }
    function callContent1(ctg_num, cos_num){    
    	 $.ajax({    		
    	 	 type: "post", 	 
    	 	 url : "addPlace.nhn?ctg_num="+ctg_num+"&cos_num="+cos_num,
    	 	 success: test,	// 페이지요청 성공시 실행 함수
    	 	 error: whenError	//페이지요청 실패시 실행함수
    	 });

    	 document.getElementById("enumber2").value=enumber;
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
	width: 340px;
	height: 430px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>

<input type="button" value="장소 추가" align="center" onclick="callContent1(${ctg_num},${cos_num})" id="test" data-toggle="modal" data-target="#myModal">
<input type="button" value="카테고리로" align="center" onclick="document.location.href='addCtgView.nhn'">
<input type="button" value="코스로" align="center" onclick="document.location.href='course.nhn?ctg_num=${ctg_num}'">

</br>
		<center><h2>${dto1.cos_name}</h2><center>
	
	<table border="1" width="500" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td align="center" width="500">지도 img 입력</td>
			<td align="center" width="500"><img src="theme/${dto1.cos_img}" alt=""></td>
		</tr>
		<tr>
			<td align="center" width="100">한줄평</td>
			<td align="center">${dto1.content}</td>
		</tr>
		<input type="hidden" name="ctg_num" value="${ctg_num}" />
		<input type="hidden" name="cos_num" value="${cos_num}" />
	</table>
</br>
</br>


    <div class="gallery">
			<ul>
				<c:set var="i" value="1" />
				<c:forEach var="placeList" items="${placeList}">
					<c:if test="${(i%3)!=0}">						
						<li>
						<h2><center>코스${placeList.step_num}</center></h2>					
						<img src="theme/${placeList.loc_pic}" onclick="callContent(${placeList.ctg_num},${placeList.cos_num},${placeList.loc_num})" id="test" data-toggle="modal" data-target="#myModal" alt="">
							</li>
					</c:if>
					<c:if test="${(i%3)==0}">
						<li class="last">
						<h2><center>코스${placeList.step_num}</center></h2>
						<img src="theme/${placeList.loc_pic}" onclick="callContent(${placeList.ctg_num},${placeList.cos_num},${placeList.loc_num})" id="test" data-toggle="modal" data-target="#myModal" alt="">
							</li>
					</c:if>
					<c:set var="i" value="${i+1}" />
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
</html>