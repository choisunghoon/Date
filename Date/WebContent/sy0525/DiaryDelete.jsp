<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script type="text/javascript">

		if(confirm("삭제하시겠습니까?")){
			document.location.href="DiaryDeletePro.nhn?num=${num}";
		}
		else{
			window.location.replace("couple.nhn?chk=1");
		}

</script>