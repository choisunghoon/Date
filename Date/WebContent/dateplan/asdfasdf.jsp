<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <html>
 <body>
<form action="test2.jsp">
<input type="hidden" name="w" id="test" value=""/>
<input type="button" onclick="test()" />
<input type="submit"  value="����"/> 
</form>
<script language="javascript">
	
		var ts = 7;
		document.getElementById('test').value=ts;
		
	
</script>
</body>
</html>