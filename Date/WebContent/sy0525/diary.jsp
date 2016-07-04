<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
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

<form name="rg" id="rg" action = "updateImage.nhn" method="post" enctype="multipart/form-data" onsubmit="return checkfile();" style="margin-left:80px;">
<center>
<div id="uploadPreview"></div>
</center>
<input type="file" name="save" id="choose" style="margin-left:305px;"/>

<script type="text/javascript">
function readImage(file) {
	$('#uploadPreview').empty();
    var reader = new FileReader();
    var image  = new Image();
    reader.readAsDataURL(file);  
    reader.onload = function(_file) {
        image.src    = _file.target.result;              // url.createObjectURL(file);
        image.onload = function() {
       
            var w = this.width,
                h = this.height,
                n = file.name
                var wwd=200;  
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

<script>


	function img(){
		if(confirm("기본이미지로 변경하시겠습니까?")){
			document.location.href="default.nhn";
		}
		else{
			window.location.replace("couple.nhn?chk=1");
		}
	}

   function callrefresh(url){
	   document.rg.submit();
	   var form = $('#rg')[0];
	   var formdata = new FormData(form);
	   formdata.append("save",$("#choose")[0].files[0]);
        $.ajax({
	        type: "post",
	        url : url,
	        data : formdata,
	        contentType : false,
	        processData: false,
	        success: suc,	// 페이지요청 성공시 실행 함수
	        error: err	//페이지요청 실패시 실행함수
     	});
    }
    function suc(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $(".re").html(aaa);
    }
    function err(){
        alert("Error");
    }
    </script>

<input type="hidden" id="w" name ="w" value=""/>
<input type="hidden" id="h" name ="h" value=""/>
<div style="margin-left:310px;">
<input type="image" name="submit" value="submit" src="button/z5.png" />
<input type="button" value="기본이미지로변경" onclick="img()"/>
</div>
</form>