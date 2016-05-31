<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript">

		if(confirm("삭제하시겠습니까?")){
			document.location.href="DiaryDeletePro.nhn?num=${num}";
		}
		else{
			document.location.href="diaryMenu.nhn";
		}

</script>