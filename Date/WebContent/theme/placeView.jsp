<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<html xmlns="http://www.w3.org/1999/xhtml">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script type="text/javascript">
	function callAjax(){
    	$.ajax({
      	  type: "post",
     	  url : "shareDiaryLikeCount.nhn?num=${dto.num}&couplename=${couplename}",
        
          success: refresh,	// 페이지요청 성공시 실행 함수
      	  error: whenError	//페이지요청 실패시 실행함수
 		});
    	
        function whenError(){
            alert("Error");
        }
        function refresh(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
            $("#ajaxReturn1").html(aaa);
        }
	}
</script>
<body>

                <table width="500" border="1" cellspacing="0" cellpadding="3" align="center">
    				<tr height="30">
    					<td align="center" colspan="2"> 코스 상세 정보</td>
    				</tr>
    				<tr>
						<td align="center" width="50">코스 이름</td>
						<td align="center">${dto.loc_name}</td>
					</tr>
					<tr>
						<td align="center" width="50">한줄평</td>
						<td align="center">${dto.loc_content}</textarea></td>
					</tr>
					<tr>
						<td align="center" width="50">평 점</td>
						<td align="center">${dto.rate}
					</td>
					<tr>
						<td align="center" width="50">조회수</td>
						<td align="center" >${dto.readCount}
    				<tr height="30">
    					<td align="center" width="50">장소사진</td>
						<td align="center" width="700"><img src="theme/themeimg/${dto.loc_pic}" alt=""></td>
					</tr>
					<tr height="30">
    					<td align="center" width="50">장소사진</td>
						<td align="center" width="700"><img src="theme/themeimg/${dto.loc_pic1}" alt=""></td>
					</tr>
					<tr height="30">
    					<td align="center" width="50">장소사진</td>
						<td align="center" width="700"><img src="theme/themeimg/${dto.loc_pic2}" alt=""></td>
					</tr>
					<tr height="30">
    					<td align="center" width="50">장소사진</td>
						<td align="center" width="700"><img src="theme/themeimg/${dto.loc_pic3}" alt=""></td>
					</tr>
				</table>
				</br>
				<form method="post">
					<input type="button" name="reply" value="댓글 보기"  href="#" onclick="callAjax2('dairyComment.nhn')" /> 
 					<span id="ajaxReturn1" > </span><br/>
				</form>
