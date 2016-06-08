<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<div class="contentwrap">
  <article class="container">
    <div class="page-header">
	  <h1>회원가입 <small>일반회원가입</small></h1>
    </div>
    
    <form class="form-horizontal">
    
    <div class="form-group">
    <label for="inputNumber" class="col-sm-2 control-label">사용자 ID</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="inputNumber" placeholder="아이디를 입력해주세요">
      
    </div>
      <div class="col-sm-2">
      <a class="btn btn-default" href="#" role="button">아이디 중복 확인</a>
      </div>
    </div>
    
    <div class="form-group">
    <label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
    <div class="col-sm-6">
    <input type="password" class="form-control" id="inputPassword" placeholder="비밀번호">
    
    </div>
    </div>
       <div class="form-group">
    <label for="inputPasswordCheck" class="col-sm-2 control-label">비밀번호 확인</label>
    <div class="col-sm-6">
    <input type="password" class="form-control" id="inputPasswordCheck" placeholder="비밀번호 확인">
      <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
    </div>
    </div>
     <div class="form-group">
    <label for="inputNumber" class="col-sm-2 control-label">사용자 별명</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="inputNumber" placeholder="아이디를 입력해주세요">
      
    </div>
      <div class="col-sm-2">
      <a class="btn btn-default" href="#" role="button">별명 중복 확인</a>
      </div>
    </div>
   
    
    
      <div class="form-group">
    <label for="inputAgree" class="col-sm-2 control-label">관심지역</label>
    <div class="col-sm-6 checkbox">
      
      <td width="400" id="location1"> 
        <select name="location1" onchange="javascript:option(this);">
        	<option value="non">지역을 선택해주세요</option>
        	<option value="서울">서울</option>
        	<option value="경기도">경기도</option>
        	<option value="강원도">강원도</option>
        	<option value="충청도">충청도</option>
        	<option value="전라도">전라도</option>
        	<option value="경상도">경상도</option>
        </select>
      </td>
    </div>
    </div>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label"></label>
    <div class="col-sm-6">
      <button type="submit" class="btn btn-primary">회원가입</button>
    </div>
    </div>
    </form>
  </article>
</div>

</body>
</html>