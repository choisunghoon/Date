<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
html { padding:0; margin:0;}
body, div{font:9pt Dotum, "����", Arial, sans-serif;}
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
// �޷��� ����� �κ��� ���̵� ����
var calendarID  = "sdate";
var calendarID2 = "edate";
var mode = false;
var sday = "";
var eday = "";
var yearS,yearE;
var _configSelect;
var _configTarget;
var _configSetDay=90;

// ���� ��¥ ���ϱ�
var cDate   = new Date();
var cYear  = cDate.getFullYear();
var cMonth = parseInt(cDate.getMonth())+1;	// �� ���� ������ ���� -1 �� ����
var cDay	 = cDate.getDate();
if(!yearS) yearS = 2010;
if(!yearE) yearE = parseInt(cYear + 2);

// ���õ� ���� ��¥
var selYear  = cYear;
var selMonth = cMonth;
var selDay   = cDay;

// ��¥ �ڸ��� 2�ڸ��� ����
function _setFillZero(d) {
	var str = new String();
	if (parseInt(d) < 10) {
		str = "0" + parseInt(d);
	} else {
		str = "" + parseInt(d);
	}
	return str;
}

// ��¥ ����
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

// �⵵ ���� �޺��ڽ� ���
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

// �ð� ���� �޺��ڽ� ���
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

	// ��°�����
	var holidays = new Array();
	holidays['11']	= "����";
	holidays['12']	= "��������";
	holidays['31']	= "������";
	holidays['55']	= "��̳�";
	holidays['66']	= "������";
	holidays['717']	= "������";
	holidays['815']	= "������";
	holidays['103']	= "��õ��";
	holidays['1225']= "��ź��";

	rtn = holidays[date];
	if(typeof(rtn) == 'undefined') rtn = '';

	return rtn;
}

// ������ ������
function _goCalendar(year,month,day,pos) {
	if(!year) year = cYear;
	SetShowCalendar(year,month,day,pos);
}

// ��¥ ��
function _compareDate(d1, d2) {

  var tmpd1 = d1.split("-");
	var tmpd2 = d2.split("-");
	var dt1 = new Date(tmpd1[0],tmpd1[1],tmpd1[2]);
	var dt2 = new Date(tmpd2[0],tmpd2[1],tmpd2[2]);
	var diff = dt2.getTime() - dt1.getTime();
	diff = Math.floor(diff / (1000 * 60 * 60 * 24));
	return diff;
}

// ��¥ ����
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
				alert('������ �������� ������ ���� Ů�ϴ�');
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
				alert('������ �������� �����Ϻ��� �۽��ϴ�');
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

	// ���ý� �ڵ� ��¥ ��� ���
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

// �޷� ����
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

