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
									$("#babo").html("");
									$('#babo').append(city+'<br>');
									

									this2.find('data').each(function(){
										
										var output = $(this).find('tmEf').text()+' '+$(this).find('wf').text();
										
										$('#babo').append(output+'<br>');
							
									})
									
								}

							});
							
						});
					}
			
		});
	})

</script>
   <body>
   	<select id="wheather">
   	</select>
   <div id="babo">
   
   </div>
   	<br>
   </body>