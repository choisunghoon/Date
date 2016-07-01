<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

</script>
</head>
<style>
.tbl_area{width:500px;}
   li{list-style:none;}

      #css_tabs {
         width:100%;
          font-family:'nanumgothic', '나눔고딕', 'malgun gothic', '맑은 고딕', 'dotum', '돋움', sans-serif      
      }
      /* 탭 선택 시 표시할 요소(div) 정의(1번 탭 선택 시 첫 번째 div 요소 표시) */
      #css_tabs input:nth-of-type(1), #css_tabs input:nth-of-type(1) ~ div:nth-of-type(1), #css_tabs input:nth-of-type(2), #css_tabs input:nth-of-type(2) ~ div:nth-of-type(2), #css_tabs input:nth-of-type(3), #css_tabs input:nth-of-type(3) ~ div:nth-of-type(3), #css_tabs input:nth-of-type(4), #css_tabs input:nth-of-type(4) ~ div:nth-of-type(4) {
          display:none
      }
      #css_tabs input:nth-of-type(1):checked ~ div:nth-of-type(1), #css_tabs input:nth-of-type(2):checked ~ div:nth-of-type(2), #css_tabs input:nth-of-type(3):checked ~ div:nth-of-type(3), #css_tabs input:nth-of-type(4):checked ~ div:nth-of-type(4) {
          display:block
      }
      /* 라벨 기본 스타일 지정 */
      #css_tabs > label {
          display:inline-block;
          font-variant:small-caps;
          font-size:14px;
          padding:10px;
          text-align:center;
          width:15%;
          line-height:1.8em;
          font-weight:700;
          border-radius:3px 3px 0 0;
          background:#eee;
          color:#777;
          border:1px solid #ccc;
          border-width:1px 1px 0
      }
      #css_tabs > label:hover {
          cursor:pointer
      }
      #css_tabs label[for=tab1] {
          margin-left:31%
      }
      /* 선택된 라벨, 커서를 올린 라벨 스타일 지정 */
      #css_tabs input:nth-of-type(1):checked ~ label:nth-of-type(1), #css_tabs > label[for=tab1]:hover {
          background:tomato;
          color:#fff
      }
      #css_tabs input:nth-of-type(2):checked ~ label:nth-of-type(2), #css_tabs > label[for=tab2]:hover {
          background:gold;
          color:#fff
      }
      /* 실제 내용이 담긴 div 요소 스타일 지정 */
      #css_tabs .tab1_content, #css_tabs .tab2_content, #css_tabs .tab3_content, #css_tabs .tab4_content {
      
          border:1px solid #ddd;
          width:100%;
          
      }
         
</style>

<body>
<form name="comment" method="post">
	<table width="500" border="1" cellspacing="0" cellpadding="0" >
	
	<tr align="center">
		<td width="100"> ${id} </td>
		<td width="300"><textarea name="diarycomment" id="diarycomment" cols="35" rows="4" /></td>
		<td width="100"><input type="button" name="commentup" value="commentup" href="#" onclick="callAjax3('CommentUp.nhn')"> 
	
	</tr>
	</table>
	
	<table width="500" border="1" cellspacing="0" cellpadding="0" >
	<form name="frmSet">
	 <input type="hidden" id="aa" name="listMore" value="${listMore}"/>
	</form>
	<tr align="center">
		<td width="100"> id </td> 
		<td width="300"> 내용 </td> 
		<td width="100"> 작성시간 </td>
	</tr>
	<c:set var="i" value="1"/>
	<c:forEach var="commentList" items="${commentList}">
	<ul class="tbl_area" id="dispRow${i }" style="margin-left:22%;display:none">
	<tr align="center">
		<td width="100">${commentList.id}</td>
		<td width="300">&nbsp;${commentList.diarycomment}</td>
		<td width="100">${commentList.regdate}</td>
	</tr>

	
	<c:if test="${totalcount} == 0">
	<tr align="center">
		<td colspan="5" > 등록된 게시글이 없습니다</td>
	</tr>
	</c:if>
	 </ul>
	</c:forEach>		
	</tr>
</table> 
	
	        <div id="dispMore" >
             <a href="#" onclick="listMore(${totalcount})">더보기</a>
            </div>
            <c:forEach end="${totalcount}" begin="1" var="i">
               <c:if test="${i<=listMore }">
                  <script>
                  alert("111");
                    document.getElementById("dispRow${i}").style.display = 'block'; //최대 갯수 보다 작거나 같으면 이미지를 보여준다
                  </script>
               </c:if> 
            </c:forEach>
            <c:if test="${totalcount > listMore }">
               <script>
               alert("222");
                 document.getElementById("dispMore").style.display = 'block'; //최대갯수보다 화면에 보여주는 이미지 갯수보다 작으면 더보기 버튼을 보여준다
               </script>
            </c:if>
            <script type="text/javascript"> 
              function listMore(totalcount) //더보기 버튼을 눌렀을때 실행되는 함수
              {
            	  alert("111");
               var listMore = document.frmSet.listMore.value; //현재 화면에 보여지는 리스트 갯수를 가져온다(3개)
               
               var last = Number(listMore) + 3; //더보기를 누르면 3개씩 추가 된다
               
               for (i=Number(listMore)+1;i<=totalcount;i++) // i=(3+1) -> 최초3개만 보여주니까 다음부턴 4부터 6까지; 4보다 최대 갯수가 같거나 클때 까지; i= 4++
               {
                if (i<=last) // i가 6보다 작거나 같을경우
                {
                 document.getElementById("dispRow"+i).style.display = 'block'; //dispRow6 까지 block 처리를 한다
                }
               }
               document.frmSet.listMore.value = last;
               if (totalcount <= last)
               {   
                document.getElementById("dispMore").style.display = 'none'; //더보기 버튼이 최대갯수보다 크거나 작으면 none 처리
               }
              }
            </script>

</form>
</body>
</html>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->	