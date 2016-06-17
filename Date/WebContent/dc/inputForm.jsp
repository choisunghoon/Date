<%@ page contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<script language="JavaScript">
    
    function checkIt() {
        var userinput = eval("document.userinput");
        if(!userinput.id.value) {
            alert("ID를 입력하세요");
            return false;
        }
        
        if(!userinput.pw.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        if(userinput.pw.value != userinput.pw2.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }
        if(!userinput.nickname.value) {
            alert("별명을 입력하세요");
            return false;
        }
       
    }

    // 아이디 중복 여부를 판단
    function openConfirmid() {
        // 아이디를 입력했는지 검사
        var userinput= document.getElementById("id").value;
        if (userinput == "") {
            alert("아이디를 입력하세요");
            return;
        }
        // url과 사용자 입력 id를 조합합니다.
        url = "confirmId.nhn?id=" + userinput ;
        
        // 새로운 윈도우를 엽니다.
        open(url, "confirm", 
        "toolbar=no, location1=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
    }
    function openConfirmnickname() {
        // 아이디를 입력했는지 검사
        var userinput = document.getElementById("nickname").value;
        if (userinput == "") {
            alert("별명 입력하세요");
            return;
        }
        // url과 사용자 입력 id를 조합합니다.
        url = "confirmNickname.nhn?nickname=" + userinput;
        
        // 새로운 윈도우를 엽니다.
        open(url, "confirm", 
        "toolbar=no, location1=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
    }
</script>

<script>
$(document).ready(function() {
    
    $(window).on('resize load', function() {
	$('.contentwrap').css({"padding-top": $(".navbar").height() + "px"});
	});
});
</script>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="contentwrap" >
  <article class="container" >
    <div class="page-header" style="margin-top:5px;width:80%;">
	  <h1>회원가입 <small>일반회원가입</small></h1>
    </div>
    
    <form class="form-horizontal" method="post" action="inputPro.nhn" name="userinput" onSubmit="return checkIt()">
    
    <div class="form-group">
    <label for="inputNumber" class="col-sm-2 control-label">사용자 ID</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력해주세요">
      
    </div>
      <div class="col-sm-2">
      <a class="btn btn-default" name="confirm_id" onClick="openConfirmid()" href="#" role="button">아이디 중복 확인</a>
      </div>
    </div>
    
    <div class="form-group">
    <label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
    <div class="col-sm-6">
    <input type="password" class="form-control" id="inputPassword" name="pw" placeholder="비밀번호">
    
    </div>
    </div>
       <div class="form-group">
    <label for="inputPasswordCheck" class="col-sm-2 control-label">비밀번호 확인</label>
    <div class="col-sm-2">
    <input type="password" class="form-control" name="pw2" id="inputPasswordCheck" placeholder="비밀번호 확인">
      <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
    </div>
    </div>
     <div class="form-group">
    <label for="inputNumber" class="col-sm-2 control-label">사용자 별명</label>
    <div class="col-sm-2">
    <input type="text" class="form-control" id="nickname" name="nickname" size="15" maxlength="10" id="inputNumber" placeholder="별명을 입력해주세요">
      
    </div>
      <div class="col-sm-2">
      <a class="btn btn-default" name="confirm_nickname" OnClick="openConfirmnickname()" href="#" role="button">별명 중복 확인</a>
      </div>
    </div>
   
    
    
      <div class="form-group">
    <label for="inputAgree" class="col-sm-2 control-label">관심지역</label>
    <div class="col-sm-6 checkbox">
      
      <div width="400" id="location1"> 
        <select name="location2" id ="location2" onchange="javascript:option();">
        	<option value="non">지역을 선택해주세요</option>
        	<option value="서울">서울</option>
        	<option value="경기도">경기도</option>
        	<option value="강원도">강원도</option>
        	<option value="충청도">충청도</option>
        	<option value="전라도">전라도</option>
        	<option value="경상도">경상도</option>
        </select>
      </div>
      
    </div>
    </div>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label"></label>
    <div class="col-sm-6">
  	  <input type="hidden" name="hidden" value="nomal">
      <button type="submit" class="btn btn-primary">회원가입</button>
    </div>
    </div>
    </form>
  </article>
</div>

</body>

<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
				<div class="navbar-header">
				
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			
	</nav>

<script>

	function option(){
		var obj=document.getElementById("location2");
		var location1=document.getElementById("location2").value;
		
		
		var tdlocation1 = document.getElementById("location1");
		
		if(obj.value=="서울"){
			tdlocation1.innerHTML="<select name='location2' id='location2' onchange='javascript:option();'>"+
        	"<option value='서울' selected>서울</option>"+
        	"<option value='경기도'>경기도</option>"+
        	"<option value='강원도'>강원도</option>"+
        	"<option value='충청도'>충청도</option>"+
        	"<option value='전라도'>전라도</option>"+
        	"<option value='경상도'>경상도</option>"+
        	"</select>"+
				
						"<select name='location'>"+
						"<option value='동대문구'>동대문구</option>"+
						"<option value='강서구'>강서구</option>"+
						"<option value='영등포구'>영등포구</option>"+
						"<option value='강남구'>강남구</option>"+
						"<option value='종로구'>종로구</option>"+
						"</select>"	
		}
		if(obj.value=="경기도"){
			tdlocation1.innerHTML=
				"<select name='location2' onchange='javascript:option();'>"+
	        	"<option value='서울'>서울</option>"+
	        	"<option value='경기도'selected>경기도</option>"+
	        	"<option value='강원도'>강원도</option>"+
	        	"<option value='충청도'>충청도</option>"+
	        	"<option value='전라도'>전라도</option>"+
	        	"<option value='경상도'>경상도</option>"+
	        	"</select>"+
				
						"<select name='location'>"+
						"<option value='분당구'>분당구</option>"+
						"<option value='일산동구'>일산동구</option>"+
						"<option value='일산서구'>일산서구</option>"+
						"<option value='단원구'>단원구</option>"+
						"<option value='오정구'>오정구</option>"+
						"</select>"	
		}
		if(obj.value=="강원도"){
			tdlocation1.innerHTML=
				"<select name='location2' onchange='javascript:option();'>"+
	        	"<option value='서울'>서울</option>"+
	        	"<option value='경기도'>경기도</option>"+
	        	"<option value='강원도'selected>강원도</option>"+
	        	"<option value='충청도'>충청도</option>"+
	        	"<option value='전라도'>전라도</option>"+
	        	"<option value='경상도'>경상도</option>"+
	        	"</select>"+
				
						"<select name='location'>"+
						"<option value='횡성군'>횡성군</option>"+
						"<option value='영월군'>영월군</option>"+
						"<option value='평창군'>평창군</option>"+
						"<option value='정선군'>정선군</option>"+
						"<option value='철원군'>철원군</option>"+
						"</select>"	
		}
		if(obj.value=="충청도"){
			tdlocation1.innerHTML=
				"<select name='location2' onchange='javascript:option();'>"+
	        	"<option value='서울'>서울</option>"+
	        	"<option value='경기도'>경기도</option>"+
	        	"<option value='강원도'>강원도</option>"+
	        	"<option value='충청도'selected>충청도</option>"+
	        	"<option value='전라도'>전라도</option>"+
	        	"<option value='경상도'>경상도</option>"+
	        	"</select>"+
				
						"<select name='location'>"+
						"<option value='청양군'>청양군</option>"+
						"<option value='홍성군'>홍성군</option>"+
						"<option value='예산군'>예산군</option>"+
						"<option value='태안군'>태안군</option>"+
						"<option value='부여군'>부여군</option>"+
						"</select>"	
		}
		if(obj.value=="전라도"){
			tdlocation1.innerHTML=
				"<select name='location2' onchange='javascript:option();'>"+
	        	"<option value='서울'>서울</option>"+
	        	"<option value='경기도'>경기도</option>"+
	        	"<option value='강원도'>강원도</option>"+
	        	"<option value='충청도'>충청도</option>"+
	        	"<option value='전라도'selected>전라도</option>"+
	        	"<option value='경상도'>경상도</option>"+
	        	"</select>"+
				
						"<select name='location'>"+
						"<option value='순창군'>순창군</option>"+
						"<option value='고창군'>고창군</option>"+
						"<option value='완주군'>완주군</option>"+
						"<option value='부안군'>부안군</option>"+
						"<option value='무주군'>무주군</option>"+
						"</select>"	
		}
		if(obj.value=="경상도"){
			tdlocation1.innerHTML=
				"<select name='location2' onchange='javascript:option();'>"+
	        	"<option value='서울'>서울</option>"+
	        	"<option value='경기도'>경기도</option>"+
	        	"<option value='강원도'>강원도</option>"+
	        	"<option value='충청도'>충청도</option>"+
	        	"<option value='전라도'>전라도</option>"+
	        	"<option value='경상도'selected>경상도</option>"+
	        	"</select>"+
				
						"<select name='location'>"+
						"<option value='청도군'>청도군</option>"+
						"<option value='칠곡군'>칠곡군</option>"+
						"<option value='군위군'>군위군</option>"+
						"<option value='봉화군'>봉화군</option>"+
						"<option value='울릉군'>울릉군</option>"+
						"</select>"	
		}

	}
</script>







</html>
