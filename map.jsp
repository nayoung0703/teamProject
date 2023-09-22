<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>



<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
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
</head>

<body>
<div class="map_wrap" style="margin-top:20px;margin-bottom:150px;width:1500px;height:800px;">
	<div id="map" align="center" style="width:100%;height:100%; border-radius:10px"></div>
	
	<div id="menu_wrap" class="bg_white">
		<div class="option">
			<div>
				<h4>음식점 목록</h4>
			</div>
		</div>	
		<hr>
		<ul id="placesList"></ul>
	</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eaaa89c15cb87d0fe64303808ac10a52&libraries=services,clusterer"></script>
<script>
	var container = document.getElementById('map');
	var options = {
	center: new kakao.maps.LatLng(37.55409766047635, 126.9206414492032),
	level: 2
	};
	
	var map = new kakao.maps.Map(container, options);
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();	
	
	var imageSrc = 'https://cdn-icons-png.flaticon.com/128/4552/4552186.png' ; // 마커 이미지 url, 스프라이트 이미지를 씁니다
	var imageSize = new kakao.maps.Size(36, 37);  // 마커 이미지의 크기
	var imgOptions =  {
			offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			
	}
	var markerImageFavorite = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions);
	
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}
	
</script>

<%
	msg = "select * from yjstore";
	PST = CN.prepareStatement(msg);
	RS = PST.executeQuery();
	while(RS.next()){
		 int id = RS.getInt("storeid");
		 String name= RS.getString("storename");
		 String lati = RS.getString("lati");
		 String longi = RS.getString("longi");
%>		 
	
<script>	
	var markerPosition  = new kakao.maps.LatLng( <%=lati %>, <%=longi %>); 

	//마커를 생성합니다
	var marker = new kakao.maps.Marker({
		title : '<%=name%>' ,
 		position: markerPosition,
 		image : markerImageFavorite
	});
	
	marker.setMap(map);
	
	var iwContent = '<div style="padding:10px; ">'+
	'<div>'+'<%=name%>'+'</div>'+
	'<hr>'+
    '<form name="toStore" action="MapToStoreInsertToPostInsert.dd">' +
    '<button type="submit" style="border:none; width:100%">등록하기</button>' +
    '<input type="hidden" name="storeName" value="'+'<%=name%>' +'">' +
    '<input type="hidden" name="lat" value="'+'<%=lati%>'+'">' +
    '<input type="hidden" name="lng" value="'+'<%=longi%>'+'">' +
    '</form>'+'</div>';
     //인포윈도우 표시 위치입니다
    iwRemoveable = true;

	// 인포윈도우를 생성합니다	
	var infowindow = new kakao.maps.InfoWindow({
	    position : markerPosition, 
	    content : iwContent,
	    removable : iwRemoveable
	});

    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
    
    kakao.maps.event.addListener(marker, 'rightclick', function() {
    	if(confirm('<%=name%>'+" 관련 포스팅 보시겠습니까?")){
			location.href="postStore.jsp?storeName="+"<%=name%>";
			return false;
		}else{
			return false;
		}
    });
</script>	

<%		 
	}
%>

<!-- click 하면 실행 되는 맵 -->
<script>

var markerClickWindow = new kakao.maps.InfoWindow({zIndex:1});
var markerClickContent = '';
var ps = new kakao.maps.services.Places();
var markerClick = new kakao.maps.Marker();
var markers = [];
var markerss = [];
var clusterer = new kakao.maps.MarkerClusterer({
    map: map,
    gridSize: 60,
    minLevel: 2,
    minClusterSize: 3,
    styles: [{
        width : '53px', height : '52px',
        background: 'url(cluster.png) no-repeat',
        color: '#004581',
        textAlign: 'center',
        lineHeight: '54px'
    }]
});

//////////////////////////장소 클릭 
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

	var storelat = Number(mouseEvent.latLng.getLat());
	var storelng = Number(mouseEvent.latLng.getLng());
	var storelocation = mouseEvent.latLng;

    /* 카테고리 아이디로 장소를 검색합니다 https://apis.map.kakao.com/web/documentation/#CategoryCode */
    ps.categorySearch('FD6', placesSearchCB, {
    	location: storelocation,
    	radius : 8
    	}); 
	
	clusterer.removeMarkers(markers);
	
	markers.splice(0,markers.length);
	
	markerClickWindow.close(map,markerClick); 
	
	//callback 함수 placesSearchCB
	function placesSearchCB (data, status, pagination) {
	 if (status === kakao.maps.services.Status.OK) {
		
		 displayMarker(data);
	     
		 clusterer.addMarkers(markers);
	 }
	}
})

//지도에 마커를 표시하는 함수입니다
function displayMarker(places) {
	var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
	
	
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);
	
	for(var i=0; i<places.length;i++){
		// 마커를 생성하고 지도에 표시합니다
	 	var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png' ; // 마커 이미지 url, 스프라이트 이미지를 씁니다
		var imageSize = new kakao.maps.Size(36, 37);  // 마커 이미지의 크기
		var imgOptions =  {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		        spriteOrigin : new kakao.maps.Point(0, (i*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
				
		}
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions);
	 	
		var placePosition = new kakao.maps.LatLng(places[i].y,places[i].x);
	
		markerClick = new kakao.maps.Marker({
	        position: placePosition,
	        image : markerImage
	 	});
	 	markers.push(markerClick);
		
		
	 	var itemEl = getListItem(i, places[i]);
	 	
	 	(function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                markerClickWindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                markerClickWindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
	}
 
	listEl.appendChild(fragment);
    menuEl.scrollTop = 0;
	 
}

function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone + 
      '<form name="storeInfo" action="MapToStoreInsertToPostInsert.dd">' +
      '<button type="submit">등록하기</button>' +  
      '<input type="hidden" name="storeName" value="'+places.place_name +'">' +
      '<input type="hidden" name="lat" value="'+places.y+'">' +
      '<input type="hidden" name="lng" value="'+places.x +'">' +
      '</form>' + '</span>' + '</div>'; 
      
    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    markerClickWindow.setContent(content);
    markerClickWindow.open(map, markerClick);
}

function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}


</script>

</body>
</html>