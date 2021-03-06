<%@ page language="java" contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">






<head>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
 <script src="http://code.jquery.com/jquery-1.10.2.js"></script>



<script type="text/javascript">
<!--
function date() {
	
	var ddd=document.getElementById("ddd");
	ddd.innerHTML="<input type='text' id='coupleDate' name='coupleDate'><input type='hidden' name='hidden' value='hidden'>"

		$(function() {
			$("#coupleDate").datepicker({
				    dateFormat: 'yy-mm-dd', 
				    prevText: '이전 달', 
				    nextText: '다음 달',  
				    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				    dayNames: ['일','월','화','수','목','금','토'],
				    dayNamesShort: ['일','월','화','수','목','금','토'],
				    dayNamesMin: ['일','월','화','수','목','금','토'],
				    showMonthAfterYear: true,
				    yearSuffix: '년'
				  });
				});
		
}
-->
</script>

 


<script>


   <!-- 
    function checkIt() {
        var userinput = eval("document.userinput");
               
        if(!userinput.pw.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        if(userinput.pw.value != userinput.pw2.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }
       
        if(!userinput.username.value) {
            alert("사용자 이름을 입력하세요");
            return false;
        }
        
    }
   function openConfirmnickname(userinput) {
       // 별명을 입력했는지 검사
       if (userinput.nickname.value == "") {
           alert("별명 입력하세요");
           return;
       }
       // url과 사용자 입력 id를 조합합니다.
       url = "confirmNickname.nhn?nickname=" + userinput.nickname.value ;
       
       // 새로운 윈도우를 엽니다.
       open(url, "confirm", 
       "toolbar=no, location1=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
   }
   function openCCName(userinput) {
       // 커플명을 입력했는지 검사
       if (userinput.coupleName.value == "") {
           alert("커플명을 입력하세요");
           return;
       }
       // url과 사용자 입력 id를 조합합니다.
       url = "confirmCoupleName.nhn?coupleName=" + userinput.coupleName.value ;
       
       // 새로운 윈도우를 엽니다.
       open(url, "confirm", 
       "toolbar=no, location1=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
   }
   function openCoupleImage(userinput) {
       
      
       // url과 사용자 입력 id를 조합합니다.
       url = "diary1.nhn?coupleName=" + userinput.coupleName.value ;
       
       // 새로운 윈도우를 엽니다.
       open(url, "confirm", 
       "toolbar=no, location1=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=300");
   }
   function submit(){     
       
       document.coupleModify.method = "post"     // method 선택, get, post
       document.coupleModify.action = "coupleModify.nhn";  // submit 하기 위한 페이지 
       document.coupleModify.submit();
      
  }
-->

</script>

<title>커플 정보</title>
</head>



<c:if test="${check1 eq 0 and check2 eq 0}">
<%@include file="/dc/coupleSearch.jsp" %>
</c:if>
<body align="center">

<!-- 커플 신청을 한 상태인 회원(상대방이 커플수락 안함)
	 check1 = 커플을 신청한 회원인지 판별, couple2.couple 커플인 회원인지 판별 -->
<c:if test="${check1 == 1 and couple2.couple eq '0'}">
상대방의 수락을 기다리는 중입니다.<br>
커플 신청을 취소하려면 버튼을 클릭하세요.<br><a href="couplex.nhn?&id=${id}"><img src="button/z35.png"></a>
</c:if>

<!-- 커플 신청을 받은 상태인 회원
	 check2 = 커플 신청받은 회원인지 판별, couple2.couple 커플인 회원인지 판별 -->
<c:if test="${check2 == 1 and couple2.couple eq '0'}">
<b>${couple1.nickname }</b>(${couple1.id})님으로 부터 커플명 <b>${coupleData.coupleName }</b> (으)로 커플 신청이 왔습니다.
수락하시려면 버튼을 클릭하세요.<br><a href="coupleInput.nhn?&id=${id}"><img src="button/z36.png"></a>
<a href="couplex.nhn?&id=${id}"><img src="button/z37.png"></a>
</c:if>

<!-- 커플인 회원 -->
<c:if test="${couple2.couple eq'1' }">
	<form method="post" action="coupleModify.nhn"  name="coupleModify">
	<center>
	<b>${couple2.nickname }</b>(${ouple2.id})님과 <b>${couple1.nickname }</b>(${couple1.id})님의 커플 정보 입니다.
	<br/><br/><br/>
   
 	 커플명   <input type="text" name="coupleName" size="20" maxlength="30" value="${coupleData.coupleName}">     
      	<a href="javascript:openCCName(document.coupleModify)"><img src="button/z12.png"></a><br><br>
   사귄 날짜 <div id="ddd"><fmt:formatDate  value="${coupleData.coupleDate }" pattern="yy-MM-dd"/></div>
   <a href="javascript:date()"><img src="button/z21.png"></a><br><br>
   
    
      <c:if test="${coupleData.coupleImage eq null }">
      <img src="syimage/couple.png" class="img-circle"><br>
       
      <a href="javascript:openCoupleImage(document.coupleModify)"><img src="button/z25.png"></a>
  
      </c:if>
      <c:if test="${coupleData.coupleImage ne null }">
      <img src="syimage/${coupleData.coupleImage }" width="200px" height="200px">
       <center>
      <a href="javascript:openCoupleImage(document.coupleModify)"><img src="button/z25.png"></a><br>
  
      </c:if>
     <br><br>
    <a href="javascript:submit()"><img src="button/z30.png"></a>
    <a href="mypage.nhn"><img src="button/456.png"></a>
  	
   
 
  	
	</form>

   </center>
 
    
  
</c:if>
</form>

</body>

</html>