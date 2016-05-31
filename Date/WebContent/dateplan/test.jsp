<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script language="javascript">
function delItem(){
var aa = document.getElementById('aa'); 
alert(aa.innerHTML);
aa.innerHTML = "";
alert(aa.innerHTML);
}
</script>


<div id="aa" onclick="delItem()">
	<div>asdfsadf</div>
	<span>asdkfjhsakdf</span>
</div>