<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 
<script type="text/javascript">
	function callAjax(){
		
	    $.ajax({
	    	
	        type: "post",
	        url : "statepro.nhn",
	        data: {	// url 페이지도 전달할 파라미터
	        	states : $('#states').val(),
	   			regdate1 : $('#regdate1').val(),
	        	couplename1 : $('#couplename1').val()
	        },
	        
	 	});
	    self.close();
	    opener.parent.callAjax('adphoto.nhn');
	    // opener.location.load();
	    
	}
</script>

<form name="form" method="post">
	<select name="states" id="states">
		<option value="1">신청</option>
		<option value="2">진행중</option>
		<option value="3">진행완료</option>
	</select>
	<input type="hidden" value="${regdate }" name="regdate1" id="regdate1" />
	<input type="hidden" value="${couplename }" name = "couplename1" id="couplename1"/>
	<input type="button" value="확인"  onclick="callAjax()">
</form>
    