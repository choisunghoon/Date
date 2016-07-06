<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link href="/Date/table.css" rel="stylesheet" type="text/css">
<script language="JavaScript">

   var checkflag = "false";
   function check(field) {
      if (checkflag == "false") {
         for (i = 0; i < field.length; i++) {
            field[i].checked = true;
         }
         checkflag = "true";
         return "모두 해제";
      } else {
         for (i = 0; i < field.length; i++) {
            field[i].checked = false;
         }
         checkflag = "false";
         return "모두 선택";
      }
   }

   function ajaxExample() {
      // name이 같은 체크박스의 값들을 배열에 담는다.
      var checkboxValues = [];
      $("#checkbox:checked").each(function(i) {
         checkboxValues.push($(this).val());
      });

      // 사용자 ID(문자열)와 체크박스 값들(배열)을 name/value 형태로 담는다.
      var allData = {
         "checkArray" : checkboxValues
      };

      $.ajax({
         url : "WcoupleA.nhn?enumber=" + $("#enumber").val(),
         type : 'GET',
         data : allData,
         success : function(data) {
            alert("완료");
            window.location.reload("modifyWcouples.nhn?enumber="
                  + $("#enumber").val() + "&wnumber="
                  + $("#wnumber").val() + "&w=" + $("#w").val());
         },
         error : function(jqXHR, textStatus, errorThrown) {
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
         }
      });
   }
   
	function callAjaxyj6(nhn) {
		window.location.href=nhn;
		
	}
</script> 
<title>당첨자 수정 및 삭제</title>
</head>
<body>
<form name="form" method="post">
<input type="button" name="button" value="모두 선택" onClick="this.value=check(this.form.checkbox)" style="margin-left:43px;">
<a href="#" onclick="ajaxExample()"><img src="/Date/button/z47.png" style="margin-left:3px;"></a>
<a href="wWay.nhn?enumber=${enumber}&wnumber=${wnumber}&w=${w}"><img src="/Date/button/z48.png" style="margin-left:340px;"></a>
<table class="table14_1" width="600" border="1" cellspacing="0" cellpadding="0" align="center" style="table-layout:fixed;">
   <tr>
      <th align="center" width="100">선택</td>
      <th align="center" width="100">커플이름</td>
      <th align="center" width="100">삭제</td>
      <th align="center" width="100">알림</td>
   </tr>
   <c:forEach var="appList" items="${appList}">
   <tr>
      <td align="center" width="100"><input type="hidden" name="enumber" id="enumber" value="${appList.enumber}">
      <input type="hidden" name="wnumber" id="wnumber" value="wnumber">
      <input type="hidden" name="w" id="w" value="${w}">
      <c:if test="${appList.checknum==0}">
      <input name="checkbox" type="checkbox" id="checkbox" value="${appList.anumber}">
      </c:if>
      </td>
      <c:if test="${appList.checknum==-1 || appList.checknum == 1}">
      <input name="checkbox" type="hidden" id="checkbox" value="${appList.anumber}">
      </c:if>
      <td align="center" width="100">${appList.couplename}</td>
      <td align="center" width="100"> 
      <c:if test="${appList.checknum==0}">
      <a href="#" onclick="callAjaxyj6('deleteWcouples.nhn?enumber=${enumber}&wcouples=${appList.couplename}')">
      <img src="/Date/button/z3.png">
      </a>      
      </c:if>
      <c:if test="${appList.checknum==-1 || appList.checknum == 1}">-</c:if>
      </td>   
      <td align="center" width="100">
      <c:if test="${appList.checknum==0}">무</c:if>
      <c:if test="${appList.checknum==-1}">유(읽지않음)</c:if>
      <c:if test="${appList.checknum==1}">유(읽지않음)</c:if>
      </td>
   </tr>
   </c:forEach>
</table>
</form>
</body>
</html>