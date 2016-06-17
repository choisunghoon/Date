<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<style>
.placeinfov {width:200px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;float:left;margin-right: 20px; }
.placeinfov_wrap {position:absolute;bottom:28px;width:100%;}

.placeinfov:nth-of-type(n){border:0; box-shadow:0px 1px 2px #888;}
.placeinfov_wrap .after {content:'';margin-left:-12px;left:50%;width:22px;height:12px;background:url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfov a, .placeinfov a:hover, .placeinfov a:active{color:#fff;text-decoration: none;}
.placeinfov a, .placeinfov span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfov span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfov .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfov .tel {color:#0f7833;}
.placeinfov .jibun {color:#999;font-size:11px;margin-top:0;}
</style>
<head>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9be7455c7d33a4e2b750d3537e1179d8&libraries=services"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script>
// ��Ŀ�� Ŭ������ �� �ش� ����� �������� ������ Ŀ���ҿ��������Դϴ�

var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // Ŀ���� ���������� ������ ������Ʈ �Դϴ� 
    markers = [], // ��Ŀ�� ���� �迭�Դϴ�
    currCategory = ''; // ���� ���õ� ī�װ��� ������ ���� �����Դϴ�
 
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
        level: 5 // ������ Ȯ�� ����
    };  

// ������ �����մϴ�    
var map = new daum.maps.Map(mapContainer, mapOption); 
var ps = new daum.maps.services.Places(map); 

var infowindow = new daum.maps.InfoWindow({zIndex:1});


// ��� �˻� ��ü�� �����մϴ�


// ������ idle �̺�Ʈ�� ����մϴ�
daum.maps.event.addListener(map, 'idle', searchPlaces);

// Ŀ���� ���������� ������ ��忡 css class�� �߰��մϴ� 
contentNode.className = 'placeinfo_wrap';

// Ŀ���� ���������� ������ ��忡 mousedown, touchstart �̺�Ʈ�� �߻�������
// ���� ��ü�� �̺�Ʈ�� ���޵��� �ʵ��� �̺�Ʈ �ڵ鷯�� daum.maps.event.preventMap �޼ҵ带 ����մϴ� 
addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

// Ŀ���� �������� �������� �����մϴ�
placeOverlay.setContent(contentNode);  
searchPlaces3();
// �� ī�װ��� Ŭ�� �̺�Ʈ�� ����մϴ�
addCategoryClickEvent();

// ������Ʈ�� �̺�Ʈ �ڵ鷯�� ����ϴ� �Լ��Դϴ�
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// ī�װ� �˻��� ��û�ϴ� �Լ��Դϴ�
function searchPlaces3(){
	var title = "${dto.placetitle}";
	
	var ad = title.split(",");
	for(var i = 0;i<ad.length;i++){
		ps.keywordSearch(ad[i], placesSearchCB3);  
	}
	

    

    // ��Ұ˻� ��ü�� ���� Ű����� ��Ұ˻��� ��û�մϴ�
    
}
function searchPlaces2() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('Ű���带 �Է����ּ���!');
        return false;
    }

    // ��Ұ˻� ��ü�� ���� Ű����� ��Ұ˻��� ��û�մϴ�
    ps.keywordSearch( keyword, placesSearchCB2); 
}
function searchPlaces() {
	if (!currCategory) {
	        return;
	}
	    	// Ŀ���� �������̸� ����ϴ� 
		 placeOverlay.setMap(null);		
		    // ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
				
		 ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:false});
	   
	    // ��Ұ˻� ��ü�� ���� Ű����� ��Ұ˻��� ��û�մϴ�
}
function placesSearchCB3(status, data, pagination) {
	if (status === daum.maps.services.Status.OK) {

        // ���������� �˻��� �Ϸ������
        // �˻� ��ϰ� ��Ŀ�� ǥ���մϴ�
        
        displayPlaces3(data.places);

    }
}
function placesSearchCB2(status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // ���������� �˻��� �Ϸ������
        // �˻� ��ϰ� ��Ŀ�� ǥ���մϴ�
        displayPlaces2(data.places);

        // ������ ��ȣ�� ǥ���մϴ�
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('�˻� ����� �������� �ʽ��ϴ�.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('�˻� ��� �� ������ �߻��߽��ϴ�.');
        return;

    }
}
// ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
function placesSearchCB( status, data, pagination ) {
    if (status === daum.maps.services.Status.OK) {

        // ���������� �˻��� �Ϸ������ ������ ��Ŀ�� ǥ���մϴ�
        
        displayPlaces(data.places);
        displayPagination(pagination);
        
    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
        // �˻������ ���°�� �ؾ��� ó���� �ִٸ� �̰��� �ۼ��� �ּ���
    	alert('�˻� ����� �������� �ʽ��ϴ�.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {
        // ������ ���� �˻������ ������ ���� ��� �ؾ��� ó���� �ִٸ� �̰��� �ۼ��� �ּ���
    	alert('�˻� ��� �� ������ �߻��߽��ϴ�.');
        return;
    }
}
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.title + '</h5>';

    if (places.newAddress) {
        itemStr += '    <span>' + places.newAddress + '</span>' +
                    '   <span class="jibun gray">' +  places.address  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}
function displayPlaces2(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // �˻� ��� ��Ͽ� �߰��� �׸���� �����մϴ�
    removeAllChildNods(listEl);

    // ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
            marker = addMarker2(placePosition, i), 
            itemEl = getListItem(i, places[i], marker); // �˻� ��� �׸� Element�� �����մϴ�

        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
        bounds.extend(placePosition);

        // ��Ŀ�� �˻���� �׸� mouseover ������
        // �ش� ��ҿ� ���������쿡 ��Ҹ��� ǥ���մϴ�
        // mouseout ���� ���� ���������츦 �ݽ��ϴ�
        (function(marker, place) {
                daum.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
        (function(marker, place) {
            daum.maps.event.addListener(marker, 'rightclick', function() {

            	kor[j] = '<div onclick="deldiv('+j+')" class="placeinfov" id="'+j+'" style="float:left;">' +
                '   <a class="title" href="' + place.placeUrl + '" target="_blank" title="' + place.title + '">' + place.title + '</a>';   
            	
			if (place.newAddress) {
				kor[j] += '    <span title="' + place.newAddress + '">' + place.newAddress + '</span>' +
                '  <span class="jibun" title="' + place.address + '">(���� : ' + place.address + ')</span>';
			}  else {
				kor[j] += '    <span title="' + place.address + '">' + place.address + '</span>';
			    }                
				
			kor[j] += '    <span class="tel">' + place.phone + '</span>' + 
		  '<input type="hidden" name="placeplaceUrl" id="placeplaceUrl" value="'+place.placeUrl+'" />'+
  		  '<input type="hidden" name="placenewAddress" id="placenewAddress" value="'+place.newAddress+'" />'+
  		  '<input type="hidden" name="placeaddress" id="placeaddress" value="'+place.address +'" />'+
  		  '<input type="hidden" name="placeid"  id="placeid" value="'+place.id +'" />'+
  		  '<input type="hidden" name="placetitle"  id="placeid" value="'+place.title +'" />'+
  		  '<input type="hidden" name="placephone" value="'+place.phone +'" />'+
         		   '</div>' + 
         		   '<div class="afterv" style="float:left;"></div>';
			
             if(j>5){               	 
         		j=6;
         		alert("5�� �̻� ���� �ϽǼ� �����ϴ�.");
         		return;
			 }
           
            
            
           
             	
             	
            $("#img").append(kor[j]);
            
            
         	
         	
         	
         	kortmp='';
			j++;
			
            });
        })(marker, places[i]);
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].title);

        fragment.appendChild(itemEl);
    }

    // �˻���� �׸���� �˻���� ��� Elemnet�� �߰��մϴ�
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
    map.setBounds(bounds);
}
var checkidtmp="${dto.placeid}"
var checkid = checkidtmp.split(",");
var index=0;


