<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>


<script>
$(document).ready(function()
{
    $('#selectbox').change(function(){
        alert( $('#selectbox option:selected').val() );
    });
});
</script>

<select id="selectbox">
	<option>����</option>
	<option>���</option>
	<option>����</option>
	<option>����</option>
	<option>�泲</option>
	<option>���</option>
	
</select>