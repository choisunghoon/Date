<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
   function callrefresh(couplename){
	   alert(couplename);
	   var form = $('#write')[0];
	   var formdata = new FormData(form);
	   formdata.append("save",$("#choose")[0].files[0]);
	   formdata.append("couplename",couplename);
	   formdata.append("w",$("#w").val());
	   formdata.append("h",$("#h").val());
	   formdata.append("subject",$("#subject").val());
	   formdata.append("content",$("#content").val());
        $.ajax({
	        type: "post",
	        url : "/Date/upload2.nhn",
	        data : formdata,
	        contentType : false,
	        processData: false,
	        success: suc,	// 페이지요청 성공시 실행 함수
	        error: err	//페이지요청 실패시 실행함수
        });
    } 
    function suc(aaaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
    	$("#subMain").html(aaaa);        
    }
    function err(){
        alert("Error");
    }
    </script>
    
<script type="text/javascript">
function readImage(file) {
    var reader = new FileReader();
    var image  = new Image();
    reader.readAsDataURL(file);  
    reader.onload = function(_file) {
        image.src    = _file.target.result;              // url.createObjectURL(file);
        image.onload = function() {
            var w = this.width,
                h = this.height,
                n = file.name
                var wwd=1000;  
                var hhd=1000;  
           document.getElementById('w').value=w;
           document.getElementById('h').value=h;
          if(w > wwd || h > hhd)
          {  
        	  alert("이미지가 큽니다!");
        	  document.getElementById('choose').value="";
        	  return false;
              
          }
     
        };
        image.onerror= function() {
            alert('Invalid file type: '+ file.type);
        };      
    };
}
$("#choose").change(function (e) {
    if(this.disabled) return alert('File upload not supported!');
    var F = this.files;
    if(F && F[0]) for(var i=0; i<F.length; i++) readImage( F[i] );
});

function check(){
	if($("#choose")[0].files[0] == null){
		alert("파일을 선택해주세요!");	
		return false
	}
	if(!document.write.subject.value){
		alert("제목을 입력해주세요!");	
		return false
	}
	if(!document.write.content.value){
		alert("내용을 입력해주세요!");	
		return false
	}
}
 
</script>
</head>
<body>

<form id="write" action="upload2.nhn" onsubmit="return check();"name="write" method="post" enctype="multipart/form-data" style="margin-left:180px;margin-top:10px;">
	<table border="1" colspadding="0" cellspacing="0" >
		<tr>	
			<td>
				제목 
			</td>
			<td>
				<input type="text" name="subject" id="subject"/>
			</td> 
		</tr>
		<tr>
    		<td>
    			첨부파일
    		</td>  
    		<td>
    			<input type="file" name="save" id="choose" multiple="multiple" />
			</td>    	
    	</tr>
    	<!-- 
    	<tr align="right">
    		<td colspan="2">
    			<input type="checkbox" name="pool" id="pool" value="1">
    			<label for="pool">공유하기&nbsp;&nbsp;&nbsp;</label>
    		</td>
    	</tr>
    	 -->
    	<tr>
    		<td>
    			내용
    		</td>
    		<td>
    			<textarea name="content" theme="simple" cols="50" rows="10" id="content" ></textarea>
			</td>
    	</tr>
    </table>
<!-- 
	<div id="uploadPreview"></div>
 -->
 

<input type="hidden" id="w" name ="w" value=""/>
<input type="hidden" id="h" name ="h" value=""/>
<div style="margin-left:185px; margin-top:10px;float:left;">
<input type="image" name="submit" value="submit" src="button/z5.png"/>&nbsp;
</div>
<div style="margin-top:10px;">
<img src="button/z53.png" onclick="reset()">
</div>
</form>

</body>
</html> 
