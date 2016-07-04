<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript">  
  function callAjax1(urlname){	  
      $.ajax({
	        type: "post",
	        url : urlname,
	        success: refresh1,	// 페이지요청 성공시 실행 함수
	        error: whenError21	//페이지요청 실패시 실행함수
   	});
  }
  function refresh1(aaa1){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
      $("#subMain").html(aaa1);
      
  }
  function whenError21(){
      alert("Error");
  } 
  
  function callContent(url,enumber,tab){ 
    	 $.ajax({    		
 	        type: "post", 	
 	        url : url+"?enumber="+enumber+"&tab="+tab,
 	        success: test,	// 페이지요청 성공시 실행 함수
 	        error: whenError	//페이지요청 실패시 실행함수
      	});    	 
    }

    function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $(".modal-bodyy").html(aaa);	//id가 ajaxReturn인 부분에 넣어라
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
	margin: 10px 10px 15px 0px;
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
			<a href="#" onclick="callAjax1('eventTeb.nhn?tab=1')">
			<img src="/Date/project/ing.png"
				onmouseover='this.src="/Date/project/ing1.png"'
				onmouseout='this.src="/Date/project/ing.png"' width="150"></a> 
		   <a href="#" onclick="callAjax1('upcoming_event.nhn?tab=2')">
		   <img src="/Date/project/upcoming.png"
				onmouseover='this.src="/Date/project/upcoming1.png"'
				onmouseout='this.src="/Date/project/upcoming.png"' width="150"></a>
			<a href="#" onclick="callAjax1('end_event.nhn?tab=3')"><img src="/Date/project/end.png"
				onmouseover='this.src="/Date/project/end1.png"'
				onmouseout='this.src="/Date/project/end.png"' width="150"></a>
			<a href="#" onclick="callAjax1('w_event.nhn?tab=4')"><img src="/Date/project/w.png"
				onmouseover='this.src="/Date/project/w1.png"'
				onmouseout='this.src="/Date/project/w.png"' width="150"></a>
		</center>
	</div>
	<br/><br/>
	<center>
			<c:if test="${tab==1}"><h2>진행 이벤트</h2><c:set var="urlname" value="eventTeb.nhn"/></c:if> 
			<c:if test="${tab==2}"><h2>예정 이벤트</h2><c:set var="urlname" value="upcoming_event.nhn"/></c:if> 
			<c:if test="${tab==3}"><h2>종료 이벤트</h2><c:set var="urlname" value="end_event.nhn"/></c:if> 
			<c:if test="${tab==4}"><h2>당첨자 이벤트</h2><c:set var="urlname" value="w_event.nhn"/></c:if> 
	</center>
    <div class="gallery">
			<ul>
				<c:set var="i" value="1" />
				<c:forEach var="eventList" items="${eventList}">
					<c:if test="${(i%3)!=0}">						
						<li>						
						<img src="${eventList.eimg}" onclick="callContent('eventContent.nhn',${eventList.enumber},${tab})" id="test" data-toggle="modal" data-target="#myModaly" alt="">${eventList.enumber}. ${eventList.ename}
							</li>
					</c:if>
					<c:if test="${(i%3)==0}">
						<li class="last"><img
								src="${eventList.eimg}" onclick="callContent('eventContent.nhn',${eventList.enumber},${tab})" id="test" data-toggle="modal" data-target="#myModaly" alt="">${eventList.enumber}. ${eventList.ename} 
							</li>
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
							<a href="#" onclick="callAjax1('${urlname}?pageNum=${startPage - 10 }')">[이전]</a>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<a href="#" onclick="callAjax1('${urlname}?pageNum=${i}')">[${i}]</a>
						</c:forEach>

						<c:if test="${endPage < pageCount}">
							<a href="#" onclick="callAjax1('${urlname}?pageNum=${startPage + 10 }')">[다음]</a>
						</c:if>
					</c:if></li>
			</ul>
	</div>
<!-- 모달 팝업 -->
	
	<div class="modal fade" id="myModaly" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-focus-on="input:first">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel"></h4>
	      </div>
	      <div class="modal-bodyy">		   
	      </div>
	      <div class="modal-footer">
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