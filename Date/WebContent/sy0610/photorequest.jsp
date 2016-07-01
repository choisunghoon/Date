<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
   function callrefresh(url){
	   var form = $('#ff')[0];	   
	   var formdata = new FormData(form);
	   document.getElementById("ff").submit();
        $.ajax({
	        type: "post",
	        url : url,
	        data : formdata,
	        success: suc,	// 페이지요청 성공시 실행 함수
	        error: err	//페이지요청 실패시 실행함수
     	});  
    }
    function suc(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $(".re").html(aaa);
    }
    function err(){
        alert("Error");
    }
    
    function callContent4(url){ 
   	 $.ajax({    		
	        type: "post", 	
	        url : url,
	        success: test,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
     	});    	 
   }
    function callContent5(url,regdate){ 
      	 $.ajax({    		
   	        type: "post", 	
   	        url : url,
	   	     data : {
		        	regdate1 : regdate
		        },
   	        success: test,	// 페이지요청 성공시 실행 함수
   	        error: whenError	//페이지요청 실패시 실행함수
        	});    	 
      }
   function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
       $(".modal-bodyy4").html(aaa);	//id가 ajaxReturn인 부분에 넣어라
   }    
   function whenError(){
       alert("Error");
   }

	function checked(point){
		document.frmSet.submit();
		if(point<300){
			alert("포인트가 부족합니다!");
			return false;
		}
		else{
		var i = $('input:checkbox:checked').length;
			if(i==0){
				alert("사진을 선택해 주세요!");
				return false;
			}else if(i>20){
				alert("사진의 최대 선택 개수는 20장 입니다!");
				return false;
			}
			else{
				callrefresh('adminphoto.nhn');
			}
			
		}
		
	}
</script>

<style>
 	li{list-style:none;}
 </style>
	<form name="frmSet">
    	<input type="hidden" id="aa" name="listMore" value="${listMore}"/>
	</form>
	<form name="ff" id="ff" method="post" action="adminphoto.nhn?couplename=${couplename }" onsubmit="return checked(${point})">
	<div style="float:left;margin-left:70%;">
	<input type="image" name="submit" value="submit" src="button/z24.png"/>&nbsp;
	</div>
	<div>
	<a href="#" onclick="callContent4('photocheck.nhn')" id="test" data-toggle="modal" data-target="#myModaly4"><img src="button/z54.png"></a>
	</div>
	<c:set var="i" value="1"/>
		<c:forEach var="diary" items="${diary}" >
			<ul class="tbl_area" id="dispRow${i }" style="display:none; width:800px; margin-left:13%; margin-top:1%;">	
				<c:set var="i" value="${i+1 }" />
               		<li>
               			
               			<input type="checkbox" name="photocheck" value="${diary.num }" style="width:100px;">
				        <a href="#" onclick="callContent4('userPhoto.nhn?num=${diary.num}')" id="test" data-toggle="modal" data-target="#myModaly4">
				        <img src="syimage/${diary.img }" >
				        </a>
                  </li>
			</ul>
		</c:forEach>
		<div class="re">
		</div>
	<div id="dispMore" style="display:none;">
		<a href="#" onclick="listMore(${totalCnt})" style="margin-left:50%;">더보기</a>
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
<div class="modal fade" id="myModaly4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-focus-on="input:first">
	  <div class="modal-dialog" style="width:850px">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel"></h4>
	      </div>
	      <div class="modal-bodyy4">		   
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