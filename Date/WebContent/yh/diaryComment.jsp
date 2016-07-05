<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="re">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
function callComment(nhn){
    $.ajax({
        type: "post",
        url : nhn,
        success: callAjax2,	// 페이지요청 성공시 실행 함수
        error: commentError	//페이지요청 실패시 실행함수
 	});
}
function commentError(){
    alert("댓글을 삭제할 권한 없습니다.");
}
function setImotappimg(imotappimg){
	imotappimgImg.innerHTML = imotappimgImg.innerHTML = "<img src=\"/Date/project/ee/" + imotappimg + "\" >";
	$("#appimg").value = imotappimg;
	imotappimgDiv.style.visibility = "hidden";
	
}

function viewimotappimg(){
	imotappimgDiv.style.visibility = "visible";
}

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
<br/>
<center>
<body>
<form name="comment" method="post">

    <div class="tab1_content" >
      <div class="sub_photo">
          <div class="title_area">
          
             <form name="frmSet">
             <input type="hidden" id="aa" name="listMore" value="${listMore}"/>
            </form>
    <ul class="tbl_area">
                   <table width="500px"  border="0" cellspacing="0" cellpadding="0" >
					<tr align="center">
						<td ><textarea name="diarycomment" style="width:100%" id="diarycomment" cols="35" rows="2" /></td>
<input type=hidden id="appimg" name=appimg value='1.png'>
						<td align="center" style="CURSOR: pointer;" onclick=viewimotappimg(); style="width:32;height:29"><input type="hidden" id="couplename" name="couplename" value="${couplename}">
				<DIV id=imotappimgImg name="imotiImg" style="width:32"><IMG src="/Date/project/ee/8.png"></DIV></td>
				<td>
				<DIV id=imotappimgDiv style="Z-INDEX: 1000; VISIBILITY: hidden; WIDTH: 220px; POSITION: absolute; HEIGHT: 40px">
				<TABLE cellSpacing=0 cellPadding=0 border=0>
					<TR>
						<TD style="PADDING-LEFT: 2px">
							<TABLE cellSpacing=1 cellPadding=0 bgColor=#dedede border=0>
								<TR bgColor=#ffffff>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('1.png');"><IMG src="/Date/project/ee/1.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('2.png');"><IMG src="/Date/project/ee/2.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('3.png');"><IMG src="/Date/project/ee/3.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('4.png');"><IMG src="/Date/project/ee/4.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('5.png');"><IMG src="/Date/project/ee/5.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('6.png');"><IMG src="/Date/project/ee/6.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('7.png');"><IMG src="/Date/project/ee/7.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('8.png');"><IMG src="/Date/project/ee/8.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('9.png');"><IMG src="/Date/project/ee/9.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('10.png');"><IMG src="/Date/project/ee/10.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('11.png');"><IMG src="/Date/project/ee/11.png"></TD>
                                	<TD style="CURSOR: pointer;" onclick="setImotappimg('12.png');"><IMG src="/Date/project/ee/12.png"></TD>
                                </TR>
                                <TR bgColor=#ffffff>
                                	<TD style="CURSOR: pointer;" onclick="setImotappimg('13.png');"><IMG src="/Date/project/ee/13.png"></TD>
                                	<TD style="CURSOR: pointer;" onclick="setImotappimg('14.png');"><IMG src="/Date/project/ee/14.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('15.png');"><IMG src="/Date/project/ee/15.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('16.png');"><IMG src="/Date/project/ee/16.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('17.png');"><IMG src="/Date/project/ee/17.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('18.png');"><IMG src="/Date/project/ee/18.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('19.png');"><IMG src="/Date/project/ee/19.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('20.png');"><IMG src="/Date/project/ee/20.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('25.png');"><IMG src="/Date/project/ee/25.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('22.png');"><IMG src="/Date/project/ee/22.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('24.png');"><IMG src="/Date/project/ee/24.png"></TD>
									<TD style="CURSOR: pointer;" onclick="setImotappimg('25.png');"><IMG src="/Date/project/ee/25.png"></TD>
                                </TR>
							</TABLE>
						</TD>
					</TR>
				</TABLE>
			</DIV>
						</td>
						<td ><img src="yh/img/z61.png"  type="button" style='width:height:70px; border:70px ;'
name="commentup" value="commentup" href="#" onclick="callAjax3('CommentUp.nhn')"> 
	
					</tr>
				</table>
  </ul>
            <c:set var="i" value="1"/>
             <c:forEach var="commentList" items="${commentList}">
               <ul class="tbl_area" id="dispRow${i}" style="margin-left:0%;display:none">
               		<c:set var="i" value="${i+1 }" />
                 <li >
				<table width="500px" border="1" cellspacing="0" cellpadding="0" >
						<tr align="center">
						<td width="15%">${commentList.id}</td>
						<td width="55%" cols="10" rows="3">&nbsp;${commentList.diarycomment}
					    <td><img src="yh/img/c3.png" type="button" value="delete" onclick="callComment('commentDelete.nhn?id=${id}&commentnum=${commentList.num}')"/></td>
						</td>
						<td width="15%"><h6>${commentList.regdate}</h6></td>
         				</tr>
                  	</table>
                  </li>
                  </ul>
	
            </c:forEach>
  <ul class="tbl_area">
              	<c:if test="${totalCount == 0}">
              	<table width="500px" border="1" cellspacing="0" cellpadding="0" >
					<tr align="center">
				<td > 등록된 댓글이 없습니다</td>
            	</tr>
            	</c:if>            
   </ul>
            <div id="dispMore" style="display:none;padding-bottom:100px;">
             <a href="#" onclick="listMore(${totalCount})" style="margin-left:35%;CURSOR: pointer">댓글 더 보기</a>
            </div>
            <c:forEach end="${totalCount}" begin="1" var="i">
               <c:if test="${i<=listMore }">
                  <script>
              
                    document.getElementById("dispRow${i}").style.display = 'block'; //최대 갯수 보다 작거나 같으면 이미지를 보여준다
                  </script>
               </c:if> 
            </c:forEach>
            <c:if test="${totalCount > listMore }">
               <script>

                 document.getElementById("dispMore").style.display = 'block'; //최대갯수보다 화면에 보여주는 이미지 갯수보다 작으면 더보기 버튼을 보여준다
               </script>
            </c:if>
            <script type="text/javascript"> 
              function listMore(totalCount) //더보기 버튼을 눌렀을때 실행되는 함수
              {
            
               var listMore = document.getElementById("aa").value; //현재 화면에 보여지는 리스트 갯수를 가져온다(10개)
           
               var last = Number(listMore) + 10; //더보기를 누르면 3개씩 추가 된다
           
               for (i=Number(listMore)+1;i<=totalCount;i++) // i=(3+1) -> 최초10개만 보여주니까 다음부턴11부터 20까지; 11보다 최대 갯수가 같거나 클때 까지; i= 11++
               {
                if (i<=last) // i가 11보다 작거나 같을경우
                {
                 document.getElementById("dispRow"+i).style.display = 'block'; //dispRow6 까지 block 처리를 한다
                }
               }
               document.getElementById("aa").value = last;
               if (totalCount <= last)
               {
                document.getElementById("dispMore").style.display = 'none'; //더보기 버튼이 최대갯수보다 크거나 작으면 none 처리
               }
              }
            </script>
            
         </div>
      </div>  
    </div>

</div>
</div></form>
</body>
</html>
	
	