<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/sy0526/topmenu.jsp" %>
<html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript">  
  	function callContent(ctg_num){    
 	 $.ajax({    		
 	 	 type: "post", 	 
 	 	 url : "addCtg.nhn?ctg_num="+ctg_num,
 	 	 success: test,	// 페이지요청 성공시 실행 함수
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
<style type="text/css">
.gallery{display :block; width :100%; line-height :1.6em;}
.gallery ul{margin :0; padding :0; list-style :none;}
.gallery li{display :inline; float :left; width :350px; margin :35px 5px 5px 35px; padding :0;}
.gallery li.last{margin-right :0;}
.gallery li img{display : block; width : 340px; height : 300px;}

</style>
</head>
<body>
<div id=divMenu style="top:0px; left:0px; visibility: visible; width: 140px; position: absolute;"> 
<c:if test="${id == 'admin'}">
<input type="button" value="카테고리 추가" align="center" onclick="callContent(${ctg_num})" id="test" data-toggle="modal" data-target="#myModal">
</c:if>
</div>


<div class="gallery"> 
  <ul>
    <c:set var="i" value="1"/>
    <c:forEach var="ctgList" items="${ctgList}">  
     <c:if test="${(i%3)!=0}">
      <li><a href="course.nhn?ctg_num=${ctgList.ctg_num}"><img src="${ctgList.ctg_img}"></a><center>${ctgList.ctg_name}</center></li>
     </c:if>
     <c:if test="${(i%3)==0}">
      <li class="last"><a href="course.nhn?ctg_num=${ctgList.ctg_num}"><img src="${ctgList.ctg_img}"></a><center>${ctgList.ctg_name}</center></li>
     </c:if>
     <c:set var="i" value="${i+1}"/>
    </c:forEach>
   <li class="page"><center><c:if test="${count > 0}">
   		<c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1)}" />
   		<c:set var="pageBlock" value="${6}" />
   		<fmt:parseNumber var="result" value="${currentPage / 6}" integerOnly="true" />
   		<c:set var="startPage" value="${result * 6 + 1}" />
   		<c:set var="endPage" value="${startPage + pageBlock-1}" />
   		<c:if test="${endPage > pageCount}">
   			<c:set var="endPage" value="${pageCount}" />
   		</c:if>
   			
   		<c:if test="${startPage > 6}">
   			<a href="addCtgView.nhn?pageNum=${startPage - 6}">[이전]</a>
   		</c:if>
   		
   		<c:forEach var="i" begin="${startPage}" end="${endPage}">
   			<a href="addCtgView.nhn?pageNum=${i}">[${i}]</a>
   		</c:forEach>
   		
   		<c:if test="${endPage < pageCount}">
   			<a href="addCtgView.nhn?pageNum=${startPage + 6}">[다음]</a>
   		</c:if>
   		</c:if></center></li>
  </ul>
</div> 

<!-- 모달 팝업 -->
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-focus-on="input:first">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">닫기</span></button>
		<h4 class="modal-title" id="myModalLabel">카테고리 추가</h4>
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
<SCRIPT LANGUAGE=JAVASCRIPT> 
<!-- 

    var isDOM = (document.getElementById ? true : false); 
    var isIE4 = ((document.all && !isDOM) ? true : false); 
    var isNS4 = (document.layers ? true : false); 
     
    function getRef(id) { 
            if (isDOM) return document.getElementById(id); 
            if (isIE4) return document.all[id]; 
            if (isNS4) return document.layers[id]; 
    } 
     
    var isNS = navigator.appName == "Netscape"; 
    function moveRightEdge() { 
            var yMenuFrom, yMenuTo, yOffset, timeoutNextCheck; 
            if (isNS4) { 
                    yMenuFrom   = divMenu.top; 
                    yMenuTo     = windows.pageYOffset +10 ;   // 위쪽 위치 
            } else if (isDOM) { 
                    yMenuFrom   = parseInt (divMenu.style.top, 10); 
                    yMenuTo     = (isNS ? window.pageYOffset : document.body.scrollTop) +10; // 위쪽 위치 
            } 
            timeoutNextCheck = 500; 
            if (yMenuFrom != yMenuTo) { 
                    yOffset = Math.ceil(Math.abs(yMenuTo - yMenuFrom) / 20); 
                    if (yMenuTo < yMenuFrom) 
                            yOffset = -yOffset; 
                    if (isNS4) 
                            divMenu.top += yOffset; 
                    else if (isDOM) 
                            divMenu.style.top = parseInt (divMenu.style.top, 10) + yOffset; 
                            timeoutNextCheck = 10; 
            } 
            setTimeout ("moveRightEdge()", timeoutNextCheck); 
    } 
     
    if (isNS4) { 
            var divMenu = document["divMenu"]; 
            divMenu.top = top.pageYOffset +10; 
            divMenu.visibility = "visible"; 
            moveRightEdge(); 
    } else if (isDOM) { 
            var divMenu = getRef('divMenu'); 
            divMenu.style.top = (isNS ? window.pageYOffset : document.body.scrollTop) +10; 
            divMenu.style.visibility = "visible"; 
            moveRightEdge(); 
    } 

//--> 
</SCRIPT> 
