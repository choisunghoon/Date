<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html><link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.css">
<head><title>로그인</title>


   <script language="javascript">
     <!--
       function begin(){
         document.myform.id.focus();
       }
       function checkIt(){
         if(!document.myform.id.value){
           alert("아이디를 입력하지 않으셨습니다.");
           document.myform.id.focus();
           return false;
         }
         if(!document.myform.pw.value){
           alert("비밀번호를 입력하지 않으셨습니다.");
           document.myform.pw.focus();
           return false;
         }
         
       }
     -->
   </script>
</head>
<BODY onload="begin()" >
    <div class="page-header" style="margin-top:2px;width:80%;">
	  <h1>로그인</h1>
    </div>  
	<form name="myform" action="loginPro.nhn" method="post" onSubmit="return checkIt()">
        <div class="form-group">
   	 		<label for="inputNumber" class="col-sm-2 control-label">사용자 ID</label>
    		<div class="col-sm-4">
    		<input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력해주세요">      
    		</div>
    	</div>
    	<br/><br/>
    	<div class="form-group">
   			<label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
    		<div class="col-sm-4">
    		<input type="password" class="form-control" id="inputPassword" name="pw" placeholder="비밀번호">
   			</div>
    	</div>
    	<br/><br/>
    	<div class="form-group" style="margin-left:400px;">
  			<label for="inputName" class="col-sm-2 control-label"></label>
    		<div class="col-sm-4">
  	  		<input type="hidden" name="hidden" value="nomal">
      		<button type="submit" class="btn btn-primary">로그인</button>
    		</div>
    	</div>
    	<br/>    	
	</form>

</BODY>
</HTML>