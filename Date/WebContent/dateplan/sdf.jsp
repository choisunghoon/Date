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
	  <h1>ȸ������ <small>�Ϲ�ȸ������</small></h1>
    </div>
    
    <form class="form-horizontal">
    
    <div class="form-group">
    <label for="inputNumber" class="col-sm-2 control-label">����� ID</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="inputNumber" placeholder="���̵� �Է����ּ���">
      
    </div>
      <div class="col-sm-2">
      <a class="btn btn-default" href="#" role="button">���̵� �ߺ� Ȯ��</a>
      </div>
    </div>
    
    <div class="form-group">
    <label for="inputPassword" class="col-sm-2 control-label">��й�ȣ</label>
    <div class="col-sm-6">
    <input type="password" class="form-control" id="inputPassword" placeholder="��й�ȣ">
    
    </div>
    </div>
       <div class="form-group">
    <label for="inputPasswordCheck" class="col-sm-2 control-label">��й�ȣ Ȯ��</label>
    <div class="col-sm-6">
    <input type="password" class="form-control" id="inputPasswordCheck" placeholder="��й�ȣ Ȯ��">
      <p class="help-block">��й�ȣ�� �ѹ� �� �Է����ּ���.</p>
    </div>
    </div>
     <div class="form-group">
    <label for="inputNumber" class="col-sm-2 control-label">����� ����</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="inputNumber" placeholder="���̵� �Է����ּ���">
      
    </div>
      <div class="col-sm-2">
      <a class="btn btn-default" href="#" role="button">���� �ߺ� Ȯ��</a>
      </div>
    </div>
   
    
    
      <div class="form-group">
    <label for="inputAgree" class="col-sm-2 control-label">��������</label>
    <div class="col-sm-6 checkbox">
      
      <td width="400" id="location1"> 
        <select name="location1" onchange="javascript:option(this);">
        	<option value="non">������ �������ּ���</option>
        	<option value="����">����</option>
        	<option value="��⵵">��⵵</option>
        	<option value="������">������</option>
        	<option value="��û��">��û��</option>
        	<option value="����">����</option>
        	<option value="���">���</option>
        </select>
      </td>
    </div>
    </div>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label"></label>
    <div class="col-sm-6">
      <button type="submit" class="btn btn-primary">ȸ������</button>
    </div>
    </div>
    </form>
  </article>
</div>

</body>
</html>