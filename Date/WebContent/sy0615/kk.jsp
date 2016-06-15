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
							
							$('#wheather').change(function(){
								if(city == $('#wheather option:selected').val()){
									$('body').append(city+'<br>');
									$(city).find('data').each(function(){
										var output = $(city).find('tmEf').text()+' '+$(city).find('wf').text();
										$('body').append(output+'<br>');
							
									})
								}

							})
							
						});
					}
			
		});
	})

</script>
   <body>
   	<select id="wheather">
   	</select>
   
   	<br>
   </body>