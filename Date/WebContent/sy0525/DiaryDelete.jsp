<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript">

		if(confirm("�����Ͻðڽ��ϱ�?")){
			document.location.href="DiaryDeletePro.nhn?num=${num}";
		}
		else{
			document.location.href="diaryMenu.nhn";
		}

</script>