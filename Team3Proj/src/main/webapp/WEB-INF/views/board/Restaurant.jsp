<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>



<!-- /veve/resources/restaurant/images/restaurant.png -->
<!-- 지도 css 수정 필요 -->
<link rel="stylesheet" href="/veve/resources/restaurant/css/restaurant_map.css">
<div id="mapwrap" style="padding-top: 132px">
	<!-- 지도가 표시될 div -->
	<div id="map" style="width: 100%; height: 710px;"></div>
</div>

<!-- 지도 javaScript-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d0c2399991c756eb5abacf77c945032a&libraries=services,clusterer"></script>
<script>
	var restaurantPositions = [];//new kakao.maps.LatLng(위도,경도) 형식으로 넣기
	//로드시 ajax로 list를 json형태로 받아오기
	$(document).ready(function(){
		$.ajax({//async: false를 주지 않으면 비동기 방식 처리로 인해 변수에 담기 불가
		     url:"<c:url value='/Board/Restaurant/List.do'/>",
		     data:{"category":"restaurant"},
		     dataType:'json',
		     type:'post',
		     async: false,//비동기식을 동기식으로 바꾼다.
		     success:function(restaurants){
		   	 	console.log('json 데이터 받기 확인');
		   	 	console.log(restaurants);
		   	 	console.log("첫번째거: "+restaurants[0]["RES_COORDINATE"])
		   	 	
		   	 	$.each(restaurants, function (index, restaurant) {
		   	 		var restaurantLat = restaurant["RES_COORDINATE"].split(",")[0];
		   	 		var restaurantLng = restaurant["RES_COORDINATE"].split(",")[1];
		   	 		//console.log("위도"+restaurantLat);
		   	 		//console.log("경도"+restaurantLng);
		   	 		restaurantPositions.push(new kakao.maps.LatLng(restaurantLat, restaurantLng));
		   	 	});
		   	 	
		   	 	
		     },
		     error:function(e){
		    	 console.log("오류확인");
		    	 console.log(e);
		    }
		     
		});
      
	});///ready
 
	
	/* 지도  */
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = {
		center : new kakao.maps.LatLng(37.478842175670344, 126.8786711738891), // 지도의 중심좌표 //학원 위치
		level : 3 // 지도의 확대 레벨 
	};
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	/* 지도  */
	
	
	//주석 지우고 위에 코드로 변경하기
	//식당 마커가 표시될 좌표 배열   //마커 개수가 달라서 아래 마커가 보이지 않았었다.
	var restaurantPositions = [];//new kakao.maps.LatLng(위도,경도) 형식으로 넣기
	var list_coordinate_res = ${list_coordinate_res};//DB에서 가져온 식당 좌표
	//console.log(list_coordinate_res.length);
	//console.log(list_coordinate_res[0]);
	for(var i=0; i<list_coordinate_res.length; i+=2){//식당 좌표를 카카오 맵 형태 위도 경도 좌표로 변환
		restaurantPositions.push(new kakao.maps.LatLng(list_coordinate_res[i], list_coordinate_res[i+1]));
	};
	
	console.log("실험:"+restaurantPositions);
	
	//까페 마커가 표시될 좌표 배열
	var cafePositions = [
			new kakao.maps.LatLng(37.4777576146415, 126.88767650710993),//스무디킹 가산
			new kakao.maps.LatLng(37.49671536281186, 127.03020491448352),//임시...
			new kakao.maps.LatLng(37.496201943633714, 127.02959405469642),
			new kakao.maps.LatLng(37.49640072567703, 127.02726459882308),
			new kakao.maps.LatLng(37.49640098874988, 127.02609983175294),
			new kakao.maps.LatLng(37.49932849491523, 127.02935780247945),
			new kakao.maps.LatLng(37.49996818951873, 127.02943721562295) 
			];


	var restaurantMarkers = []; // 식당 마커 객체를 가지고 있을 배열
	var cafeMarkers = []; // 까페 마커 객체를 가지고 있을 배열
	var overlayArray = [];//overlay 생성해서 담을 배열
	var overlay = null;
	
	var markerRestaurantImage = '/veve/resources/restaurant/images/restaurant.png';//마커이미지 주소
	var markerCafeImage = '/veve/resources/restaurant/images/cafe.png';

	createRestaurantMarkers(); // 식당 마커를 생성하고 식당 마커 배열에 추가합니다
	createCafeMarkers(); // 까페 마커를 생성하고 까페 마커 배열에 추가합니다

	changeMarker('restaurant'); // 지도에 식당 마커가 보이도록 설정합니다    

	
	
	//////////////////////////////////////////////////로직
	// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
	function createMarkerImage(src, size, options) {
		var markerImage = new kakao.maps.MarkerImage(src, size, options);
		return markerImage;
	}

	// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
	function createMarker(position, image) {
		var marker = new kakao.maps.Marker({
			position : position,
			image : image
		});
		return marker;
	}


	// 식당 마커를 생성하고 식당 마커 배열에 추가하는 함수입니다
	function createRestaurantMarkers() {
		for (var i = 0; i < restaurantPositions.length; i++) {
			var imageSize = new kakao.maps.Size(40, 45), imageOptions = {
				offset : new kakao.maps.Point(27, 69)
			};
			// 마커이미지와 마커를 생성합니다
			var markerImage = createMarkerImage(markerRestaurantImage, imageSize, imageOptions);
			//eval("var marker" + i + "= createMarker(restaurantPositions[i], markerImage);");
			//eval 이 아닌 marker 배열이용하기
			var marker = createMarker(restaurantPositions[i], markerImage);
			
			// 생성된 마커를 restaurant 마커 배열에 추가합니다
			restaurantMarkers.push(marker);
			
			//오버레이설정 
			var content = 
					'<div class="wrap" style="z-index:2">'
					+ '    <div class="info">'
					+ '        <div class="title">' 
					+ '            가산동 서브웨이'
					+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
					+ '        </div>'
					+ '        <div class="body">'
					+ '            <div class="img">'
					+ '                <img src="/veve/resources/restaurant/images/subway.png" width="73" height="70">'
					+ '            </div>'
					+ '            <div class="desc">'
					+ '                <div class="ellipsis">간단 설명</div>'
					+ '                <div class="jibun ellipsis">주소적기</div>'
					+ '                <div><a href="https://www.subway.co.kr/" target="_blank" class="link">식당 리뷰보기</a></div>'
					+ '            </div>' 
					+ '        </div>' 
					+ '    </div>'
					+ '</div>';
					
					
			// 마커 위에 커스텀오버레이를 표시합니다
			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			overlay = new kakao.maps.CustomOverlay({
				content : content,
				map : map,
				position : marker.getPosition()
			});
			
			
		}///for 문
	}////////createRestaurantMarkers


	
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay() {
		overlay.setMap(null);//오류 배열에서 하나 골라서 제거할 수 있게 하기
	}

	
	// restaurant 마커들의 지도 표시 여부를 설정하는 함수입니다
	function setRestaurantMarkers(map) {
		for (var i = 0; i < restaurantMarkers.length; i++) {
			restaurantMarkers[i].setMap(map);
		}
	}

	// cafe 마커를 생성하고 cafe 마커 배열에 추가하는 함수입니다
	function createCafeMarkers() {
		for (var i = 0; i < cafePositions.length; i++) {

			var imageSize = new kakao.maps.Size(40, 45), imageOptions = {
				offset : new kakao.maps.Point(27, 69)
			};

			// 마커이미지와 마커를 생성합니다
			var markerImage = createMarkerImage(markerCafeImage, imageSize, imageOptions); 
			var	marker = createMarker(cafePositions[i], markerImage);

			// 생성된 마커를 cafe마커 배열에 추가합니다
			cafeMarkers.push(marker);
		}
	}

	function setCafeMarkers(map) {
		for (var i = 0; i < cafeMarkers.length; i++) {
			cafeMarkers[i].setMap(map);
		}
	}


	// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
	function changeMarker(type) {

		var restaurantMenu = document.getElementById('restaurantMenu');
		var cafeMenu = document.getElementById('cafeMenu');

		if (type === 'restaurant') {// 식당  메뉴보기가 선택되었을때
			// 카테고리를 선택된 스타일로 변경 
			// 카테고리 스타일을 변경 할 수 없지만 이 오류를 삭제할시, 오버레이가 닫히지 않는 오류가 생긴다. 
			restaurantMenu.className = 'menu_selected';
			cafeMenu.className = '';
			allMenu.className = '';
			
			setRestaurantMarkers(map);
			setCafeMarkers(null);

		} else if (type === 'cafe') {//까페 메뉴 선택시
			restaurantMenu.className = '';
			cafeMenu.className = 'menu_selected';
			allMenu.className = '';

			setRestaurantMarkers(null);
			setCafeMarkers(map);

		} else if (type === 'all') { //함께보기가 선택되었을때
			restaurantMenu.className = '';
			cafeMenu.className = '';
			allMenu.className = 'menu_selected';

			setRestaurantMarkers(map);
			setCafeMarkers(map);
		}
	}
