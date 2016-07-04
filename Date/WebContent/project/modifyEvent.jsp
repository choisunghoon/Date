<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
html { padding:0; margin:0;}
body, div{font:9pt Dotum, "돋움", Arial, sans-serif;}
div, img, form { border: 0 none; margin: 0; padding: 0; }
form input, form select, {vertical-align:middle;}
/* anchor font */
a {text-decoration:none;}
a {color:#000;}
a:hover, a:focus, a:active {color:#000;}
.forms { border:1px solid #cfcfcf; height:16px; padding:2px 0 0 2px;}
.mini_calendar {float:left;width:152px;border:1px solid #cccccc;padding:1px;background-color:#e8e7dc;}
.mini_calendar .navi {padding:0;margin:1px;border:1px solid #ccc;padding:2px;background-color:#f8f7f6;}
.mini_cal_tbl {border-collapse: collapse; border-spacing: 0; width: 100%; table-layout:fixed;}
.mini_cal_tbl thead th {width:20px; height:20px;text-align:center;font-size:11px;}
.mini_cal_tbl tbody td {width:20px; height:20px;text-align:center;}
.mini_cal_tbl tbody td div {width:18px;height:16px;border:1px solid #ccc;margin:1px; padding-top:2px;background-color:#f8f7f6;font-size:11px;cursor:pointer;}
.mini_cal_tbl tbody td div:hover {background-color: #ECF4A2;}
.mini_cal_tbl .current {background-color:#ffffcc;font-weight:bold;}
.mini_cal_tbl .sun {color:#ff0033;}
.mini_cal_tbl .sat {color:#0033cc;}
.mini_cal_tbl .empty{border:0;background-color:#e8e7dc}
</style>
<script language="JavaScript">
// 달력을 출력할 부분의 아이디 설장
var calendarID  = "sdate";
var calendarID2 = "edate";
var mode = false;
var sday = "";
var eday = "";
var yearS,yearE;
var _configSelect;
var _configTarget;
var _configSetDay=90;

// 오늘 날짜 구하기
var cDate   = new Date();
var cYear  = cDate.getFullYear();
var cMonth = parseInt(cDate.getMonth())+1;	// 월 값은 실제값 보다 -1 한 값임
var cDay	 = cDate.getDate();
if(!yearS) yearS = 2010;
if(!yearE) yearE = parseInt(cYear + 2);

// 선택된 현재 날짜
var selYear  = cYear;
var selMonth = cMonth;
var selDay   = cDay;

// 날짜 자리사 2자리로 변경
function _setFillZero(d) {
	var str = new String();
	if (parseInt(d) < 10) {
		str = "0" + parseInt(d);
	} else {
		str = "" + parseInt(d);
	}
	return str;
}

// 날짜 포멧
function formatDate(date) {
	var mymonth = date.getMonth() + 1;
	var myweekday = date.getDate();
	return (date.getFullYear() + "-" + ((mymonth < 10) ? "0" : "") + mymonth + "-" + ((myweekday < 10) ? "0" : "") + myweekday);
}

function _setDDayChange(date) {
	var tmpDT = date.split("-");
	var tmpYear  = tmpDT[0];
	var tmpMonth = tmpDT[1];
	var tmpDay   = tmpDT[2];
	var tmpDate = new Date(tmpYear,tmpMonth-1,tmpDay);
	tmpDate.setDate(tmpDate.getDate() + _configSetDay);
	var rtnDate = formatDate(tmpDate);
	return rtnDate;
}

// 년도 관련 콤보박스 출력
function _setYear(pos) {
	var sel='';
	var regHTML = ' <select id="chk_year" onchange="_goCalendar(this.value,'+selMonth+',\'\',\''+pos+'\');">';
	for(var i=yearS; i<=yearE; i++) {
		if(i==selYear) sel = ' selected=selected';
		else sel = '';
		regHTML += '<option value="'+i+'"'+sel+'>'+i+'</option>';
	}
	regHTML += '</select> ';
	return regHTML;
}

// 시간 관련 콤보박스 출력
function _setMonth(pos) {
	var sel='';
	var regHTML = '<select id="chk_month" onchange="_goCalendar('+selYear+',this.value,\'\',\''+pos+'\');">';
	for(var i=1; i<=12; i++) {
		if(i == selMonth) sel = ' selected=selected';
		else sel = '';
		regHTML += '<option value="'+i+'"'+sel+'>'+i+'</option>';
	}
	regHTML += '</select>';
	return regHTML;
}

function getHoliday(month,day,flag) {

	var date = String(month) + String(day);
	var rtn = '';

	// 양력공휴일
	var holidays = new Array();
	holidays['11']	= "설날";
	holidays['12']	= "설날연휴";
	holidays['31']	= "삼일절";
	holidays['55']	= "어린이날";
	holidays['66']	= "현충일";
	holidays['717']	= "제헌절";
	holidays['815']	= "광복절";
	holidays['103']	= "개천절";
	holidays['1225']= "성탄절";

	rtn = holidays[date];
	if(typeof(rtn) == 'undefined') rtn = '';

	return rtn;
}

// 이전달 다음달
function _goCalendar(year,month,day,pos) {
	if(!year) year = cYear;
	SetShowCalendar(year,month,day,pos);
}

// 날짜 비교
function _compareDate(d1, d2) {

  var tmpd1 = d1.split("-");
	var tmpd2 = d2.split("-");
	var dt1 = new Date(tmpd1[0],tmpd1[1],tmpd1[2]);
	var dt2 = new Date(tmpd2[0],tmpd2[1],tmpd2[2]);
	var diff = dt2.getTime() - dt1.getTime();
	diff = Math.floor(diff / (1000 * 60 * 60 * 24));
	return diff;
}

// 날짜 선택
function _selDate(dt,pos) {
	if(mode) {
		var diff = 0;
		var day1 = document.getElementById(sday).value;
		var day2 = document.getElementById(eday).value;
	}

	if(pos == "1") {
		if(day2) {
			diff = _compareDate(dt, day2);
			if(diff < 0) {
				alert('선택한 시작일이 종료일 보다 큽니다');
				document.getElementById(sday).value = '';
			} else {
				document.getElementById(sday).value = dt;
			}
		} else {
			document.getElementById(sday).value = dt;
		}
		if(!mode) calRemove();
	} else if(pos == "2") {
		if(day1) {
			diff = _compareDate(dt, day1);
			if(diff > 0) {
				alert('선택한 종료일이 시작일보다 작습니다');
				document.getElementById(eday).value = '';
			} else {
				document.getElementById(eday).value = dt;
			}
		} else {
			document.getElementById(eday).value = dt;
		}
	}
	if(mode)
		if(document.getElementById(sday).value &&  document.getElementById(eday).value) calRemove();

	// 선택시 자동 날짜 계산 출력
	//if(_configSelect == "wm_wed_dday" && sday == _configTarget) {
	//	var dday = _setDDayChange(dt,90);
	//	jQuery('#'+_configSelect).val(dday);
	//}
}

function calRemove() {
	if (document.getElementById(calendarID))   document.body.removeChild(document.getElementById(calendarID));
	if (document.getElementById(calendarID2))  document.body.removeChild(document.getElementById(calendarID2));
	if (document.getElementById('mini_frame')) document.body.removeChild(document.getElementById('mini_frame'));
}

// 달력 띄우기
function miniSetCalendar(event,sd,ed,ox,oy) {
	var canvas2 = document[ 'CSS1Compat' == document.compatMode ? 'documentElement' : 'body'];
	sday = sd;
	var ox = 0 ;
var oy = 0 ;

	var x = (document.layers) ? e.pageX : canvas2.scrollLeft+event.clientX;
	var y = (document.layers) ? e.pageY : canvas2.scrollTop+event.clientY;
	var w = "156";
	var h = "160";

	var w2 = "156"
	var h2 = "160";
	if( typeof(ed) != "undefined" && ed != "" ) {
		w2 = "328";
		x2 = x + parseInt(w) + 8 + parseInt(ox) + "px";
		mode = true;
		eday = ed;
		h2 = "195";
	} else {
		mode = false;
	}
	calRemove();
	var iFrame = document.createElement("iframe");
  iFrame.id = "mini_frame";
  iFrame.style.width  = w2 + "px";
  iFrame.style.height = h2 + "px";
  iFrame.style.left   = x + parseInt(ox) + "px";
  iFrame.style.top    = y + parseInt(oy) + "px";
	iFrame.frameBorder  = "0";
  iFrame.scrolling    = "no";
  iFrame.style.position = "absolute";
	iFrame.style.zIndex  = "999";
  document.body.appendChild(iFrame);

  var calDiv = document.createElement("div");
  calDiv.id = calendarID;
  calDiv.style.width   = w + "px";
  calDiv.style.height  = h + "px";
  calDiv.style.zIndex  = "1000";
  calDiv.frameBorder   = "0";
  calDiv.scrolling = "no";
  calDiv.style.position = "absolute";
  calDiv.style.left = x + parseInt(ox) + "px";
  calDiv.style.top = y + parseInt(oy) + "px";
  document.body.appendChild(calDiv);
	SetShowCalendar(selYear,selMonth,selDay,'1');

  if( mode ) {
		var calDiv2 = document.createElement("div");
		calDiv2.id = calendarID2;
		calDiv2.style.width   = w + "px";
		calDiv2.style.height  = h + "px";
		calDiv2.style.zIndex  = "1000";
		calDiv2.frameBorder   = "0";
		calDiv2.scrolling = "no";
		calDiv2.style.position = "absolute";
		calDiv2.style.left = x2;
		calDiv2.style.top = y + parseInt(oy) + "px";
		document.body.appendChild(calDiv2);
		SetShowCalendar(selYear,selMonth,selDay,'2');
	}
}

// 월간 일정 출력
function SetShowCalendar (sYear, sMonth, sDay, pos) {
	var today;	 // 오늘 날짜
	var lnuar;	 // 음력
	var holiday; // 공휴일여부
	var lastDay	= new Array(0,31,28,31,30,31,30,31,31,30,31,30,31);
	var weekName = new Array("일","화","수","목","금","토");

	if (!sYear)  sYear  = cYear;
	if (!sMonth) sMonth = cMonth;
	if (!sDay)   sDay   = cDay;

	sYear  = parseInt(sYear);
	sMonth = parseInt(sMonth);
	sDay	 = parseInt(sDay);

	selYear  = sYear;
	selMonth = sMonth;
	selDay   = sDay;

	switch(sMonth) {
		case 1:
			prevYear	= sYear -1;
			prevMonth = 12;
			nextYear	= sYear;
			nextMonth = 2;
			break;
		case 12:
			prevYear	= sYear;
			prevMonth = 11;
			nextYear	= sYear + 1;
			nextMonth = 1;
			break;
		default:
			prevYear	= sYear;
			prevMonth = parseInt(sMonth) - 1;
			nextYear	= sYear;
			nextMonth = parseInt(sMonth) + 1;
			break;
	}

	var firstDay	= new Date(sYear, sMonth-1, 1);					 // 현재 달의 1일로 날자 객체 생성(월은 0부터 11까지의 정수(1월부터 12월))
	var firstWeek = firstDay.getDay();										// 현재 달 1일의 요일을 구함 (0:일요일, 1:월요일)

	var loopFlag = false;

	if ((sYear % 4)==0) {															 // 4년마다 1번이면 (사로나누어 떨어지면)
		if ((sYear % 100) == 0) {
			if ((sYear % 400) == 0) {
				lastDay[2] = 29;
			}
		} else {
			lastDay[2] = 29;
		}
	}
	var intLastDay = lastDay[sMonth];																				// 마지막 일자 구함

	var echoHTML = '<div class="mini_calendar">';
	echoHTML += '<div class="navi">';
	echoHTML += '	<a href="#" onclick="_goCalendar(\''+prevYear+'\',\''+prevMonth+'\',\''+sDay+'\',\''+pos+'\');return false;" class="prev"><img src="/Date/project/prev.gif" /></a>';
	echoHTML += _setYear(pos);
	echoHTML += _setMonth(pos);
	echoHTML += '	<a href="#" onclick="_goCalendar(\''+nextYear+'\',\''+nextMonth+'\',\''+sDay+'\',\''+pos+'\');return false;" class="next"><img src="/Date/project/next.gif" /></a>';
	echoHTML += '	<a href="#" onclick="calRemove();return false;"><img src="/Date/project/close.gif" /></a>';
	echoHTML += '</div>';
	echoHTML += '<table class="mini_cal_tbl">';
	echoHTML += '	<thead>';
	echoHTML += '		<tr>';
	echoHTML += '			<th class="sun">일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th class="sat">토</th>';
	echoHTML += '		</tr>';
	echoHTML += '	</thead>';
	echoHTML += '	<tbody>';

	var pDay	= 1;	 // 달력날짜
	var eDay	= '';	// 날짜 출력

	for (var i=1; i < 7; i++) {			 // 주단위 루프 시작, 최대 6주
		echoHTML += '<tr>'

		for (var j=1; j <= 7; j++) {		// 요일단위 루프 시작, 일요일 부터
			// 일/토/해당일 색상 설정
			if(j == 1)			weekCls = ' sun"';
			else if(j == 7) weekCls = ' sat"';
			else						weekCls = '';

			echoHTML += '<td>';

			// 첫주 시작일이 1보다 크면
			if (firstWeek > 0) {
				firstWeek--;
			} else {
				// 날짜가 월말보다 크다면
				if (pDay <= intLastDay) {
					today = sYear + "-" + _setFillZero(sMonth).toString() + "-" + _setFillZero(pDay).toString();
					// 선택된 날짜와 달력 날자가 같으면 Bold
					if(pDay == sDay) eDay = '<div class="current'+weekCls+'" onclick="_selDate(\''+today+'\',\''+pos+'\')">'+pDay+'</div>';
					else						 eDay = '<div class="'+weekCls+'" onclick="_selDate(\''+today+'\',\''+pos+'\')">'+pDay+'</div>';
					echoHTML += eDay;
				}
				pDay++;

				// 만약 날짜 값이 월말 값보다 크면 루프문 탈출
				if (pDay > intLastDay) {
					loopFlag = true;
				}
			}
			echoHTML += '</td>';
		}
		echoHTML += '</tr>';
		if (loopFlag) break;
	}
	echoHTML += '</tbody>';
	echoHTML += '</table>';
	echoHTML += '</div>';


	if( pos == "1") document.getElementById(calendarID).innerHTML = echoHTML;
	else if( pos == "2") document.getElementById(calendarID2).innerHTML = echoHTML;

	if(i==6) {
		document.getElementById('mini_frame').style.height = 195+"px";
	} else {
		document.getElementById('mini_frame').style.height = 160+"px";
	}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이벤트 수정</title>
</head>
<body>
<form method="post" name="modifyEvent" enctype="multipart/form-data" action="modifyEventPro.nhn">
<table border="1" width="600" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30"> 
      <td align="center"  width="100">이벤트 이름</td>
      <td align="center"  width="500"><input type="text" name="ename" value="${eto.ename}">
      					<input type="hidden" name="enumber" value="${eto.enumber}">
     </tr>
    <tr height="30"> 
      <td align="center"  width="100">당첨자 수</td>
      <td align="center"  width="500"><input type="text" name="wnumber" value="${eto.wnumber}">
     </tr> 
     <tr height="30">
      <td align="center" width="100">진행 날짜</td>
      <td width="500">시작 날짜<input type="text" id="start_day" name="sdate" class="forms" style="width:80px;" value="${eto.sdate}" />
      				    종료 날짜<input type="text" id="end_day" name="edate" class="forms" style="width:80px;" value="${eto.edate}"/><br/>
      					<a href="#" onclick="miniSetCalendar(event,'start_day','end_day');return false;">[검색달력]</a>
      </td>
    </tr>
    <tr height="30">
      <td align="center" width="340">이벤트 대표 이미지</td>
      <td align="center" width="340">이벤트 상세 이미지</td>
    </tr>
    <tr>
      <td align="center"><img src="${src1}" width="340" height="430"/><input type="file" name="upload[1]"></td>
      <td align="center"><img src="${src2}" width="340" height="430"/><input type="file" name="upload[2]"></td>
    </tr>
    <tr>
     <td colspan=2 align="center"><input type="submit" value="수정"></td>
    </tr>
</table>
</form>
</body>
</html>