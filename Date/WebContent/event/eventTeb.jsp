<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript">  
    function callContent(enumber){    
    	 $.ajax({    		
 	        type: "post", 	 
 	        url : "eventContent.nhn?enumber="+enumber,
 	        success: test,	// 페이지요청 성공시 실행 함수
 	        error: whenError	//페이지요청 실패시 실행함수
      	});
    	 document.getElementById("enumber2").value=enumber;
    }
    function callAddApp(){    	
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
	<div class="tabpage" style="border-bottom: 1px solid;">
		<center>
			<a href="eventTeb.nhn?tab=${1}"><img src="/Spring/project/ing.png"
				onmouseover='this.src="/Spring/project/ing1.png"'
				onmouseout='this.src="/Spring/project/ing.png"' width="150"></a> 
		    <a href="upcoming_event.nhn?tab=${2}"><img src="/Spring/project/upcoming.png"
				onmouseover='this.src="/Spring/project/upcoming1.png"'
				onmouseout='this.src="/Spring/project/upcoming.png"' width="150"></a>
			<a href="end_event.nhn?tab=${3}"><img src="/Spring/project/end.png"
				onmouseover='this.src="/Spring/project/end1.png"'
				onmouseout='this.src="/Spring/project/end.png"' width="150"></a>
			<a href="eventTeb.nhn?tab=${4}"><img src="/Spring/project/w.png"
				onmouseover='this.src="/Spring/project/w1.png"'
				onmouseout='this.src="/Spring/project/w.png"' width="150"></a>
		</center>
	</div>
	<br/><br/>
	<center>
			<c:if test="${tab==1}"><h2>진행 이벤트</h2></c:if> 
			<c:if test="${tab==2}"><h2>예정 이벤트</h2></c:if> 
			<c:if test="${tab==3}"><h2>종료 이벤트</h2></c:if> 
			<c:if test="${tab==4}"><h2>당첨자 이벤트</h2></c:if> 
	</center>
    <div class="gallery">
			<ul>
				<c:set var="i" value="1" />
				<c:forEach var="eventList" items="${eventList}">
					<c:if test="${(i%3)!=0}">						
						<li>						
						<img src="${eventList.eimg}" onclick="callContent(${eventList.enumber})" id="test" data-toggle="modal" data-target="#myModal" alt="">${eventList.ename}
							카운트:${count} i:${i}</li>
					</c:if>
					<c:if test="${(i%3)==0}">
						<li class="last"><a href="eventContent.nhn"><img
								src="${eventList.eimg}" alt=""></a>${eventList.ename}
							카운트:${count} i:${i}</li>
					</c:if>
					<c:set var="i" value="${i+1}" />
				</c:forEach>
				<li class="page"><c:if test="${count > 0}">
						<c:set var="pageCount"
							value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
						<c:set var="pageBlock" value="${10}" />
						<fmt:parseNumber var="result" value="${currentPage / 10}"
							integerOnly="true" />
						<c:set var="startPage" value="${result * 10 + 1}" />
						<c:set var="endPage" value="${startPage + pageBlock-1}" />
						<c:if test="${endPage > pageCount}">
							<c:set var="endPage" value="${pageCount}" />
						</c:if>

						<c:if test="${startPage > 10}">
							<a href="eventTeb.nhn?pageNum=${startPage - 10 }">[이전]</a>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<a href="eventTeb.nhn?pageNum=${i}">[${i}]</a>
						</c:forEach>

						<c:if test="${endPage < pageCount}">
							<a href="eventTeb.nhn?pageNum=${startPage + 10}">[다음]</a>
						</c:if>
					</c:if></li>
			</ul>
	</div>
<!-- 모달 팝업 -->
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-focus-on="input:first">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">이벤트 상세 정보</h4>
	      </div>
	      <div class="modal-body">		   
	      </div>
	      <div class="modal-footer">
		 <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		 <button type="button" class="btn btn-default" data-toggle="modal" href="#appModal" onclick="callAddApp()">이벤트 참여하기</button>
		 <input type="hidden" value="" id="enumber2" />
	      </div>
	    </div>
	  </div>
	</div>
	
		<div class="modal fade" id="appModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-focus-on="input:first">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">이벤트 참여 작성</h4>
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