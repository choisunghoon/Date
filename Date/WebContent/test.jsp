<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script>
	function test(){
		alert($("#ffff").val());
		var a = $("#asdf").val();
		$("#re").html(a);
	}
</script>

<textarea id="ffff">
	
</textarea>
<input type="button" onclick="test()" class="asdf" />
<div id="re">
	
</div>