function displayPlaces3(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // �˻� ��� ��Ͽ� �߰��� �׸���� �����մϴ�
    

    // ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
    
    
    for ( var i=0; i<places.length; i++ ) {
    	
    	if(checkidtmp.indexOf(places[i].id)>-1){
        // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
        
        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
            marker = addMarker2(placePosition, index), 
            itemEl = getListItem(index, places[i], marker); // �˻� ��� �׸� Element�� �����մϴ�
            index++;
        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
        bounds.extend(placePosition);
        // ��Ŀ�� �˻���� �׸� mouseover ������
        // �ش� ��ҿ� ���������쿡 ��Ҹ��� ǥ���մϴ�
        // mouseout ���� ���� ���������츦 �ݽ��ϴ�
        (function(marker, place) {
            daum.maps.event.addListener(marker, 'rightclick', function() {

            	kor[j] = '<div onclick="deldiv('+j+')" class="placeinfov" id="'+j+'" style="float:left;">' +
                '   <a class="title" href="' + place.placeUrl + '" target="_blank" title="' + place.title + '">' + place.title + '</a>';   
            	
			if (place.newAddress) {
				kor[j] += '    <span title="' + place.newAddress + '">' + place.newAddress + '</span>' +
                '  <span class="jibun" title="' + place.address + '">(���� : ' + place.address + ')</span>';
			}  else {
				kor[j] += '    <span title="' + place.address + '">' + place.address + '</span>';
			    }                
				
			kor[j] += '    <span class="tel">' + place.phone + '</span>' + 
		  '<input type="hidden" name="placeplaceUrl" id="placeplaceUrl" value="'+place.placeUrl+'" />'+
  		  '<input type="hidden" name="placenewAddress" id="placenewAddress" value="'+place.newAddress+'" />'+
  		  '<input type="hidden" name="placeaddress" id="placeaddress" value="'+place.address +'" />'+
  		  '<input type="hidden" name="placeid"  id="placeid" value="'+place.id +'" />'+
  		  '<input type="hidden" name="placetitle"  id="placeid" value="'+place.title +'" />'+
  		  '<input type="hidden" name="placephone" value="'+place.phone +'" />'+
         		   '</div>' + 
         		   '<div class="afterv" style="float:left;"></div>';
			
             if(j>5){               	 
         		j=6;
         		alert("5�� �̻� ���� �ϽǼ� �����ϴ�.");
         		return;
			 }
           
            
            
           
             	
             	
            $("#img").append(kor[j]);
            
            
         	
         	
         	
         	kortmp='';
			j++;
			
            });
        })(marker, places[i]);
        (function(marker, place) {
                	
                	kor[j] = '<div onclick="deldiv('+j+')" class="placeinfov" id="'+j+'" style="float:left;">' +
                    '   <a class="title" href="' + place.placeUrl + '" target="_blank" title="' + place.title + '">' + place.title + '</a>';   
                	
    			if (place.newAddress) {
    				kor[j] += '    <span title="' + place.newAddress + '">' + place.newAddress + '</span>' +
                    '  <span class="jibun" title="' + place.address + '">(���� : ' + place.address + ')</span>';
    			}  else {
    				kor[j] += '    <span title="' + place.address + '">' + place.address + '</span>';
   			    }                
  				
    			kor[j] += '    <span class="tel">' + place.phone + '</span>' + 
    			'<input type="hidden" name="placeplaceUrl" id="placeplaceUrl" value="'+place.placeUrl+'" />'+
      		  '<input type="hidden" name="placenewAddress" id="placenewAddress" value="'+place.newAddress+'" />'+
      		  '<input type="hidden" name="placeaddress" id="placeaddress" value="'+place.address +'" />'+
      		  '<input type="hidden" name="placeid" name="placeid" id="placeid" value="'+place.id +'" />'+
      		  '<input type="hidden" name="placetitle"  id="placetitle" value="'+place.title +'" />'+
      		  '<input type="hidden" name="placephone" value="'+place.phone +'" />'+
             		   '</div>' + 
             		   '<div class="afterv" style="float:left;"></div>';
    			
                 if(j>5){               	 
             		j=6;
             		alert("5�� �̻� ���� �ϽǼ� �����ϴ�.");
             		return;
    			 }
	             	
                $("#img").append(kor[j]);
                
             	kortmp='';
    			j++;
        
            })(marker, places[i]);
        (function(marker, place) {
            daum.maps.event.addListener(marker, 'click', function() {
                displayPlaceInfo(place);
            });
        })(marker, places[i]);
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].title);

        fragment.appendChild(itemEl);
    	
    
    // �˻���� �׸���� �˻���� ��� Elemnet�� �߰��մϴ�
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
    map.setBounds(bounds);
    	}
    }
}
// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
var kor=[];
var kortmp='';
var hidden=[];
var j = 1;
function deldiv(i){

	 $("#"+i).remove();
	j = j-1;
	
}

