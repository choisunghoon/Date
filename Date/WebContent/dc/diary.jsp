<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<style>
	img{
		width:200px; height:200px;}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	function checkfile(){
		var frm = eval("document.rg");
		
		if(!frm.save.value){
			alert("이미지를 등록하세요!");
			return false;
		}		
	}
</script>
<form name="rg" action="updateImage1.nhn?coupleName=${coupleName }" method="post" enctype="multipart/form-data" onsubmit="return checkfile();">
<div id="uploadPreview" style="width:200; height:200; border:1px solid;"></div>
<input type="file" name="save" id="choose"/>

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

              $('#uploadPreview').append('<img src="'+ this.src +'"> '+'<br>');
    
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
<br>
<input type="hidden" id="w" name ="w" value=""/>
<input type="hidden" id="h" name ="h" value=""/>
<input type="submit" value="전송"/>
<input type="button" value="취소" onClick="selfclose()"/>
</form>
<script language="javascript">
  function selfclose()
    {	self.close();	}
</script>
<c:if test="${close eq 'yes' }">
<script language="javascript">
	$(document).ready(function() {
		self.close();
	});
</script>
</c:if>