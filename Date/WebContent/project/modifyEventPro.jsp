<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	function callMD(){		
	    $.ajax({	    	
	        type: "post",
	        url : "adminEvent.nhn",        	        
	 	});	    
	    self.close();
	    opener.location.reload();
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
</body>
</html>