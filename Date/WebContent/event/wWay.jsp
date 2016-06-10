<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="JavaScript">

    function way(wWay){
        if (wWay.way.value == "random") {
        	url = "confirmCode.nhn?code=" + itemadd.code.value + "&ctg=" + itemadd.ctg.value;
            open(url, "confirm", 
            "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
        }
        url = "confirmCode.nhn?code=" + itemadd.code.value + "&ctg=" + itemadd.ctg.value;
        open(url, "confirm", 
        "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
    }
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>당첨 선발 방법 선택</title>
</head>
<body>
${enumber }
<form name="wWay" method="post" action="wWay_ch.nhn">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td align="center"><p>
		<input type="checkbox" name="way" value="random">랜덤<input type="checkbox" name="way" value="choice">선택
		   <input type="button" name="wayB"  value="코드중복확인" OnClick="way(this.from)"><br/>
    </td>
  </tr>
  <tr>
  	<td align="center">
  		<input type="submit" value="선택 완료">
  	</td>
  </tr>
</table>
</form>
</body>
</html>