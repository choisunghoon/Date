<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
	img{
		width:200px; height:200px;}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	function checkfile(){
		var frm = eval("document.rg");
		
		if(!frm.save.value){
			alert("�̹����� ����ϼ���!");
			return false;
		}		
	}
</script>

<form name="rg" action="updateImage.nhn" method="post" enctype="multipart/form-data" onsubmit="return checkfile();">
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

<input type="hidden" id="w" name ="w" value=""/>
<input type="hidden" id="h" name ="h" value=""/>
<input type="submit" value="����"/>
<input type="button" value="���" onClick="javascript:location.href='diaryMenu.nhn'"/>
</form>