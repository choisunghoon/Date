<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">    
    function callContent7(url,regdate,couplename){ 
   	 $.ajax({    		
	        type: "post", 	
	        url : url,
	        data : {
	        	regdate1 : regdate,
	        	couplename1 : couplename
	        },	
	        success: test,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
     	});    	 
   }

   function test(aaab){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
       $(".modal-bodyy7").html(aaab);	//id가 ajaxReturn인 부분에 넣어라
   }    
   function whenError(){
       alert("Error");
   }
   
   function callAjax24(nhn){	  
	      $.ajax({
		        type: "post",
		        url : nhn,
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
    
</script>
<script language="JavaScript">
	function openState(regdate,couplename) {
	    // url과 사용자 입력 id를 조합합니다.
	    url = "state.nhn?couplename="+couplename+"&regdate="+regdate;
	    
	    // 새로운 윈도우를 엽니다.
	    open(url, "confirm", 
	    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
	}

	//function content(regdate,couplename){
	//	 url = "photocontent.nhn?couplename1="+couplename+"&regdate1="+regdate;
	//	window.location.href = url;
	//}
</script>  
<style>
 td{align:center;}
 tr{align:center;}
</style>
<style>
.table14_1 table {
	margin:15px 0;
	border:0;
}
.table14_1 th {
	font-weight:bold;
	background-color:#FFDEE9;
	color:#FF607F
}
.table14_1,.table14_1 th,.table14_1 td {
	font-size:0.95em;
	text-align:center;
	padding:4px;
	border-collapse:collapse;
}
.table14_1 th,.table14_1 td {
	border: 1px solid #ffffff;
	border-width:1px
}
.table14_1 th {
	border: 1px solid #e7f6fe;
	border-width:1px 0 1px 0
}
.table14_1 td {
	border: 1px solid #eeeeee;
	border-width:1px 0 1px 0
}
.table14_1 tr {
	border: 1px solid #ffffff;
}
.table14_1 tr:nth-child(odd){
	background-color:#f7f7f7;
}
.table14_1 tr:nth-child(even){
	background-color:#ffffff;
}
</style>

<div id="check">  
포토북 신청 확인
<form method="post"> 
<div style="height:450px">
<table class="table14_1" border="1px" cellspadding="0" cellspacing="0" width="600px" style="align:center;">
	<tr style="height:30px">
		<th>커플아이디</th>
		<th>포토북 신청날짜</th>
		<th>신청상태</th>
	</tr>
	<c:forEach items="${photo}" var="photo">
		<tr>
			<td><a href="#" onclick="callContent7('photocontent.nhn','${photo.regdate }','${photo.couplename }')" data-toggle="modal" data-target="#myModaly7">${photo.couplename }</a></td>
			<td><fmt:formatDate value="${photo.regdate }" pattern="YYYY-MM-dd" /></td>
			<td><a href="#" onclick="openState('${photo.regdate }','${photo.couplename }')">${photo.state}</a></td>
		</tr>
	</c:forEach>
</table>
</div>
<c:if test="${count > 0}">
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
						<center>
						<c:if test="${startPage > 10}">
							<a href="#" onclick="callAjax24('adphoto.nhn?pageNum=${startPage - 10 }')">[이전]</a>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<a href="#" onclick="callAjax24('adphoto.nhn?pageNum=${i}')">[${i}]</a>
						</c:forEach>

						<c:if test="${endPage < pageCount}">
							<a href="#" onclick="callAjax24('adphoto.nhn?pageNum=${startPage + 10 }')">[다음]</a>
						</c:if>
						</center>
					</c:if>
</form>
</div>
<div class="modal fade" id="myModaly7" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-focus-on="input:first">
	  <div class="modal-dialog" style="width:850px">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel"></h4>
	      </div>
	      <div class="modal-bodyy7">		   
	      </div>
	      <div class="modal-footer">
			<center><button type="button" class="btn btn-default" data-dismiss="modal" >닫기</button></center>
	      </div>
	    </div>
	  </div>
	</div>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->	
