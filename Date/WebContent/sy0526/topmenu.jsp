<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript">
    function asdf(){
        $.ajax({
	        type: "post",
	        url : "inputForm.nhn",
	        
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
		<li class="top1"><a href="personal.nhn">���� ������</a></li>
		<li class="top2"><a href="#" >�α���</a>&nbsp; /&nbsp; <a href="#" onclick="asdf()" data-toggle="modal" data-target="#myModal" >ȸ������</a></li>
		
</ul>
</div>