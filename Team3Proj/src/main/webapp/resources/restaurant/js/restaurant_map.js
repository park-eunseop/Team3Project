// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
function createMarkerImage(src, size, options) {
	var markerImage = new kakao.maps.MarkerImage(src, size,
			options);
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



				var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
				mapOption = {
					center : new kakao.maps.LatLng(37.498004414546934,
							127.02770621963765), // 지도의 중심좌표 
					level : 3
				// 지도의 확대 레벨 
				};

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				// 커피숍 마커가 표시될 좌표 배열입니다
				var coffeePositions = [
						new kakao.maps.LatLng(37.499590490909185,
								127.0263723554437),
						new kakao.maps.LatLng(37.499427948430814,
								127.02794423197847),
						new kakao.maps.LatLng(37.498553760499505,
								127.02882598822454),
						new kakao.maps.LatLng(37.497625593121384,
								127.02935713582038),
						new kakao.maps.LatLng(37.49646391248451,
								127.02675574250912),
						new kakao.maps.LatLng(37.49629291770947,
								127.02587362608637),
						new kakao.maps.LatLng(37.49754540521486,
								127.02546694890695) ];

				// 편의점 마커가 표시될 좌표 배열입니다
				var storePositions = [
						new kakao.maps.LatLng(37.497535461505684,
								127.02948149502778),
						new kakao.maps.LatLng(37.49671536281186,
								127.03020491448352),
						new kakao.maps.LatLng(37.496201943633714,
								127.02959405469642),
						new kakao.maps.LatLng(37.49640072567703,
								127.02726459882308),
						new kakao.maps.LatLng(37.49640098874988,
								127.02609983175294),
						new kakao.maps.LatLng(37.49932849491523,
								127.02935780247945),
						new kakao.maps.LatLng(37.49996818951873,
								127.02943721562295) ];

				// 주차장 마커가 표시될 좌표 배열입니다
				var carparkPositions = [
						new kakao.maps.LatLng(37.49966168796031,
								127.03007039430118),
						new kakao.maps.LatLng(37.499463762912974,
								127.0288828824399),
						new kakao.maps.LatLng(37.49896834100913,
								127.02833986892401),
						new kakao.maps.LatLng(37.49893267508434,
								127.02673400572665),
						new kakao.maps.LatLng(37.49872543597439,
								127.02676785815386),
						new kakao.maps.LatLng(37.49813096097184,
								127.02591949495914),
						new kakao.maps.LatLng(37.497680616783086,
								127.02518427952202) ];

				coffeeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
				storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
				carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다

				var markerRestaurantImage = '/veve/resources/restaurant/images/restaurant.png';
				var markerCafeImage = '/veve/resources/restaurant/images/cafe.png';

				createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
				createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
				createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다

				changeMarker('coffee'); // 지도에 커피숍 마커가 보이도록 설정합니다    

				
				
				var overlay = null;
				
				// 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
				function createCoffeeMarkers() {

					for (var i = 0; i < coffeePositions.length; i++) {

						var imageSize = new kakao.maps.Size(22, 26), imageOptions = {
							offset : new kakao.maps.Point(27, 69)
						};

						// 마커이미지와 마커를 생성합니다
						var markerImage = createMarkerImage(
								markerRestaurantImage, imageSize, imageOptions), 
								marker = createMarker(
								coffeePositions[i], markerImage);
						
						
						
						//오버레이설정
						var content = '<div class="wrap">'
								+ '    <div class="info">'
								+ '        <div class="title">'
								+ '            가산동 서브웨이'
								+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
								+ '        </div>'
								+ '        <div class="body">'
								+ '            <div class="img">'
								+ '                <img src="/veve/resources/restaurant/images/subway.png" width="73" height="70">'
								+ '           </div>'
								+ '            <div class="desc">'
								+ '                <div class="ellipsis">간단 설명</div>'
								+ '                <div class="jibun ellipsis">주소적기</div>'
								+ '                <div><a href="https://www.subway.co.kr/" target="_blank" class="link">식당 리뷰보기</a></div>'
								+ '            </div>' + '        </div>'
								+ '    </div>' + '</div>';

						// 마커 위에 커스텀오버레이를 표시합니다
						// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
						 overlay = new kakao.maps.CustomOverlay({
							content : content,
							map : map,
							position : marker.getPosition()
						});
						
						
						// 생성된 마커를 커피숍 마커 배열에 추가합니다
						coffeeMarkers.push(marker);
	
					}

				}

				

				// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
				function setCoffeeMarkers(map) {
					for (var i = 0; i < coffeeMarkers.length; i++) {
						coffeeMarkers[i].setMap(map);
					}
				}

				// 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
				function createStoreMarkers() {
					for (var i = 0; i < storePositions.length; i++) {

						var imageSize = new kakao.maps.Size(22, 26), imageOptions = {
							offset : new kakao.maps.Point(27, 69)
						};

						// 마커이미지와 마커를 생성합니다
						var markerImage = createMarkerImage(markerImageSrc,
								imageSize, imageOptions), marker = createMarker(
								storePositions[i], markerImage);

						// 생성된 마커를 편의점 마커 배열에 추가합니다
						storeMarkers.push(marker);
					}
				}

				// 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
				function setStoreMarkers(map) {
					for (var i = 0; i < storeMarkers.length; i++) {
						storeMarkers[i].setMap(map);
					}
				}

				// 주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
				function createCarparkMarkers() {
					for (var i = 0; i < carparkPositions.length; i++) {

						var imageSize = new kakao.maps.Size(22, 26), imageOptions = {
							spriteOrigin : new kakao.maps.Point(10, 72),
							spriteSize : new kakao.maps.Size(36, 98)
						};

						// 마커이미지와 마커를 생성합니다
						var markerImage = createMarkerImage(markerImageSrc,
								imageSize, imageOptions), marker = createMarker(
								carparkPositions[i], markerImage);

						// 생성된 마커를 주차장 마커 배열에 추가합니다
						carparkMarkers.push(marker);
					}
				}

				// 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
				function setCarparkMarkers(map) {
					for (var i = 0; i < carparkMarkers.length; i++) {
						carparkMarkers[i].setMap(map);
					}
				}

				// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
				function changeMarker(type) {

					var coffeeMenu = document.getElementById('coffeeMenu');
					var storeMenu = document.getElementById('storeMenu');
					var carparkMenu = document.getElementById('carparkMenu');

					// 커피숍 카테고리가 클릭됐을 때
					if (type === 'coffee') {

						// 커피숍 카테고리를 선택된 스타일로 변경하고
						coffeeMenu.className = 'menu_selected';

						// 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
						storeMenu.className = '';
						carparkMenu.className = '';

						// 커피숍 마커들만 지도에 표시하도록 설정합니다
						setCoffeeMarkers(map);
						setStoreMarkers(null);
						setCarparkMarkers(null);

					} else if (type === 'store') { // 편의점 카테고리가 클릭됐을 때

						// 편의점 카테고리를 선택된 스타일로 변경하고
						coffeeMenu.className = '';
						storeMenu.className = 'menu_selected';
						carparkMenu.className = '';

						// 편의점 마커들만 지도에 표시하도록 설정합니다
						setCoffeeMarkers(null);
						setStoreMarkers(map);
						setCarparkMarkers(null);

					} else if (type === 'carpark') { // 주차장 카테고리가 클릭됐을 때

						// 주차장 카테고리를 선택된 스타일로 변경하고
						coffeeMenu.className = '';
						storeMenu.className = '';
						carparkMenu.className = 'menu_selected';

						// 주차장 마커들만 지도에 표시하도록 설정합니다
						setCoffeeMarkers(null);
						setStoreMarkers(null);
						setCarparkMarkers(map);
					}
				}

				//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
				kakao.maps.event.addListener(marker, 'click', function() {
					overlay.setMap(map);
					console.log("마커 누름 확인")
				});

				// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
				function closeOverlay() {
					overlay.setMap(null);
				}
