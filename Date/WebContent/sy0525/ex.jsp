<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</head>
<body>

<form action="upload2.nhn" method="post" enctype="multipart/form-data" >
	<table border="1" colspadding="0" cellspacing="0">
		<tr>	
			<td>
				���� 
			</td>
			<td>
				<input type="text" name="subject"/>
			</td> 
		</tr>
		<tr>
    		<td>
    			÷������
    		</td>  
    		<td>
    			<input type="file" name="save" id="choose" multiple="multiple" />
			</td>    	
    	</tr>
    	<tr align="right">
    		<td colspan="2">
    			<input type="checkbox" name="pool" id="pool" value="1">
    			<label for="pool">�����ϱ�&nbsp;&nbsp;&nbsp;</label>
    		</td>
    	</tr>
    	<tr>
    		<td>
    			����
    		</td>
    		<td>
    			<textarea name="content" theme="simple" cols="50" rows="10" ></textarea>
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
                var wwd=1000;  
                var hhd=1000;  
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

<input type="submit" value="���" />
<input type="reset" value="�ٽ��ۼ�"/>
<input type="button" value="���" onClick="javascript:location.href='diaryMenu.nhn'" />
</form>

</body>
</html> 