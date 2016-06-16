<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    
    <script type="text/javascript">
    
   
	$(document).ready(function(){
		
		
		$.ajax({
			
			url:'http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108',
					dataType:'xml',
					success:function(response){
						console.log(response);
						$(response).find('location').each(function(){
		
							var city = $(this).find('city').text();
							
							$('#wheather').append('<option value='+city+'>'+city);
							var this2= $(this);
							$("#wheather").change(function(){ 
								
								if(city == $('#wheather option:selected').val()){
									$("#view").html("");
									
									

									this2.find('data').each(function(){
										var aa= $(this).find('wf').text();
										
										var txt1 =  $(this).find('tmEf').text().split(' ');
									if(txt1[1] == '12:00'){
									
											if(aa == '±¸¸§¸¹À½' || aa == '±¸¸§¸¹°í ºñ' || aa == '±¸¸§¸¹°í ºñ/´«' || aa == '±¸¸§¸¹°í ´«/ºñ' || aa == '±¸¸§¸¹°í ´«')
												{
												var bb = $('#view').append('<img src="many.png">');	
												}
											else if(aa == 'Èå¸®°í ºñ' || aa == 'Èå¸²' || aa == 'Èå¸²°í ºñ/´«'){
												var bb = $('#view').append('<img src="rain.png">');
											}else if(aa == '¸¼À½'){
												var bb = $('#view').append('<img src="sun.png">');
											}else if(aa == '±¸¸§ Á¶±Ý'){
												var bb = $('#view').append('<img src="little.png">');
											}else if(aa == 'Èå¸²°í ´«/ºñ' || aa == 'Èå¸®°í ´«'){
												var bb = $('#view').append('<img src="snow.png">');
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
   	<div id=divMenu style="top:0px; left:1200px; visibility: visible; width: 140px; position: absolute; background-color:#F7CBCB;"> 
		<select id="wheather" style="margin-left:38px; margin-top:5px">
		</select>
	   <div id="view">
	   
	   </div>
   	<br>
</div>
   </body>
   
   
   
   
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js --> 

</body>
</html>
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
                    yMenuTo     = windows.pageYOffset +10 ;   // À§ÂÊ À§Ä¡ 
            } else if (isDOM) { 
                    yMenuFrom   = parseInt (divMenu.style.top, 10); 
                    yMenuTo     = (isNS ? window.pageYOffset : document.body.scrollTop) +10; // À§ÂÊ À§Ä¡ 
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
   
