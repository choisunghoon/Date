<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</head>
<body>

<form action="DiaryModifyPro.nhn?num=${ddb.num}&couplename=${couplename}" method="post" enctype="multipart/form-data" style="margin-left:25px;margin-top:10px;">
	<table border="1" colspadding="0" cellspacing="0">
		<tr>	
			<td>
				제목 
			</td>
			<td>
				<input type="text" name="subject" value="${ddb.subject}"/>
			</td> 
		</tr>
		<tr>
    		<td>
    			첨부파일
    		</td>  
    		<td>
    			<input type="file" name="save" id="choose" multiple="multiple" /><br/>
    			<c:if test="${ddb.img != null }">
				&nbsp; * ${ddb.img } 파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
				</c:if>
			</td>    	
    	</tr>
    	<tr>
    		<td>
    			내용
    		</td>
    		<td>
    			<textarea name="content" theme="simple" cols="50" rows="10" >${ddb.content }</textarea>
			</td>
    	</tr>
    </table>
    <!-- 
	<div id="uploadPreview"></div>
 -->
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
                var wwd=420;  
                var hhd=200;  
           document.getElementById('w').value=w;
           document.getElementById('h').value=h;
          if(w > wwd || h > hhd)

          {  
  
              return false;
          }
          
    
        
          if(w <= wwd && h <= hhd)

          {  
             

              $('#uploadPreview').append('<img src="'+ this.src +'"> '+w+'x'+h+' '+n+'<br>');
         
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

 
</script>
<input type="hidden" id="w" name ="w" value=""/>
<input type="hidden" id="h" name ="h" value=""/>
<div style="margin-left:375px; margin-top:10px;">
<input type="submit" value="수정" />
</div>
</form>

</body>
</html> 