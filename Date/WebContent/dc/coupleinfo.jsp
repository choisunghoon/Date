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
	ddd.innerHTML="<input type='text' id='coupleDate' name='coupleDate'>"

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
-->

</script>

<title>커플 정보</title>
</head>



<c:if test="${check1 eq 0 and check2 eq 0}">
<%@include file="/dc/coupleSearch.jsp" %>
</c:if>
<body align="center">

<form action="#" method="post">
<c:if test="${check1 eq 1 and couple2.couple eq '0'}">
상대방의 수락을 기다리는 중입니다.<br>
커플 신청을 취소하려면 버튼을 클릭하세요.<br><input type="button" value="커플 신청 취소"onclick="window.location='couplex.nhn?&id=${id}'">
</c:if>
<c:if test="${check2 eq 1 and couple2.couple eq '0'}">
<b>${couple1.nickname }</b>(${couple1.id})님으로 부터 커플명 <b>${coupleData.coupleName }</b> (으)로 커플 신청이 왔습니다.
수락하시려면 버튼을 클릭하세요.<br><input type="button" value="커플 수락" onclick="window.location='coupleInput.nhn?&id=${id}'">
<input type="button" value="커플 거부" onclick="javascript:window.location='couplex.nhn?&id=${id}'">
</c:if>
<c:if test="${couple2.couple eq '1' }">
	
	<form method="post" action="coupleModify.nhn">
	<center>
	<b>${couple2.nickname }</b>(${couple2.id})님과 <b>${couple1.nickname }</b>(${couple1.id})님의 커플 정보 입니다.
	<br/><br/><br/>
   
 	 커플명   <input type="text" name="coupleName" size="20" maxlength="30" value="${coupleData.coupleName}">     
      	<input type="button" value="커플명 중복확인" OnClick="openCCName(this.form)"><br><br>
   사귄 날짜 <div id="ddd"><fmt:formatDate  value="${coupleData.coupleDate }" pattern="yy-MM-dd"/></div>
   <input type="button" value="날짜변경" onclick="date()"/><br><br>
   
    
      <c:if test="${coupleData.coupleImage eq null }">
      <img src="syimage/couple.png" class="img-circle">
       
      <input type="button" value="이미지 변경" onClick="openCoupleImage(this.form)">
  
      </c:if>
      <c:if test="${coupleData.coupleImage ne null }">
      <img src="syimage/${coupleData.coupleImage }" width="200px" height="200px">
       <center>
      <input type="button" value="이미지 변경" onClick="openCoupleImage(this.form)"><br>
  
      </c:if>
    <input type="submit" value="커플정보 수정">
  	<input type="button" value="취소" onClick="javascript:window.location='mypage.nhn'">
   
 
  	
	</form>

   </center>
 
    
  
</c:if>
</form>

</body>

</html>