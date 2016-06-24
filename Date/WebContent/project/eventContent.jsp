<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">  
function callEvent(url,pageNum,enumber){    	
  	 $.ajax({   		   
	        type: "post", 	       
	        url : url+"?pageNum="+pageNum+"&enumber="+enumber,
	        success: test,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
    	});
  }

    function callAddApp(url,enumber){    	
   	 $.ajax({   		   
	        type: "post", 	       
	        url : url+"?enumber="+enumber,
	        success: test,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
     	});
   }
    
    function callApp(url,appnumber,wnumber,enumber,pageNum,tab){    
   	 $.ajax({    		
	        type: "post", 	 
	        url : url+"?appnumber="+appnumber+"&wnumber="+wnumber+"&enumber="+enumber+"&pageNum="+pageNum+"&tab="+tab,
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
<style>
.page {
	margin-left: 50%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이벤트 상세 정보 페이지</title>
</head>
<body>
	<table border="1" width="500" cellpadding="0" cellspacing="0"
		align="center">
		<tr height="30">
			<td align="center" width="100">이벤트 이름</td>
			<td align="center">${eto.ename}</td>
		</tr>
		<tr>
			<td align="center" width="150">뽑는 당첨자 수 : ${eto.wnumber}</td>
			<td align="center">진행 날짜 : ${eto.sdate}~${eto.edate}</td>
		</tr>
		<tr>
			<td align="center" colspan=2><img src="${eto.eimg}" width="340" height="430"></td>
		</tr>
	</table>
	<br/>
	<c:if test="${tab==2}">
		<center>
			아직 이벤트가 진행기간이 아닙니다!<br />이벤트가 진행 되면 참여 부탁드려요^__^
		</center>
	</c:if>
	<c:if test="${tab==1||tab==3}">
		<table border="1" width="500" cellpadding="0" cellspacing="0" align="center">			
			<tr height="30">
				<td align="center" width="50">글 번호</td>
				<td align="center" width="100">커플 이름</td>
				<td align="center" width="300">제목</td>
				<c:forEach var="appList" items="${appList}">
					<tr height="30">
						<td align="center">${appList.appnumber}</td>
						<td align="center">${appList.couplename}</td>
						<td align="center">
						<c:if test="${appList.apppw!=null}">
								<img src="/Date/project/lock.png" width="20" height="20">
								<a href="#"
									onclick="callApp('confirmPw.nhn',${appList.appnumber},${eto.wnumber},${eto.enumber},${currentPage}, ${tab})">
									${appList.appsubject}</a>
						</c:if> 
						<c:if test="${appList.apppw==null}">
								<a href="#"
									onclick="callApp('appContent.nhn',${appList.appnumber},${eto.wnumber},${eto.enumber},${currentPage}, ${tab})">
									${appList.appsubject}</a>
						</c:if></td>
					</tr>
				</c:forEach>
		</table>
	</c:if>
	<c:if test="${tab==1}"><button type="button" class="btn btn-default" style="margin-top:5px; margin-left:408px" onclick="callAddApp('addApp.nhn',${eto.enumber})">이벤트 참여하기</button></c:if><br/>
	<c:if test="${tab==4}">
		<c:if test="${eto.w==0}">아직 당첨자를 뽑지 않았습니다!!</c:if>
		<c:if test="${eto.w==1}"><c:forEach var="i" begin="0" end="${eto.wnumber}">
			${wclist[i]}<br/>
		</c:forEach></c:if>
	</c:if>
	<div class="page">
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
			<a href=# onclick="callEvent('eventContent.nhn',${startPage - 10 },${enumber})">[이전]</a>
		</c:if>

		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href=# onclick="callEvent('eventContent.nhn',${i},${enumber})">[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCount}">
			<a href=# onclick="callEvent('eventContent.nhn',${startPage + 10 },${enumber})">[다음]</a>
		</c:if>
	</div>
</body>
</html>