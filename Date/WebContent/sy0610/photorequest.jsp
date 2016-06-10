<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<%@include file="/sy0526/topmenu.jsp" %>

 <style>
 	li{list-style:none;}
 </style>

	<form name="frmSet">
    	<input type="hidden" id="aa" name="listMore" value="${listMore}"/>
	</form>
	<form action="adminphoto.nhn?couplename=dfg" method="post">
	<input type="submit" value="포토북 신청"/>
	<c:set var="i" value="1"/>
		<c:forEach var="diary" items="${diary}">
			<ul class="tbl_area" id="dispRow${i }" style="display:none">	
				<c:set var="i" value="${i+1 }" />
               		<li>
               			<input type="checkbox" name="photocheck" value="${diary.num }">
				                	<img src="syimage/${diary.img }">
				                	${diary.content}
				                	<fmt:formatDate value="${diary.regdate }" pattern="YYYY-MM-dd" />
                  </li>
			</ul>
		</c:forEach>
	<div id="dispMore" style="display:none;">
		<a href="#" onclick="listMore(${totalCnt})" style="margin-left:50%; ">더보기</a>
	</div>
	<c:forEach end="${totalCnt}" begin="1" var="i">
		<c:if test="${i<=listMore }">
			<script>
				document.getElementById("dispRow${i}").style.display = 'block'; //최대 갯수 보다 작거나 같으면 이미지를 보여준다
			</script>
		</c:if> 
	</c:forEach>
	<c:if test="${totalCnt > listMore }">
		<script>
			document.getElementById("dispMore").style.display = 'block'; //최대갯수보다 화면에 보여주는 이미지 갯수보다 작으면 더보기 버튼을 보여준다
		</script>
	</c:if>
	<script type="text/javascript"> 
		function listMore(totalCnt) //더보기 버튼을 눌렀을때 실행되는 함수
			{
                 
				var listMore = document.frmSet.listMore.value; //현재 화면에 보여지는 리스트 갯수를 가져온다(3개)
				var last = Number(listMore) + 3; //더보기를 누르면 3개씩 추가 된다
                for (i=Number(listMore)+1;i<=totalCnt;i++) // i=(3+1) -> 최초3개만 보여주니까 다음부턴 4부터 6까지; 4보다 최대 갯수가 같거나 클때 까지; i= 4++
               {
                if (i<=last) // i가 6보다 작거나 같을경우
                {
                 document.getElementById("dispRow"+i).style.display = 'block'; //dispRow6 까지 block 처리를 한다
                }
               }
               document.frmSet.listMore.value = last;
               if (totalCnt <= last)
               {   
                document.getElementById("dispMore").style.display = 'none'; //더보기 버튼이 최대갯수보다 크거나 작으면 none 처리
               }
              }
	</script>
</form>