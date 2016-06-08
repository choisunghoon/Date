<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!DOCTYPE html>
<html>
  <head>
    
  </head>
  <body>
  	
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">

    var geocoder;  
    var map;  
    var marker;  
    ///////////////////////////////////////////
    var placeSearch, autocomplete;
    var componentForm = {
      street_number: 'short_name',
      route: 'long_name',
      locality: 'long_name',
      administrative_area_level_1: 'short_name',
      country: 'long_name',
      postal_code: 'short_name'
    };

    function initAutocomplete() {
      // Create the autocomplete object, restricting the search to geographical
      // location types.
      autocomplete = new google.maps.places.Autocomplete(
          /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
          {types: ['geocode']});

      // When the user selects an address from the dropdown, populate the address
      // fields in the form.
      autocomplete.addListener('place_changed', fillInAddress);
    }

    function fillInAddress() {
      // Get the place details from the autocomplete object.
      var place = autocomplete.getPlace();

      for (var component in componentForm) {
        document.getElementById(component).value = '';
        document.getElementById(component).disabled = false;
      }

      // Get each component of the address from the place details
      // and fill the corresponding field on the form.
      for (var i = 0; i < place.address_components.length; i++) {
        var addressType = place.address_components[i].types[0];
        if (componentForm[addressType]) {
          var val = place.address_components[i][componentForm[addressType]];
          document.getElementById(addressType).value = val;
        }
      }
    }

    // Bias the autocomplete object to the user's geographical location,
    // as supplied by the browser's 'navigator.geolocation' object.
    function geolocate() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
          var geolocation = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
          };
          var circle = new google.maps.Circle({
            center: geolocation,
            radius: position.coords.accuracy
          });
          autocomplete.setBounds(circle.getBounds());
        });
      }
    }
  ////////////////////////////////////////////////////////  		
function initMap() {
	geocoder = new google.maps.Geocoder(); 
	 if (navigator.geolocation) {
		 navigator.geolocation.getCurrentPosition (function (pos)
		 {
			 lat = pos.coords.latitude;
             lng = pos.coords.longitude;
		   
				  map = new google.maps.Map(document.getElementById('map'), {
				    center: {lat: pos.coords.latitude, lng: pos.coords.longitude},
				    zoom: 18
				  });
				 
				 
				  
	                var marker = new google.maps.Marker({
	                    position: new google.maps.LatLng(lat,lng),
	                    animation: google.maps.Animation.DROP,
	                    map: map,
	                    draggable: false,
	                    
	                   
	                });
	                
	               
		 },function(error)
         {
             switch(error.code)
             {
                 case 1:
                     $("#errormsg").html("User denied the request for Geolocation.");
                     break;
                 case 2:
                     $("#errormsg").html("Location information is unavailable.");
                     break;
                 case 3:
                     $("#errormsg").html("The request to get user location timed out.");
                     break;
                 case 0:
                     $("#errormsg").html("An unknown error occurred.");
                     break;
             }
         });
	 }else {
		    showError("Your browser does not support Geolocation!");
	  }
	 
	 function toggleBounce() {
		  if (marker.getAnimation() !== null) {
		    marker.setAnimation(null);
		  } else {
		    marker.setAnimation(google.maps.Animation.BOUNCE);
		  }
		}
	 
	
	

		
}

function codeAddress(){  
    var address = document.getElementById("address").value;  
    var r = document.getElementById("r");  
      
    r.innerHTML = '';  
      
    geocoder.geocode({  
        'address': address  
    }, function(results, status){  
        if (status == google.maps.GeocoderStatus.OK) {  
            map.setCenter(results[0].geometry.location);  
            addMark(results[0].geometry.location.lat(), results[0].geometry.location.lng());  
                          
            for(var i in  results){  
                //r.innerHTML += results[i].formatted_address+',';  
                var li = document.createElement('li');  
                var a = document.createElement('a');  
                a.href = "javascript:addMark(" + marker.position.lat() + ", " + marker.position.lng() + ");";  
                a.innerHTML = results[i].formatted_address;  
   
                li.appendChild(a);  
                r.appendChild(li);  
            }             
        } else {  
            r.innerHTML = "검색 결과가 없습니다."+status;              
        }  
    });  
}  
  
function addMark(lat, lng){  
    if(typeof marker!='undefined'){  
        marker.setMap(null);  
    }  
      
    marker = new google.maps.Marker({  
        map: map,  
        position: new google.maps.LatLng(lat, lng)  
    });  
}  
    </script>
    


    <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC1XQtNn9c3uoA1gDxeJR_UouNpC2_TIo0&callback=initMap&libraries=places">
    </script>
    <div id="errormsg"></div>
	<div id="latlng"></div>
	
	<div>   
	    <input id="address" type="textbox" value="">   
	    <input type="button" value="Geocode" onclick="codeAddress()">   
	</div>
	
	<div id="map" style="width:760px;height:400px;margin-top:20px;"></div>
	<div id="r"></div>  
  </body>
</html>