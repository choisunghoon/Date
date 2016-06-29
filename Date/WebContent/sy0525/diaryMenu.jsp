<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<div class="re">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
         function test(){ 
            var now = new Date();
            var then = new Date('${cdb.coupledate }');
            var gap = now.getTime() - then.getTime();
            gap = Math.floor(gap / (1000 * 60 * 60 * 24)) + 1;
            
           // document.write('<div id="dday">D+<span style="font-size:33px;">' + gap + '</span></div>');
            var b = (gap/100)-Math.floor(gap/100);    
            var a = Math.floor(gap/100);
            if(b<1){
            //   $("#tab2").appendto='<img src="/syimage/a'+a+'.jpg" width="500" height="600"/>';
            }
         }
         function callContent3(url){ 
        	 $.ajax({    		
     	        type: "post", 	
     	        url : url,
     	        success: test,	// 페이지요청 성공시 실행 함수
     	        error: whenError	//페이지요청 실패시 실행함수
          	});    	 
        }

        function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
            $(".modal-bodyy3").html(aaa);	//id가 ajaxReturn인 부분에 넣어라
        }    
        function whenError(){
            alert("Error");
        }
        
 </script>
    
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
  
<div style="width:200px; height:280; margin-left:37%;">
   <center>사귄 날짜 : <fmt:formatDate value="${cdb.coupledate }" pattern="YYYY-MM-dd" /></center>
   <div style="float:left;">
      <c:if test="${cdb.coupleimage eq null }">
      <img src="syimage/couple.png">
      </c:if>
      <c:if test="${cdb.coupleimage ne null }">
      <center><img src="syimage/${cdb.coupleimage }" style="width:200px;border:1px solid;"></center>
      </c:if>
   </div>
   <center>
      <a href="#" onclick="callContent3('diary.nhn?couplename=${couplename }')" id="test" data-toggle="modal" data-target="#myModaly3" >이미지 변경</a>
   </center>
  
</div>	

<div id="css_tabs">
    <input id="tab1" type="radio" name="tab" checked="checked" />
    <input id="tab2" type="radio" name="tab" />
    <label for="tab1">커플 다이어리</label>
    <label for="tab2" onclick="test()">커플 하트 나무</label>     
    <div class="tab1_content" style="width:1100px;">
      <div class="sub_photo">
          <div class="title_area">
          
             <a href="#" onclick="callContent3('ex.nhn?couplename=${couplename }')" id="test" data-toggle="modal" data-target="#myModaly3" style="margin-left:80%;">게시물 작성</a><br/>
             <form name="frmSet">
             <input type="hidden" id="aa" name="listMore" value="${listMore}"/>
            </form>
            <c:set var="i" value="1"/>
             <c:forEach var="diary" items="${diary}">
               <ul class="tbl_area" id="dispRow${i }" style="margin-left:22%;display:none">
               		<c:set var="i" value="${i+1 }" />
                  <li style="padding-top:10px;">
                     <center><img src="syimage/${diary.img }"></center>
                  </li>
                  <li>
                  <center>${diary.content}</center>
                  </li>
                  <li style="margin-left:42%;">
                     <button onClick="callContent3('DiaryModify.nhn?num=${diary.num}&couplename=${couplename}')" data-toggle="modal" data-target="#myModaly3">수정</button>
                     <button onClick="location.href='DiaryDelete.nhn?num=${diary.num}&couplename=${couplename}'">삭제</button>
                     <c:if test="${diary.pool eq '0' }">
                     	<button onClick="location.href='diarysharing.nhn?num=${diary.num}&check=1'">공유하기</button>
                  	 </c:if>
                  	 <c:if test="${diary.pool eq '1' }">
                    	 <button onClick="location.href='diarysharing.nhn?num=${diary.num}&check=0'">공유취소</button>
                  	 </c:if>
                  </li>
            
               </ul>
            </c:forEach>
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
            
         </div>
      </div>  
    </div>
    <div class="tab2_content">
       <div id="tab2" style="margin-left:33%;padding-bottom:60px;">
        
      </div>  
   </div>
</div>
</div>
<div class="modal fade" id="myModaly3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-focus-on="input:first">
	  <div class="modal-dialog" style="width:850px">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel"></h4>
	      </div>
	      <div class="modal-bodyy3">		   
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