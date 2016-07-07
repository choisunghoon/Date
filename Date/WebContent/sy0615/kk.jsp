<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    
    <script type="text/javascript">
    function aa(){
    	if(confirm("날씨를 보기위해선 'Allow-Control-Allow-Origin:*'를 설치해야합니다.      설치하시겠습니까?")){
    		url = "https://chrome.google.com/webstore/detail/allow-control-allow-origi/nlfbmbojpeacfghkpbjhddihlkkiljbi?utm_source=chrome-ntp-icon";
    	    
    	    // 새로운 윈도우를 엽니다.
    	    open(url, "confirm", 
    	    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no");

		}
		else{
			return false;
		}
    }
   
	$(document).ready(function(){
		
		
		$.ajax({	// 기상청 xml 파일 파싱
			
			url:'http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108',
					dataType:'xml',
					success:function(response){
						$('#wheather').append('<option value="">');
						$(response).find('location').each(function(){
							var city = $(this).find('city').text();
							$('#wheather').append('<option value='+city+'>'+city);
							var this2= $(this);
							$("#wheather").change(function(){ 
								
								if($('#wheather option:selected').val() == ""){
									$("#view").html("");
								}
								
								else if(city == $('#wheather option:selected').val()){
									$("#view").html("");
						
									this2.find('data').each(function(){
										var aa= $(this).find('wf').text();
										
										var txt1 =  $(this).find('tmEf').text().split(' ');
									if(txt1[1] == '12:00'){
									
											if(aa == '구름많음' || aa == '구름많고 비' || aa == '구름많고 비/눈' || aa == '구름많고 눈/비' || aa == '구름많고 눈')
												{
												var bb = $('#view').append('&nbsp;&nbsp;&nbsp;<img src="sy0615/many.png">&nbsp;');	
												}
											else if(aa == '흐리고 비' || aa == '흐림' || aa == '흐림고 비/눈'){
												var bb = $('#view').append('&nbsp;&nbsp;&nbsp;<img src="sy0615/rain.png">&nbsp;');
											}else if(aa == '맑음'){
												var bb = $('#view').append('&nbsp;&nbsp;&nbsp;<img src="sy0615/sun.png">&nbsp;');
											}else if(aa == '구름 조금'){
												var bb = $('#view').append('&nbsp;&nbsp;&nbsp;<img src="sy0615/little.png">&nbsp;');
											}else if(aa == '흐림고 눈/비' || aa == '흐리고 눈'){
												var bb = $('#view').append('&nbsp;&nbsp;&nbsp;<img src="sy0615/snow.png">&nbsp;');
											}
											$('#view').append(txt1[0]+'<br>');
									}
							
									})
									
								}

							});
							
						});
					}
			
		});
	})

</script>
   <body>
   	<div id=divMenu style="top:0px; left:1200px; visibility: visible; width: 140px; position: absolute; background-color: rgba(247,203,203,0.8);"> 
		<select id="wheather" style="margin-left:38px; margin-top:20px">
		</select><br>
	   <div id="view">
	   <p style="font-size:10px; margin-left:11px;"><a href="#" onclick="aa()">보이지 않을시 클릭하세요</a></p>
	   </div>
	   <br>
	   
   	<br>
</div>
</body>
   
   
   
   
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js --> 
<SCRIPT LANGUAGE=JAVASCRIPT> 
<!-- 

    var isDOM = (document.getElementById ? true : false); 
    var isIE4 = ((document.all && !isDOM) ? true : false); 
    var isNS4 = (document.layers ? true : false); 
     
    function getRef(id) { 
            if (isDOM) return document.getElementById(id); 
            if (isIE4) return document.all[id]; 
            if (isNS4) return document.layers[id]; 
    } 
     
    var isNS = navigator.appName == "Netscape"; 
    function moveRightEdge() { 
            var yMenuFrom, yMenuTo, yOffset, timeoutNextCheck; 
            
            if (isNS4) { 
                    yMenuFrom   = divMenu.top; 
                    yMenuTo     = windows.pageYOffset +10 ;   // 위쪽 위치 
            } else if (isDOM) { 
                    yMenuFrom   = parseInt (divMenu.style.top, 10); 
                    yMenuTo     = (isNS ? window.pageYOffset : document.body.scrollTop) +120; // 위쪽 위치 
            } 
            timeoutNextCheck = 500; 
            if (yMenuFrom != yMenuTo) { 
                    yOffset = Math.ceil(Math.abs(yMenuTo - yMenuFrom) / 20); 
                    if (yMenuTo < yMenuFrom) 
                            yOffset = -yOffset; 
                    if (isNS4) 
                            divMenu.top += yOffset; 
                    else if (isDOM) 
                            divMenu.style.top = parseInt (divMenu.style.top, 10) + yOffset; 
                            timeoutNextCheck = 10; 
            } 
            setTimeout ("moveRightEdge()", timeoutNextCheck); 
    } 
     
    if (isNS4) { 
            var divMenu = document["divMenu"]; 
            divMenu.top = top.pageYOffset +10; 
            divMenu.visibility = "visible"; 
            moveRightEdge(); 
    } else if (isDOM) { 
            var divMenu = getRef('divMenu'); 
            divMenu.style.top = (isNS ? window.pageYOffset : document.body.scrollTop) +10; 
            divMenu.style.visibility = "visible"; 
            moveRightEdge(); 
    } 

//--> 
</SCRIPT>    
   