</script>

<!-- 마커와 오버레이  선택시 표시 -->
<script>
	//console.log(restaurantMarkers)

	//console.log(typeof restaurantMarkers);
	window.onload = function() {
		changeMarker('restaurant');
		overlay.setMap(null);//시작시 overlay 가 보이지 않게하기 위함.
	} // 지도에 식당 마커가 보이도록 설정합니다    

	/////////////////////////////오버레이 
	//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	kakao.maps.event.addListener(restaurantMarkers[0], 'click', function() {
		overlay.setMap(map);
		//console.log("마커 누름 확인")

	});
	// 위에서는 적용이 안된다...
	
	function lookOverlay(){
		overlay.setMap(map);
	}
	
	//뿌려줄 식당 li 개수 구하기
	
	
	
	
	//자바 스크립트로 카테고리 버튼 제어
	function buttonClicked(ele){
		if($('#buttonClickedStyle').length){//아이디 있는지 확인
			//jquery 방식 id 없애기
			$('.category_button div').removeAttr('id');
		}
		ele.id = 'buttonClickedStyle';//자스로 id 주기
	}
	
	

</script>



<!-- 매장검색 div style -->
<style>
.store_search {
    position: absolute;
    left: 20px;
    top: 152px;
    z-index: 3;
    width: 330px;
    height: 560px;
    padding: 20px 20px;
    background-color: #fff;
    border: 1px solid #dddddd;
}
.store_search h2{
	font-weight: 800;
}
/*category button*/
.category_button{
	text-align: center;
	float: left;
}
.category_button div{
	float: left;
	width: 90px;
	font-weight: 600;
	border: 1px solid #edc112;
	border-radius: 20px;
	color: #edc112;
	padding: 6px 15px 6px 15px;
	margin-right: 6px;
	margin-bottom: 10px;
}
.category_button div:hover{
	color: #fff;
	border: 1px solid #F3D55A;
	background-color: #F3D55A;
	cursor: pointer;
}
.category_button div:active{/*클릭시에 약간 진하게*/
	color: #fff;
	background-color: #e7bd13;
}

