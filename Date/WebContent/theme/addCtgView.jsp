<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript">  
    function callContent(ctg_num){    
    	 $.ajax({    		
 	        type: "post", 	 
 	        url : "ctgModify.nhn?ctg_num="+ctg_num,
 	        success: test,	// ��������û ������ ���� �Լ�
 	        error: whenError	//��������û ���н� �����Լ�
      	});
    }
    function callContent1(ctg_num, cos_num){    
    	 $.ajax({    		
    	 	 type: "post", 	 
    	 	 url : "addPlace.nhn?ctg_num="+ctg_num+"&cos_num="+cos_num,
    	 	 success: test,	// ��������û ������ ���� �Լ�
    	 	 error: whenError	//��������û ���н� �����Լ�
    	 });

    	 document.getElementById("enumber2").value=enumber;
    }
    function callApp(){    	
   	 $.ajax({
   		//data : {"enumber" : enumber},
	        type: "post", 	        
	        url : "addApp.nhn?enumber="+document.getElementById("enumber2").value,
	        success: test1,	// ��������û ������ ���� �Լ�
	        error: whenError	//��������û ���н� �����Լ�
     	});
   }
    function test(aaa){	// ��û������ ������������ aaa ������ �ݹ�ȴ�. 
        $(".modal-body").html(aaa);	//id�� ajaxReturn�� �κп� �־��
    }
    function test1(aaa){	// ��û������ ������������ aaa ������ �ݹ�ȴ�. 
        $(".modal-body1").html(aaa);	//id�� ajaxReturn�� �κп� �־��
    }
    
    function whenError(){
        alert("Error");
    }
  </script>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<style>
.gallery{display :block; width :100%; line-height :1.6em;}
.gallery ul{margin :0; padding :0; list-style :none;}
.gallery li{display :block; float :left; width :350px; margin :35px 5px 5px 35px; padding :0;}
.gallery li.last{margin-right :0;}
.gallery li img{display : block; width : 340px; height : 430px;}
</style>
</head>
<body>
<input type="button" value="ī�װ��� �߰�" align="center" onclick="document.location.href='addCtg.nhn'">
<input type="button" value="ī�װ��� ����" align="center" onclick="callContent(${ctg_num})" id="test" data-toggle="modal" data-target="#myModal">

<div class="gallery"> 
  <ul>
    <c:set var="i" value="1"/>
    <c:forEach var="ctgList" items="${ctgList}">  
     <c:if test="${(i%3)!=0}">
      <li><a href="course.nhn?ctg_num=${ctgList.ctg_num}"><img src="${ctgList.ctg_img}" alt=""></a>${ctgList.ctg_name} ī��Ʈ:${count} i:${i}</li>
     </c:if>
     <c:if test="${(i%3)==0}">
      <li class="last"><a href="course.nhn?ctg_num=${ctgList.ctg_num}"><img src="${ctgList.ctg_img}" alt=""></a>${ctgList.ctg_name} ī��Ʈ:${count} i:${i}</li>
     </c:if>
     <c:set var="i" value="${i+1}"/>
    </c:forEach>
  </ul>
</div> 

<!-- ��� �˾� -->
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-focus-on="input:first">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">��</span><span class="sr-only">�ݱ�</span></button>
		<h4 class="modal-title" id="myModalLabel">Modal titlezzz</h4>
	      </div>
	      <div class="modal-body">
		   
	      </div>
	      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
	      </div>
	    </div>
	  </div>
	</div>
	

	

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js --> 

</body>