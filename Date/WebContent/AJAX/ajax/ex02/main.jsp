<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
      $("#button").click(function(){
          callAjax();
      });
    });
    function callAjax(){
        $.ajax({
	        type: "post",
	        url : "index.jsp",
	        data: {	// url 페이지도 전달할 파라미터
	        	number : $('#number').val(),
       			id : $('#id').val(),
	        	comment : $('#comment').val()
	        },
	        success: test,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
     	});
    }
    function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $("#ajaxReturn").html(aaa);
        console.log(resdata);
    }
    function whenError(){
        alert("Error");
    }
  </script>

	 <form id="frm">
	     	글번호 <input name="number" id="number" /> <br />
	     	아이디 <input name="id" id="id" /> <br />
	     	코멘트 <input name="comment" id="comment" /> <br />
	     	<input id="button" type="button" value="버튼">
	 </form>
	 
	 <div id="ajaxReturn">ajaxReturnOutput</div>

