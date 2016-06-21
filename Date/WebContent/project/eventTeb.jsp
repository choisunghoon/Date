<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript">  
    function callContent(url,enumber,tab){    
    	 $.ajax({    		
 	        type: "post", 	
 	        url : url+"?enumber="+enumber+"&tab="+tab,
 	        success: test,	// ��������û ������ ���� �Լ�
 	        error: whenError	//��������û ���н� �����Լ�
      	});    	 
    }

    function test(aaa){	// ��û������ ������������ aaa ������ �ݹ�ȴ�. 
        $(".modal-body").html(aaa);	//id�� ajaxReturn�� �κп� �־��
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
			<a href="w_event.nhn?tab=${4}"><img src="/Spring/project/w.png"
				onmouseover='this.src="/Spring/project/w1.png"'
				onmouseout='this.src="/Spring/project/w.png"' width="150"></a>
		</center>
	</div>
	<br/><br/>
	<center>
			<c:if test="${tab==1}"><h2>���� �̺�Ʈ</h2><c:set var="urlname" value="eventTeb.nhn"/></c:if> 
			<c:if test="${tab==2}"><h2>���� �̺�Ʈ</h2><c:set var="urlname" value="upcoming_event.nhn"/></c:if> 
			<c:if test="${tab==3}"><h2>���� �̺�Ʈ</h2><c:set var="urlname" value="end_event.nhn"/></c:if> 
			<c:if test="${tab==4}"><h2>��÷�� �̺�Ʈ</h2><c:set var="urlname" value="w_event.nhn"/></c:if> 
	</center>
    <div class="gallery">
			<ul>
				<c:set var="i" value="1" />
				<c:forEach var="eventList" items="${eventList}">
					<c:if test="${(i%3)!=0}">						
						<li>						
						<img src="${eventList.eimg}" onclick="callContent('eventContent.nhn',${eventList.enumber},${tab})" id="test" data-toggle="modal" data-target="#myModal" alt="">${eventList.ename}
							ī��Ʈ:${count} i:${i}</li>
					</c:if>
					<c:if test="${(i%3)==0}">
						<li class="last"><a href="eventContent.nhn"><img
								src="${eventList.eimg}" alt=""></a>${eventList.ename}
							ī��Ʈ:${count} i:${i}</li>
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
							<a href="${urlname}?pageNum=${startPage - 10 }">[����]</a>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<a href="${urlname}?pageNum=${i}">[${i}]</a>
						</c:forEach>

						<c:if test="${endPage < pageCount}">
							<a href="${urlname}?pageNum=${startPage + 10}">[����]</a>
						</c:if>
					</c:if></li>
			</ul>
	</div>
<!-- ��� �˾� -->
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-focus-on="input:first">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">��</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel"></h4>
	      </div>
	      <div class="modal-body">		   
	      </div>
	      <div class="modal-footer">
			<center><button type="button" class="btn btn-default" data-dismiss="modal" >�ݱ�</button></center>
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