function displayPlaces(places) {

    // ���° ī�װ��� ���õǾ� �ִ��� ���ɴϴ�
    // �� ������ ��������Ʈ �̹��������� ��ġ�� ����ϴµ� ���˴ϴ�
    var order = document.getElementById(currCategory).getAttribute('data-order');
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // �˻� ��� ��Ͽ� �߰��� �׸���� �����մϴ�
    removeAllChildNods(listEl);

    // ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
    removeMarker();
    

    for ( var i=0; i<places.length; i++ ) {
    	
            // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
            var marker = addMarker(new daum.maps.LatLng(places[i].latitude, places[i].longitude), order),
           	    itemEl = getListItem(i, places[i], marker);
				
            // ��Ŀ�� �˻���� �׸��� Ŭ�� ���� ��
            // ��������� ǥ���ϵ��� Ŭ�� �̺�Ʈ�� ����մϴ�
           
            (function(marker, place) {
                daum.maps.event.addListener(marker, 'rightclick', function() {

                	kor[j] = '<div onclick="deldiv('+j+')" class="placeinfov" id="'+j+'" style="float:left;">' +
                    '   <a class="title" href="' + place.placeUrl + '" target="_blank" title="' + place.title + '">' + place.title + '</a>';   
                	
    			if (place.newAddress) {
    				kor[j] += '    <span title="' + place.newAddress + '">' + place.newAddress + '</span>' +
                    '  <span class="jibun" title="' + place.address + '">(���� : ' + place.address + ')</span>';
    			}  else {
    				kor[j] += '    <span title="' + place.address + '">' + place.address + '</span>';
   			    }                
  				
    			kor[j] += '    <span class="tel">' + place.phone + '</span>' + 
    		  '<input type="hidden" name="placeplaceUrl" id="placeplaceUrl" value="'+place.placeUrl+'" />'+
      		  '<input type="hidden" name="placenewAddress" id="placenewAddress" value="'+place.newAddress+'" />'+
      		  '<input type="hidden" name="placeaddress" id="placeaddress" value="'+place.address +'" />'+
      		  '<input type="hidden" name="placeid"  id="placeid" value="'+place.id +'" />'+
      		  '<input type="hidden" name="placetitle"  id="placeid" value="'+place.title +'" />'+
      		  '<input type="hidden" name="placephone" value="'+place.phone +'" />'+
             		   '</div>' + 
             		   '<div class="afterv" style="float:left;"></div>';
    			
                 if(j>5){               	 
             		j=6;
             		alert("5�� �̻� ���� �ϽǼ� �����ϴ�.");
             		return;
    			 }
               
                
                
               
	             	
	             	
                $("#img").append(kor[j]);
                
                
             	
             	
             	
             	kortmp='';
    			j++;
    			
                });
            })(marker, places[i]);
            (function(marker, place) {
                daum.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
            (function(marker, title) {
                daum.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });

                daum.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });

                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
            })(marker, places[i].title);
            fragment.appendChild(itemEl);
    }
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

}