/* 버튼 눌린 효과*/
/* 아이디 선택자의 css 우선순위가 높은 걸 이용*/
#buttonClickedStyle {
	color: #fff;
	border: 1px solid #F3D55A;
	background-color: #F3D55A;
}


/*검색 input과  검색 결과 수 */
.form_search{
	clear: both;
}
.store_search h2 {
	text-align: center;
}
.search_total strong{
	color: #f0c828;
}
#mapSearchKeyword{
	width: 100%;
	outline: none;
}



/*검색 결과 list*/
#list_container{
	overflow: auto;
	height:360px;
}
#search_ul{
	cursor: pointer;
	list-style:none;
	padding-left: 10px;
}
#search_ul li{
	padding-top: 10px;
	padding-bottom: 10px;
	border-bottom: 2px #F1F1F1 solid;
}
#search_ul li h4{
	color: black;
	font-weight: 600;
}


</style>



<div class="store_search">
	<h2>매장찾기</h2>
	<!-- 임시 카테고리 버튼 -->
	<div class="category-btn">
		<div style="display:none">
			<ul><!-- 없으면 버튼이 적용되지 않음 -->
				<li id="restaurantMenu" onclick="changeMarker('restaurant')" class=''>
					<span class="ico_comm ico_coffee"></span> 음식점</li>
				<li id="cafeMenu" onclick="changeMarker('cafe')" class=''>
					<span class="ico_comm ico_store"></span> 까페</li>
				<li id="allMenu" onclick="changeMarker('all')" class=''>
					<span class="ico_comm ico_all"></span> 함께 보기</li> 
			</ul> 
		</div> 
		<div class="category_button">
			<div id="buttonClickedStyle" onclick="changeMarker('restaurant'); buttonClicked(this);">음식점</div>
			<div onclick="changeMarker('cafe'); buttonClicked(this);">까페</div>
			<div onclick="changeMarker('all'); buttonClicked(this);">함께 보기</div>
		</div>
	</div><!-- 카테고리 버튼 -->
	
	<!-- 검색 -->
	<div class="form_search">
	<!-- 자스로 검색 onsubmit 시에 작용할 함수 storeSearch()만들기 -->
		<form id="mapForm" method="POST" name="mapForm" onsubmit="return storeSearch()">
			<input id="mapSearchKeyword" maxlength="30" placeholder="지역 또는 매장명을 입력해주세요." type="text" value="">
			<!-- 검색 버튼 -->
			<a class="btn_search" href="#" onclick="storeSearch();return false;"></a>
		</form>
	</div>
	<!-- 검색 -->

	<!-- 검색결과 -->
	<div class="search_result_cont" id="uiReslutCont">
		<!-- 검색 결과 항목개수 뿌려주기 -->
		<p class="search_total">검색 결과 <strong>19</strong>건</p>
		<!-- 검색 결과 스크롤로 보이게 하기 --> 
		<div id="list_container">
			<!-- 검색시  ul 안에 li 추가해 넣거나, 검색결과없음 넣기 -->
			<!-- li넣을때 클릭시 마커에 info 표시 될 수 있게 자스 처리하기 -->
			<ul id="search_ul" style="display: block;">
				<c:forEach var="item" items="${restaurant_list }" varStatus="loop">
					<li onclick="lookOverlay()">    
						<h4>${item.res_name}</h4>  
					   	<div>        
				      		<span>${item.res_addr}</span><br/>   
				        	<span>연락처 : ${item.res_tel}</span><br/>     
				           	<span>카테고리: ${item.category}</span><br/>       
		            	</div>
	            	</li>  
				</c:forEach>
			</ul>
			
		</div>
	</div><!-- 검색결과 -->
	
	
</div><!-- 매장 찾기 --> 




