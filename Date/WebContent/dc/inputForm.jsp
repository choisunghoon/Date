<%@ page contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

	function option(obj){
		
		var location1=obj.value;
		
		
		var tdlocation1 = document.getElementById("location1");
		if(obj.value=="서울"){
			tdlocation1.innerHTML=
			"<select name='location1' onchange='javascript:option(this);'>"+
        	"<option value='서울' selected>서울</option>"+
        	"<option value='경기도'>경기도</option>"+
        	"<option value='강원도'>강원도</option>"+
        	"<option value='충청도'>충청도</option>"+
        	"<option value='전라도'>전라도</option>"+
        	"<option value='경상도'>경상도</option>"+
        	"</select>"+
				
						"<select name='location'>"+
						"<option value='동대문구'>동대문구</option>"+
						"<option value='강서구'>강서구</option>"+
						"<option value='영등포구'>영등포구</option>"+
						"<option value='강남구'>강남구</option>"+
						"<option value='종로구'>종로구</option>"+
						"</select>"	
		}
		if(obj.value=="경기도"){
			tdlocation1.innerHTML=
				"<select name='location1' onchange='javascript:option(this);'>"+
	        	"<option value='서울'>서울</option>"+
	        	"<option value='경기도'selected>경기도</option>"+
	        	"<option value='강원도'>강원도</option>"+
	        	"<option value='충청도'>충청도</option>"+
	        	"<option value='전라도'>전라도</option>"+
	        	"<option value='경상도'>경상도</option>"+
	        	"</select>"+
				
						"<select name='location'>"+
						"<option value='분당구'>분당구</option>"+
						"<option value='일산동구'>일산동구</option>"+
						"<option value='일산서구'>일산서구</option>"+
						"<option value='단원구'>단원구</option>"+
						"<option value='오정구'>오정구</option>"+
						"</select>"	
		}
		if(obj.value=="강원도"){
			tdlocation1.innerHTML=
				"<select name='location1' onchange='javascript:option(this);'>"+
	        	"<option value='서울'>서울</option>"+
	        	"<option value='경기도'>경기도</option>"+
	        	"<option value='강원도'selected>강원도</option>"+
	        	"<option value='충청도'>충청도</option>"+
	        	"<option value='전라도'>전라도</option>"+
	        	"<option value='경상도'>경상도</option>"+
	        	"</select>"+
				
						"<select name='location'>"+
						"<option value='횡성군'>횡성군</option>"+
						"<option value='영월군'>영월군</option>"+
						"<option value='평창군'>평창군</option>"+
						"<option value='정선군'>정선군</option>"+
						"<option value='철원군'>철원군</option>"+
						"</select>"	
		}
		if(obj.value=="충청도"){
			tdlocation1.innerHTML=
				"<select name='location1' onchange='javascript:option(this);'>"+
	        	"<option value='서울'>서울</option>"+
	        	"<option value='경기도'>경기도</option>"+
	        	"<option value='강원도'>강원도</option>"+
	        	"<option value='충청도'selected>충청도</option>"+
	        	"<option value='전라도'>전라도</option>"+
	        	"<option value='경상도'>경상도</option>"+
	        	"</select>"+
				
						"<select name='location'>"+
						"<option value='청양군'>청양군</option>"+
						"<option value='홍성군'>홍성군</option>"+
						"<option value='예산군'>예산군</option>"+
						"<option value='태안군'>태안군</option>"+
						"<option value='부여군'>부여군</option>"+
						"</select>"	
		}
		if(obj.value=="전라도"){
			tdlocation1.innerHTML=
				"<select name='location1' onchange='javascript:option(this);'>"+
	        	"<option value='서울'>서울</option>"+
	        	"<option value='경기도'>경기도</option>"+
	        	"<option value='강원도'>강원도</option>"+
	        	"<option value='충청도'>충청도</option>"+
	        	"<option value='전라도'selected>전라도</option>"+
	        	"<option value='경상도'>경상도</option>"+
	        	"</select>"+
				
						"<select name='location'>"+
						"<option value='순창군'>순창군</option>"+
						"<option value='고창군'>고창군</option>"+
						"<option value='완주군'>완주군</option>"+
						"<option value='부안군'>부안군</option>"+
						"<option value='무주군'>무주군</option>"+
						"</select>"	
		}
		if(obj.value=="경상도"){
			tdlocation1.innerHTML=
				"<select name='location1' onchange='javascript:option(this);'>"+
	        	"<option value='서울'>서울</option>"+
	        	"<option value='경기도'>경기도</option>"+
	        	"<option value='강원도'>강원도</option>"+
	        	"<option value='충청도'>충청도</option>"+
	        	"<option value='전라도'>전라도</option>"+
	        	"<option value='경상도'selected>경상도</option>"+
	        	"</select>"+
				
						"<select name='location'>"+
						"<option value='청도군'>청도군</option>"+
						"<option value='칠곡군'>칠곡군</option>"+
						"<option value='군위군'>군위군</option>"+
						"<option value='봉화군'>봉화군</option>"+
						"<option value='울릉군'>울릉군</option>"+
						"</select>"	
		}

	}
