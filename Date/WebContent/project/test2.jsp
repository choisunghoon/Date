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
	<option>서울</option>
	<option>경기</option>
	<option>전남</option>
	<option>전북</option>
	<option>충남</option>
	<option>충북</option>
	
</select>