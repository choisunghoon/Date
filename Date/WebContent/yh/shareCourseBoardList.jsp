<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="quickpager2.jquery.js"></script>
<script type="text/javascript">

/* <![CDATA[ */

$(document).ready(function() {
	$(".pageme tbody").quickPager( {
		pageSize: 5,
		naviSize: 3,
		currentPage: 1,
		holder: ".pager"
	});
});

/* ]]> */
</script>
<style type="text/css">


p {
	background: #e5e5e5;
	margin-bottom:1px;
	margin-top:0px;
}

ul.paging li {
    padding: 10px;
    background: #83bd63;
    font-family: georgia;
    font-size: 24px;
    color: #fff;
    line-height: 1;
    width: 180px;
    margin-bottom: 1px;
}

ul.pageNav li{
    display:block;
    floaT: left;
    padding: 3px;
    font-family: georgia;
}

ul.pageNav li a{
    color: #333;
    text-decoration: none;
}

li.currentPage {
	background: red;
        background: #83bd63;	
}

ul.pageNav li.currentPage a {
	color: #fff;	
}

table.pageme {
    border-collapse: collapse;
    border: 1px solid #ccc;
}  

table.pageme td {
    border-collapse: collapse;
    border: 1px solid #ccc;
}      

table, div {
	display:block;
	clear: both
}


</style>
<title>SHARE COURSE BOARD</title>	
</head>

<body>
<form method="post">
	<table width="600" border="1" cellspacing="0" cellpadding="2">
	
		<tr>
			<td align="center" colspan="2"> <h2>SHARE COURSE BOARD</h2></td>
		</tr>
	</table>

	
	<table width="600" border="1" cellspacing="0" cellpadding="2" class="pageme">
	<tr align="center">
		<td width="50">글번호</td>
		<td width="50">제목</td>
		<td width="50">커플네임</td>
		<td width="50">조회</td>
		<td width="50">추천</td>
	</tr>
	
	<c:forEach var="list" items="${list }">
	<tbody>
	<tr align="center">
		<td>${list.num }</td>
		<td align="left">&nbsp;
		<a href="#" onclick="callAjax('shareCourseBoardView.nhn?num=${list.num}&couplename=${couplename}&id=${id}')"> 
		
		${list.subject}</a></td>
		<td align="center"> ${list.couplename}</td>
		<td>${list.readcount}</td>
		<td>${list.likecount}</td>
	</tr>
	</tbody>
	</c:forEach>
		
	<c:if test="${list.size()} <= 0">
	<tr align="center">
		<td colspan="5" > 등록된 게시글이 없습니다</td>
	</tr>
	</c:if>
	<tr align="center" >
		<div class="pager"></div>
	</tr>
	</table>
	
	        <div id="dispMore" style="display:none;padding-bottom:100px;">
             <a href="#" onclick="listMore(${totalCnt})" style="margin-left:45%; ">더보기</a>
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
</body>
</html>
