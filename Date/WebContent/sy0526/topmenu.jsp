<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script language="javascript" src="http://connect.facebook.net/ko_KR/all.js" type="text/javascript"></script>

<html xmlns:fb="http://ogp.me/ns/fb#">
    <div id="fb-root"></div>
  <script type="text/javascript">
  window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '1136320869764141', // �� ID
	      status     : true,          // �α��� ���¸� Ȯ��
	      cookie     : true,          // ��Ű���
	      xfbml      : true           // parse XFBML
	    });
	   
	    FB.getLoginStatus(function(response) {
	        if (response.status === 'connected') {
	        	
	        	
	        	
	        } else if (response.status === 'not_authorized') {
	        
	        	
	        	
	        } else {
	        	
	        	
	        }
	    });
	    
	    FB.Event.subscribe('auth.login', function(response) {
	    	FB.api('/me', function(user) {
	            if (user) {
	            	
	            	
	                window.location.href = 'loginPro.nhn?id='+user.id+'&hidden=fb';
	                
	            }
	        }); 
	    	
	    	//document.location.reload();
	    });
	    FB.Event.subscribe('auth.logout', function(response) {
	    	
	    	
	    	session.invalidate();
	    	document.location.href='main.nhn';
		});
	   
	  }

	  // Load the SDK Asynchronously
	 
		
	</script>
	<c:if test="${id eq 'undefined' }">
	<% 
		session.invalidate();
		response.sendRedirect("main.nhn");
		%>
	</c:if>
	<c:if test="${id ne null and nickcheck eq 1}">
	<script>
		alert("������ �Է����� �����ø� ����Ʈ �̿뿡 ������ �˴ϴ�.ȸ������ ���� �޴����� ������ �Է����ּ���");
	</script>
	</c:if>
   <script type="text/javascript">
    function asdf(nhn){
        $.ajax({
	        type: "post",
	        url : nhn,
	        
	        success: test,	// ��������û ������ ���� �Լ�
	        error: whenError	//��������û ���н� �����Լ�
     	});
    }
    function test(aaaa){	// ��û������ ������������ aaa ������ �ݹ�ȴ�. 
        $(".modal-body").html(aaaa);
        
    }
    function whenError(){
        alert("Error");
    }
  </script>
    <style type="text/css">
#topclass{
	width:1335px;
	height:630px;}

#topmenu{
	background-color:#FFFFFF !important; 
	margin-top:50px;
	width:1335px; 
	height:45px; 
	opacity:0.7;}
.top{
	padding-left:373px;}
.top1{
	float:left; 
	list-style:none; 
	padding-right:10px; 
	height:10px; 
	line-height:50px; 
	font-size:15px;
	}
.top2{
	float:left;
	list-style:none; 
	padding-left:80px;
	height:10px;
	line-height:50px;
	font-size:15px;}
a{ 
	border:0;
	}
a:link, a:visited{ 
	color:#000; 
	text-decoration:none;
	}
a:hover{ 
	font-weight:bold;
	}

</style>
<div class="container">

	<!-- ��� �˾� -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">��</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">Modal title</h4>
	      </div>
	      <div class="modal-body">
		
	      </div>
	      
	    </div>
	  </div>
	</div>

</div>



<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>




<div id="topclass">
<div id="topmenu">

<ul class="top">
		<li class="top1"><a href="couple.nhn">Ŀ�� ������</a>&nbsp; /</li>
		<li class="top1"><a href="share.nhn">���������Խ���</a>&nbsp; /</li>
		<li class="top1"><a href="theme.nhn">�׸��� ����Ʈ�ڽ�</a>&nbsp; /</li>
		<li class="top1"><a href="event.nhn">�̺�Ʈ ������</a>&nbsp; /</li>
		
		<li class="top1">
		<c:if test="${id eq null }">

            <a href="#" onclick="asdf('loginForm.nhn')" data-toggle="modal" data-target="#myModal" >�α���</a>&nbsp; /&nbsp; <a href="#" onclick="asdf('inputForm.nhn')" data-toggle="modal" data-target="#myModal" >ȸ������</a>&nbsp; /  &nbsp; 
            <div class="fb-login-button" data-max-rows="1" data-size="medium" data-show-faces="false" data-auto-logout-link="true"></div>
			
            
</c:if>
     <c:if test="${(id ne null) and (check eq 'yes')}">

            ${ id}�� ȯ���մϴ�.&nbsp;&nbsp;&nbsp;&nbsp;
     
             <div class="fb-login-button" data-max-rows="1" data-size="medium" data-show-faces="false" data-auto-logout-link="true"></div>&nbsp;&nbsp;
             <a href="mypage.nhn?fbcheck=yes&id=${id}">����������</a>
 </c:if>
 <c:if test="${(id ne null) and (check eq 'no')}">

            ${ id}�� ȯ���մϴ�.&nbsp;&nbsp;&nbsp;&nbsp;
            
		  
          <a href="logout.nhn">�α׾ƿ�</a>&nbsp;&nbsp;
          <a href="mypage.nhn?fbcheck=no&id=${id}">����������</a>

 </c:if>
</div>
		</li>
		
</ul>
</div>