// ��Ŀ�� �����ϰ� ���� ���� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function addMarker2(position, idx, title) {
    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
        imageSize = new daum.maps.Size(36, 37),  // ��Ŀ �̹����� ũ��
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // ��������Ʈ �̹����� ũ��
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
            offset: new daum.maps.Point(13, 37) // ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // ��Ŀ�� ��ġ
            image: markerImage 
        });

    marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
    markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�

    return marker;
}
function addMarker3(position,idx,  title) {
    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
        imageSize = new daum.maps.Size(36, 37),  // ��Ŀ �̹����� ũ��
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // ��������Ʈ �̹����� ũ��
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
            offset: new daum.maps.Point(13, 37) // ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // ��Ŀ�� ��ġ
            image: markerImage 
        });

    marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
    markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�

    return marker;
}
function addMarker(position, order) {
	var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
    imageSize = new daum.maps.Size(27, 28),  // ��Ŀ �̹����� ũ��
    imgOptions =  {
        spriteSize : new daum.maps.Size(72, 208), // ��������Ʈ �̹����� ũ��
        spriteOrigin : new daum.maps.Point(46, (order*36)), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
        offset: new daum.maps.Point(11, 28) // ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
    },
    markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
        marker = new daum.maps.Marker({
        position: position, // ��Ŀ�� ��ġ
        image: markerImage 
    });

marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�

return marker;
}
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.placeUrl + '" target="_blank" title="' + place.title + '">' + place.title + '</a>';   

    if (place.newAddress) {
        content += '    <span title="' + place.newAddress + '">' + place.newAddress + '</span>' +
                    '  <span class="jibun" title="' + place.address + '">(���� : ' + place.address + ')</span>';
    }  else {
        content += '    <span title="' + place.address + '">' + place.address + '</span>';
    }                
   
    content += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';
	
    contentNode.innerHTML = content;
    placeOverlay.setPosition(new daum.maps.LatLng(place.latitude, place.longitude));
    placeOverlay.setMap(map);  
}

// ���� ���� ǥ�õǰ� �ִ� ��Ŀ�� ��� �����մϴ�
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}
function displayPagination(pagination,place) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // ������ �߰��� ��������ȣ�� �����մϴ�
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}
// Ŭ���� ��Ŀ�� ���� ��� �������� Ŀ���� �������̷� ǥ���ϴ� �Լ��Դϴ�
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}


// �� ī�װ��� Ŭ�� �̺�Ʈ�� ����մϴ�
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// ī�װ��� Ŭ������ �� ȣ��Ǵ� �Լ��Դϴ�
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// Ŭ���� ī�װ����� Ŭ���� ��Ÿ���� �����ϴ� �Լ��Դϴ�
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>