// ���� ���� ���
function SetShowCalendar (sYear, sMonth, sDay, pos) {
	var today;	 // ���� ��¥
	var lnuar;	 // ����
	var holiday; // �����Ͽ���
	var lastDay	= new Array(0,31,28,31,30,31,30,31,31,30,31,30,31);
	var weekName = new Array("��","ȭ","��","��","��","��");

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

	var firstDay	= new Date(sYear, sMonth-1, 1);					 // ���� ���� 1�Ϸ� ���� ��ü ����(���� 0���� 11������ ����(1������ 12��))
	var firstWeek = firstDay.getDay();										// ���� �� 1���� ������ ���� (0:�Ͽ���, 1:������)

	var loopFlag = false;

	if ((sYear % 4)==0) {															 // 4�⸶�� 1���̸� (��γ����� ��������)
		if ((sYear % 100) == 0) {
			if ((sYear % 400) == 0) {
				lastDay[2] = 29;
			}
		} else {
			lastDay[2] = 29;
		}
	}
	var intLastDay = lastDay[sMonth];																				// ������ ���� ����

	var echoHTML = '<div class="mini_calendar">';
	echoHTML += '<div class="navi">';
	echoHTML += '	<a href="#" onclick="_goCalendar(\''+prevYear+'\',\''+prevMonth+'\',\''+sDay+'\',\''+pos+'\');return false;" class="prev"><img src="images/prev.gif" /></a>';
	echoHTML += _setYear(pos);
	echoHTML += _setMonth(pos);
	echoHTML += '	<a href="#" onclick="_goCalendar(\''+nextYear+'\',\''+nextMonth+'\',\''+sDay+'\',\''+pos+'\');return false;" class="next"><img src="images/next.gif" /></a>';
	echoHTML += '	<a href="#" onclick="calRemove();return false;"><img src="images/close.gif" /></a>';
	echoHTML += '</div>';
	echoHTML += '<table class="mini_cal_tbl">';
	echoHTML += '	<thead>';
	echoHTML += '		<tr>';
	echoHTML += '			<th class="sun">��</th><th>��</th><th>ȭ</th><th>��</th><th>��</th><th>��</th><th class="sat">��</th>';
	echoHTML += '		</tr>';
	echoHTML += '	</thead>';
	echoHTML += '	<tbody>';

	var pDay	= 1;	 // �޷³�¥
	var eDay	= '';	// ��¥ ���

	for (var i=1; i < 7; i++) {			 // �ִ��� ���� ����, �ִ� 6��
		echoHTML += '<tr>'

		for (var j=1; j <= 7; j++) {		// ���ϴ��� ���� ����, �Ͽ��� ����
			// ��/��/�ش��� ���� ����
			if(j == 1)			weekCls = ' sun"';
			else if(j == 7) weekCls = ' sat"';
			else						weekCls = '';

			echoHTML += '<td>';

			// ù�� �������� 1���� ũ��
			if (firstWeek > 0) {
				firstWeek--;
			} else {
				// ��¥�� �������� ũ�ٸ�
				if (pDay <= intLastDay) {
					today = sYear + "-" + _setFillZero(sMonth).toString() + "-" + _setFillZero(pDay).toString();
					// ���õ� ��¥�� �޷� ���ڰ� ������ Bold
					if(pDay == sDay) eDay = '<div class="current'+weekCls+'" onclick="_selDate(\''+today+'\',\''+pos+'\')">'+pDay+'</div>';
					else						 eDay = '<div class="'+weekCls+'" onclick="_selDate(\''+today+'\',\''+pos+'\')">'+pDay+'</div>';
					echoHTML += eDay;
				}
				pDay++;

				// ���� ��¥ ���� ���� ������ ũ�� ������ Ż��
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
</head>
<body>
<form method="post" name="addEvent" enctype="multipart/form-data" action="addEventPro.nhn">
<table border="1" width="500" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30"> 
      <td align="center"  width="100">�̺�Ʈ �̸�</td>
      <td align="center"><input type="text" name="ename">
     </tr>
     <tr>
      <td align="center" width="100">�̺�Ʈ ��ǥ �̹���</td>
      <td align="center"><input type="file" name="upload[1]"></td>
    </tr>
    <tr>
      <td align="center" width="100">�̺�Ʈ �� �̹���</td>
      <td align="center"><input type="file" name="upload[2]"></td>
    </tr>
    <tr height="30"> 
      <td align="center"  width="100">��÷�� ��</td>
      <td align="center"><input type="text" name="w">
     </tr>    
     <tr>
      <td align="center" width="100">���� ��¥</td>
      <td align="center" width="100">���� ��¥<input type="text" id="start_day" name="sdate" class="forms" style="width:80px;" />
      								  ���� ��¥<input type="text" id="end_day" name="edate" class="forms" style="width:80px;"  />
      								 <a href="#" onclick="miniSetCalendar(event,'start_day','end_day');return false;">[�˻��޷�]</a>
      </td>
    </tr>
    <tr>
     <td colspan=2 align="center"><input type="submit" value="����"></td>
    </tr>
</table>
</form>
</body>
</html>