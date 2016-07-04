<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>카테고리별 장소 검색하기</title>
    <style>



.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:800px;height:350px;}
#menu_wrap {position:absolute;top:0;left:100%;bottom:0;width:250px;margin:0 0 0 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .food {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}



.placeinfov {width:200px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;float:left;margin-right: 20px; }
.placeinfov_wrap {position:static;bottom:28px;width:100%;margin-top: 10px}

.placeinfov:nth-of-type(n){border:0; box-shadow:0px 1px 2px #888;}
.placeinfov_wrap .after {content:'';margin-left:-12px;left:50%;width:22px;height:12px;background:url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfov a, .placeinfov a:hover, .placeinfov a:active{color:#fff;text-decoration: none;}
.placeinfov a, .placeinfov span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfov span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfov .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfov .tel {color:#0f7833;}
.placeinfov .jibun {color:#999;font-size:11px;margin-top:0;}



#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>

<script type="text/javascript">
var pids = '${pidsize}'
	alert(pids);
function readImage(file,j) {
	$('#imgsel'+j).empty();
    var reader = new FileReader();
    var image  = new Image();
    reader.readAsDataURL(file);  
    reader.onload = function(_file) {
        image.src    = _file.target.result;              // url.createObjectURL(file);
        image.onload = function() {
       
            var w = this.width,
                h = this.height,
                n = file.name
                var wwd=300;  
                var hhd=300;  
           
				
              	$('#imgsel'+j).append('<img width="300" height="300" src="'+ this.src +'"> '+'<br>');
			  
        };
        image.onerror= function() {
            alert('Invalid file type: '+ file.type);
        };      
    };
}


$("#choose1").change(function (e) {
    if(this.disabled) return alert('File upload not supported!');
    var F = this.files;
    if(F && F[0]) for(var i=0; i<F.length; i++) readImage( F[i],1 );
});
$("#choose2").change(function (e) {
    if(this.disabled) return alert('File upload not supported!');
    var F = this.files;
    if(F && F[0]) for(var i=0; i<F.length; i++) readImage( F[i],2 );
});
$("#choose3").change(function (e) {
    if(this.disabled) return alert('File upload not supported!');
    var F = this.files;
    if(F && F[0]) for(var i=0; i<F.length; i++) readImage( F[i],3 );
});
$("#choose4").change(function (e) {
    if(this.disabled) return alert('File upload not supported!');
    var F = this.files;
    if(F && F[0]) for(var i=0; i<F.length; i++) readImage( F[i],4 );
});
$("#choose5").change(function (e) {
    if(this.disabled) return alert('File upload not supported!');
    var F = this.files;
    if(F && F[0]) for(var i=0; i<F.length; i++) readImage( F[i],5 );
});

</script>
</head>
<body>

<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <p>
                
                키워드 : <input type="text" value="" id="keyword" size="15"> 
                <button type="button" onclick="searchPlaces2(); return false;">검색하기</button> 
            </p>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
    <ul id="category">
        <li id="CE7" data-order="4"> 
            <span class="category_bg cafe"></span>
            카페
        </li>        
        <li id="CT1" data-order="1"> 
            <span class="category_bg mart"></span>
            문화시설
        </li>  
        <li id="FD6" data-order="3"> 
            <span class="category_bg oil"></span>
            음식점
        </li>
     <!--   
        <li id="OL7" data-order="3"> 
            <span class="category_bg oil"></span>
            주유소
        </li>  
        <li id="CE7" data-order="4"> 
            <span class="category_bg cafe"></span>
            카페
        </li>  
        <li id="CS2" data-order="5"> 
            <span class="category_bg store"></span>
            편의점
        </li>   
         -->   
    </ul>
</div>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9be7455c7d33a4e2b750d3537e1179d8&libraries=services"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script>

// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다

var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
var ps = new daum.maps.services.Places(map); 

var infowindow = new daum.maps.InfoWindow({zIndex:1});


// 장소 검색 객체를 생성합니다


// 지도에 idle 이벤트를 등록합니다
daum.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  
searchPlaces3();
// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces3(){
	var title = "${dto.placetitle}";
	
	var ad = title.split(",");
	for(var i = 0;i<ad.length;i++){
		ps.keywordSearch(ad[i], placesSearchCB3);  
	}
	

    

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    
}
function searchPlaces2() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB2); 
}
function searchPlaces() {
	if (!currCategory) {
	        return;
	}
	    	// 커스텀 오버레이를 숨깁니다 
		 placeOverlay.setMap(null);		
		    // 지도에 표시되고 있는 마커를 제거합니다
				
		 ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:false});
	   
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
}
function placesSearchCB3(status, data, pagination) {
	if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        
        displayPlaces3(data.places);

    }
}
function placesSearchCB2(status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces2(data.places);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}
// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB( status, data, pagination ) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        
        displayPlaces(data.places);
        displayPagination(pagination);
        
    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
    	alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
    	alert('검색 결과 중 오류가 발생했습니다.');
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
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
            marker = addMarker2(placePosition, i), 
            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, place) {
                daum.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
        (function(marker, place) {
            daum.maps.event.addListener(marker, 'rightclick', function() {

            	kor[j] = '<div ondblclick="deldiv('+j+')" class="placeinfov" id="'+j+'" style="float:left;">' +
                '   <a class="title" href="' + place.placeUrl + '" target="_blank" title="' + place.title + '">' + place.title + '</a>';   
            	
			if (place.newAddress) {
				kor[j] += '    <span title="' + place.newAddress + '">' + place.newAddress + '</span>' +
                '  <span class="jibun" title="' + place.address + '">(지번 : ' + place.address + ')</span>';
			}  else {
				kor[j] += '    <span title="' + place.address + '">' + place.address + '</span>';
			    }                
			alert(place.category);
			kor[j] += '    <span class="tel">' + place.phone + '</span>' + 
		  '<input type="hidden" name="placeplaceUrl" id="placeplaceUrl" value="'+place.placeUrl+'" />'+
  		  '<input type="hidden" name="placenewAddress" id="placenewAddress" value="'+place.newAddress+'" />'+
  		  '<input type="hidden" name="placelocation" id="placelocation" value="'+place.address +'" />'+
  		  '<input type="hidden" name="placecategory" id="placecategory" value="'+place.category +'" />'+
  		  '<input type="hidden" name="placeid"  id="placeid" value="'+place.id +'" />'+
  		  '<input type="hidden" name="placetitle"  id="placeid" value="'+place.title +'" />'+
  		  '<input type="hidden" name="placephone" value="'+place.phone +'" />'+
         		   '</div>' + 
         		   '<div class="afterv" style="float:left;"></div>';
			
             if(j>5){               	 
         		j=6;
         		alert("5개 이상 선택 하실수 없습니다.");
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

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
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
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    

    // 지도에 표시되고 있는 마커를 제거합니다
    
    
    for ( var i=0; i<places.length; i++ ) {
    	
    	if(checkidtmp.indexOf(places[i].id)>-1){
        // 마커를 생성하고 지도에 표시합니다
        
        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
            marker = addMarker2(placePosition, index), 
            itemEl = getListItem(index, places[i], marker); // 검색 결과 항목 Element를 생성합니다
            index++;
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, place) {
            daum.maps.event.addListener(marker, 'rightclick', function() {

            	kor[j] = '<div ondblclick="deldiv('+j+')" class="placeinfov" id="'+j+'" style="float:left;">' +
                '   <a class="title" href="' + place.placeUrl + '" target="_blank" title="' + place.title + '">' + place.title + '</a>';   
            	
			if (place.newAddress) {
				kor[j] += '    <span title="' + place.newAddress + '">' + place.newAddress + '</span>' +
                '  <span class="jibun" title="' + place.address + '">(지번 : ' + place.address + ')</span>';
			}  else {
				kor[j] += '    <span title="' + place.address + '">' + place.address + '</span>';
			    }                
			alert(place.category);
			kor[j] += '    <span class="tel">' + place.phone + '</span>' + 
		  '<input type="hidden" name="placeplaceUrl" id="placeplaceUrl" value="'+place.placeUrl+'" />'+
  		  '<input type="hidden" name="placenewAddress" id="placenewAddress" value="'+place.newAddress+'" />'+
  		  '<input type="hidden" name="placelocation" id="placelocation" value="'+place.address +'" />'+
  		'<input type="hidden" name="placecategory" id="placecategory" value="'+place.category +'" />'+
  		  '<input type="hidden" name="placeid"  id="placeid" value="'+place.id +'" />'+
  		  '<input type="hidden" name="placetitle"  id="placeid" value="'+place.title +'" />'+
  		  '<input type="hidden" name="placephone" value="'+place.phone +'" />'+
         		   '</div>' + 
         		   '<div class="afterv" style="float:left;"></div>';
			
             if(j>5){               	 
         		j=6;
         		alert("5개 이상 선택 하실수 없습니다.");
         		return;
			 }
           
            
            
           
             	
             	
            $("#img").append(kor[j]);
            
            
         	
         	
         	
         	kortmp='';
			j++;
			
            });
        })(marker, places[i]);
        (function(marker, place) {
                	
                	kor[j] = '<div ondblclick="deldiv('+j+')" class="placeinfov" id="'+j+'" style="float:left;">' +
                    '   <a class="title" href="' + place.placeUrl + '" target="_blank" title="' + place.title + '">' + place.title + '</a>';   
                	
    			if (place.newAddress) {
    				kor[j] += '    <span title="' + place.newAddress + '">' + place.newAddress + '</span>' +
                    '  <span class="jibun" title="' + place.address + '">(지번 : ' + place.address + ')</span>';
    			}  else {
    				kor[j] += '    <span title="' + place.address + '">' + place.address + '</span>';
   			    }                
    			alert(place.category);
    			kor[j] += '    <span class="tel">' + place.phone + '</span>' + 
    			'<input type="hidden" name="placeplaceUrl" id="placeplaceUrl" value="'+place.placeUrl+'" />'+
      		  '<input type="hidden" name="placenewAddress" id="placenewAddress" value="'+place.newAddress+'" />'+
      		  '<input type="hidden" name="placelocation" id="placelocation" value="'+place.address +'" />'+
      		  '<input type="hidden" name="placecategory" id="placecategory" value="'+place.category +'" />'+
      		  '<input type="hidden" name="placeid" name="placeid" id="placeid" value="'+place.id +'" />'+
      		  '<input type="hidden" name="placetitle"  id="placetitle" value="'+place.title +'" />'+
      		  '<input type="hidden" name="placephone" value="'+place.phone +'" />'+
             		   '</div>' + 
             		   '<div class="afterv" style="float:left;"></div>';
    			
                 if(j>5){               	 
             		j=6;
             		alert("5개 이상 선택 하실수 없습니다.");
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
    	
    
    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
    	}
    }
}
// 지도에 마커를 표출하는 함수입니다
var kor=[];
var kortmp='';
var hidden=[];
var j = 1;
function deldiv(i){

}

function displayPlaces(places) {

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    

    for ( var i=0; i<places.length; i++ ) {
    	
            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarker(new daum.maps.LatLng(places[i].latitude, places[i].longitude), order),
           	    itemEl = getListItem(i, places[i], marker);
				
            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
           
            (function(marker, place) {
                daum.maps.event.addListener(marker, 'rightclick', function() {

                	kor[j] = '<div ondblclick="deldiv('+j+')" class="placeinfov" id="'+j+'" style="float:left;">' +
                    '   <a class="title" href="' + place.placeUrl + '" target="_blank" title="' + place.title + '">' + place.title + '</a>';   
                	
    			if (place.newAddress) {
    				kor[j] += '    <span title="' + place.newAddress + '">' + place.newAddress + '</span>' +
                    '  <span class="jibun" title="' + place.address + '">(지번 : ' + place.address + ')</span>';
    			}  else {
    				kor[j] += '    <span title="' + place.address + '">' + place.address + '</span>';
   			    }                
    			alert(place.id);
    			kor[j] += '    <span class="tel">' + place.phone + '</span>' + 
    		  '<input type="hidden" name="placeplaceUrl" id="placeplaceUrl" value="'+place.placeUrl+'" />'+
      		  '<input type="hidden" name="placenewAddress" id="placenewAddress" value="'+place.newAddress+'" />'+
      		  '<input type="hidden" name="placelocation" id="placelocation" value="'+place.address +'" />'+
      		  '<input type="hidden" name="placecategory" id="placecategory" value="'+place.category +'" />'+
      		  '<input type="hidden" name="placeid"  id="placeid" value="'+place.id +'" />'+
      		  '<input type="hidden" name="placetitle"  id="placeid" value="'+place.title +'" />'+
      		  '<input type="hidden" name="placephone" value="'+place.phone +'" />'+
             		   '</div>' + 
             		   '<div class="afterv" style="float:left;"></div>';
    			
                 if(j>5){               	 
             		j=6;
             		alert("5개 이상 선택 하실수 없습니다.");
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

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker2(position, idx, title) {
    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}
function addMarker3(position,idx,  title) {
    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}
function addMarker(position, order) {
	var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
    imageSize = new daum.maps.Size(27, 28),  // 마커 이미지의 크기
    imgOptions =  {
        spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
        spriteOrigin : new daum.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
        offset: new daum.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
    },
    markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
        marker = new daum.maps.Marker({
        position: position, // 마커의 위치
        image: markerImage 
    });

marker.setMap(map); // 지도 위에 마커를 표출합니다
markers.push(marker);  // 배열에 생성된 마커를 추가합니다

return marker;
}
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.placeUrl + '" target="_blank" title="' + place.title + '">' + place.title + '</a>';   

    if (place.newAddress) {
        content += '    <span title="' + place.newAddress + '">' + place.newAddress + '</span>' +
                    '  <span class="jibun" title="' + place.address + '">(지번 : ' + place.address + ')</span>';
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

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
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

    // 기존에 추가된 페이지번호를 삭제합니다
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
// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
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

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
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
<form action="datepostSave.nhn?pidsize=${pidsize}" method="post"  enctype="multipart/form-data">
<input type="hidden" value="up" name="btcheck" />
<div>
	<div id="img" class="placeinfov_wrap" style="margin-bottom: 20px">
	
	</div>
	
	
</div>

<input type="hidden" value="${num}" name="num" />
<c:if test="${dto.postcheck eq '0'}">
<input type="image" name="submit" value="submit" src="button/z34.png" />
<br /> 
	<div id="postscript" style="margin-top:70px">
			<div>
				<c:forEach var="i" begin="1" end="${pidsize}" step="1">
					<div>
						<div id="sel${i}" style="float:left;">
							 
							<div id="imgsel${i}" style="width:300;height:300;float:left;">
								
							</div>
							
							<div  id="content${i}" style="float:left;">
								<textarea name ="content${i}" rows="15" cols="100"></textarea>
							</div>
							
							<div>
								<input type="file" name="save${i}" id="choose${i}" />
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
	</div>
</c:if>
<c:if test="${dto.postcheck eq '1' }">
	<c:forEach	var="i" begin="0" end="${pidsize-1 }">
					<div>
						<div id="sel${i}" style="float:left;margin-top:20px;">
							 
							<div id="imgsel${i}" style="width:300;height:300;float:left;margin-right:10px">
								<img width=300 height="300" src="/Date/dateplan/dateImage/${postsrc[i]}" />
							</div>
							
							<div  id="content${i}" style="float:left;">
								<textarea readonly="readonly" name ="content${i}" rows="15" cols="100">${content[i] }</textarea>
							</div>
						</div>
				   </div>
	</c:forEach>
</c:if>
</form>

</body>

</html>