</script>

<html>
<head>
<title>회원가입</title>

<script language="JavaScript">
    
    function checkIt() {
        var userinput = eval("document.userinput");
        if(!userinput.id.value) {
            alert("ID를 입력하세요");
            return false;
        }
        
        if(!userinput.pw.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        if(userinput.pw.value != userinput.pw2.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }
       
       
    }

    // 아이디 중복 여부를 판단
    function openConfirmid(userinput) {
        // 아이디를 입력했는지 검사
        if (userinput.id.value == "") {
            alert("아이디를 입력하세요");
            return;
        }
        // url과 사용자 입력 id를 조합합니다.
        url = "confirmId.nhn?id=" + userinput.id.value ;
        
        // 새로운 윈도우를 엽니다.
        open(url, "confirm", 
        "toolbar=no, location1=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
    }
    function openConfirmnickname(userinput) {
        // 아이디를 입력했는지 검사
        if (userinput.nickname.value == "") {
            alert("별명 입력하세요");
            return;
        }
        // url과 사용자 입력 id를 조합합니다.
        url = "confirmNickname.nhn?nickname=" + userinput.nickname.value ;
        
        // 새로운 윈도우를 엽니다.
        open(url, "confirm", 
        "toolbar=no, location1=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
    }
</script>


<body>

<form method="post" action="inputPro.nhn" name="userinput" onSubmit="return checkIt()">
  <table width="600" border="1" cellspacing="0" cellpadding="3" align="center" >
    <tr> 
    <td colspan="2" height="39" align="center"  >
       <font size="+1" ><b>회원가입</b></font></td>
    </tr>
    <tr> 
      <td width="200" ><b>아이디 입력</b></td>
      <td width="400" >&nbsp;</td>
    </tr>  

    <tr> 
      <td width="200"> 사용자 ID</td>
      <td width="400"> 
        <input type="text" name="id" size="10" maxlength="12">
        <input type="button" name="confirm_id" value="ID중복확인" OnClick="openConfirmid(this.form)">
      </td>
    </tr>
    <tr> 
      <td width="200"> 비밀번호</td>
      <td width="400" > 
        <input type="password" name="pw" size="15" maxlength="12">
      </td>
    <tr>  
      <td width="200">비밀번호 확인</td>
      <td width="400"> 
        <input type="password" name="pw2" size="15" maxlength="12">
      </td>
    </tr>
    
    <tr> 
      <td width="200" ><b>개인정보 입력</b></td>
      <td width="400" >&nbsp;</td>
    <tr>  
    <tr> 
      <td width="200">사용자 별명</td>
      <td width="400"> 
        <input type="text" name="nickname" size="15" maxlength="10">
        <input type="button" name="confirm_nickname" value="별명중복확인" OnClick="openConfirmnickname(this.form)">
      </td>
    </tr>
    <tr> 
      <td width="200">관심지역</td>
      <td width="400" id="location1"> 
        <select name="location1" onchange="javascript:option(this);">
        	<option value="non">지역을 선택해주세요</option>
        	<option value="서울">서울</option>
        	<option value="경기도">경기도</option>
        	<option value="강원도">강원도</option>
        	<option value="충청도">충청도</option>
        	<option value="전라도">전라도</option>
        	<option value="경상도">경상도</option>
        </select>
      </td>

    </tr>
    
    <tr> 
      <td colspan="2" align="center" > 
          <input type="hidden" name="hidden" value="nomal">
          <input type="submit" name="confirm" value="등   록" >
          <input type="reset" name="reset" value="다시입력">
          <input type="button" value="가입안함" onclick="javascript:window.location='main.nhn'">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
