<%@ page language="java" contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@include file="/dc/main.jsp" %>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<div >

<div>회원정보</div>
<ul>
<li><input type="button" id="execute" value="회원정보변경"/></li>
<c:if test="${check eq 'no' }">
<li><a href="deleteForm.nhn">회원 탈퇴</a></li>
</c:if>
</ul>

<div>커플정보</div>
<ul>
<li><a href="">커플 신청 & 수락</a></li>
<li><a href="">커플 삭제</a></li>
</ul>
<div>마이코스</div>
<ul>
<li><a href="">코스 리스트</a></li>
</ul>
</div>
<p>time : <span id="time"></span></p>

<script>
    $('#execute').click(function(){
    	alert("asdfasdf");// 占승깍옙 클占쏙옙占쏙옙(execute) 찾占쏙옙 클占쏙옙占싱븝옙트占쌩삼옙占쏙옙 占쏙옙占쏙옙
        $.ajax({
            url:'/Date/dc/index.jsp?id=java',	//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙.
            type:'post',				//占쏙옙占쌜뱄옙占쏙옙
            success:function(data){		//占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙..占쏙옙占쏙옙占싹댐옙 占쌉쇽옙..
                $('#time').append('<font color=red>'+data+'</font>');
            }
        })
    })
</script>