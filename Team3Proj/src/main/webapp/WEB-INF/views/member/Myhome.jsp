<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- 
<section>
	<div class="row text-center" style="padding-top: 30px; height: 800px">
		<div class="col-sm-4">
			<span class="margin">레시피 게시물</span> <a
				href="<c:url value="/Board/Recipe.do"/>" class="btn btn-success">레시피
				작성</a>

		</div>
		<div class="col-sm-4" style="height: 500px">
			<div>
				<img
					style="border: 3px solid gold; border-radius: 7px; -moz-border-radius: 7px; -khtml-border-radius: 7px; -webkit-border-radius: 7px; width: 50%; height: 50%"
					src='<c:url value="/upload/${filedto.f_name}"></c:url>' alt="no">

			</div>
			<div>
				<div>${userdto.nickname}</div>
				<textarea style="width: 100%; padding-top: 10px; border: none"
					rows="5" cols="5">${userdto.selfintro}</textarea>
			</div>
			<div>
				<a href="<c:url value="/Member/Mypage.do"/>"
					class="btn btn-success btn-sm">개인정보 수정 </a>
				<a href="javascript:logout()"
					class="btn btn-success btn-sm">로그아웃 </a>
			</div>
			<script>
			function logout(){
				//location.replace("<c:url value="/OneMemo/Auth/Logout.do"/>");
				$('#logoutForm').submit();//스프링 씨큐리티의 csrf공격 사용시
			}
			</script>
			<form id="logoutForm" method="post"
				action="<c:url value="/Member/Auth/Logout.do"/>">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
			<div>
				<button type="button" class="btn btn-info btn-sm"
					data-toggle="modal" data-target="#follower">팔로워(${follower})</button>
			 -->
				<!-- 팔로워 Modal
				<div class="modal fade" id="follower" role="dialog">
					<div class="modal-dialog">  -->
						<!-- Modal content
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">팔로워</h4>
							</div>
							<div class="modal-body">
								<c:forEach var="follower" items="${followerlist}">
								<img style="border: 3px solid gold; width: 50px; height: 50px"
								src='<c:url value="/upload/${follower.file_name}"></c:url>' alt="no">
								<a>${follower.nickname}</a>
								<a>삭제</a>
								</c:forEach>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<button type="button" class="btn btn-info btn-sm"
					data-toggle="modal" data-target="#following">팔로잉(${following})</button> -->
				<!-- 팔로잉 Modal  
				<div class="modal fade" id="following" role="dialog">
					<div class="modal-dialog">-->

						<!-- Modal content
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">팔로잉</h4>
							</div>
							<div class="modal-body">
								<c:forEach var="following" items="${followinglist}">
								<img style="border: 3px solid gold; width: 50px; height: 50px"
								src='<c:url value="/upload/${following.file_name}"></c:url>' alt="no">
								<a>${following.nickname}</a>
								<a>삭제</a>
								</c:forEach>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
		<div class="col-sm-4">
			<h4>식단 영양 프로그래스바</h4>
			<div>
				영양1
				<progress value="20" max="100"></progress>
			</div>
			<div>
				영양2
				<progress value="40" max="100"></progress>
			</div>
			<div>
				영양3
				<progress value="80" max="100"></progress>
			</div>
			<a href="<c:url value="/Member/MemberDiet.do"/>"
				class="btn btn-success">식단 분석 </a>


		</div>
	</div>
</section>
<section>
	<div class="text-center">
		<div class="margin">팔로워,자기가 작성한 갤러리 게시물</div>
		<div class="row text-center slideanim">
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src='<c:url value="/resources/vg_level/milk_on.png"/>'
						alt="milk" width="200px" height="300px">
					<p>
						<strong>Milk</strong>
					</p>
					<p>Yes, we love milk</p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src='<c:url value="/resources/vg_level/vg_on.png"/>'
						alt="banana" width="200px" height="300px">
					<p>
						<strong>Banana</strong>
					</p>
					<p>We like banana</p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src='<c:url value="/resources/vg_level/fish_on.png"/>'
						alt="fish" width="200px" height="300px">
					<p>
						<strong>Fish</strong>
					</p>
					<p>Yes, I sometimes eat fish</p>
				</div>
			</div>
		</div>
	</div>
	<a href="<c:url value="/Board/Gallary.do"/>" class="btn btn-success">갤러리
		작성 </a>
	<div class="text-center">
		<span class="margin">최근 검색 식당 위치</span> <a
			href="<c:url value="/Board/Restaurant.do"/>" class="btn btn-success">맛집
			검색 </a>
		<div id="map" style="width: 100%; height: 350px;"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eb3c657be3f57506889b45e9c871ee43&libraries=services">
			
		</script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder
					.addressSearch(
							'서울특별시 금천구 가산동 가산디지털1로 165 가산비즈니스센터 102호',
							function(result, status) {

								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new kakao.maps.Marker({
										map : map,
										position : coords
									});

									// 인포윈도우로 장소에 대한 설명을 표시합니다
									var infowindow = new kakao.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:6px 0;">서브웨이</div>'
											});
									infowindow.open(map, marker);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
		</script>
	</div>
</section> 
 -->
<!-- Page Container -->
<div class="w3-content w3-margin-top" style="max-width:1400px;">

  <!-- The Grid  -->
  <div class="w3-row-padding">
 
    <!-- Left Column-->
    <div class="w3-third">
    
      <div class="w3-white w3-text-grey w3-card-4">
        <div class="w3-display-container">
          <img src='<c:url value="/upload/${filedto.f_name}"/>' style="width:100%" alt="Avatar">
          <div class="w3-display-bottomleft w3-container w3-text-black">
            <h2>Jane Doe</h2>
          </div>
        </div>
        <div class="w3-container">
          <p><i class="fa fa-certificate fa-fw w3-margin-right w3-large w3-text-teal"></i>${userdto.nickname}</p>
          <p><i class="fa fa-certificate fa-fw w3-margin-right w3-large w3-text-teal"></i>${userdto.vg_level}</p>
          <p><i class="fa fa-certificate fa-fw w3-margin-right w3-large w3-text-teal"></i>${userdto.selfintro}</p>
          <p><i class="fa fa-certificate fa-fw w3-margin-right w3-large w3-text-teal"></i>팔로잉 / 팔로워</p>
          <div>
				<a href="<c:url value="/Member/Mypage.do"/>"
					class="btn btn-success btn-sm">개인정보 수정 </a>
				<a href="javascript:logout()"
					class="btn btn-success btn-sm">로그아웃 </a>
			</div>
          <hr>

          <p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>나의 식단 분석표</b></p>
          <p>필수 아미노산</p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:90%">90%</div>
          </div>
          <p>철분</p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:80%">
              <div class="w3-center w3-text-white">80%</div>
            </div>
          </div>
          <p>아연</p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:75%">75%</div>
          </div>
          <p>비타민B</p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:50%">50%</div>
          </div>
          <br>

          <p class="w3-large w3-text-theme"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>게시물</b></p>
          <p>갤러리</p>
          <div class="w3-light-grey w3-round-xlarge">
            <div class="w3-round-xlarge w3-teal" style="height:24px;width:100%"></div>
          </div>
          <p>레시피</p>
          <div class="w3-light-grey w3-round-xlarge">
            <div class="w3-round-xlarge w3-teal" style="height:24px;width:55%"></div>
          </div>
          <br>
        </div>
      </div><br>

    <!-- End Left Column -->
    </div>

    <!-- Right Column -->
     
    <div class="w3-twothird">
    
      <div class="w3-container w3-card w3-white w3-margin-bottom">
        <h2 class="w3-text-grey w3-padding-16">갤러리 게시판</h2>
        <a href="<c:url value="/Gallary/List.do"/>" class="btn btn-success">갤러리
		작성 </a>
        
      </div>
      <div class="w3-container w3-card w3-white w3-margin-bottom">
        <h2 class="w3-text-grey w3-padding-16">레시피 게시판</h2>
        <a href="<c:url value="/Board/Recipe.do"/>" class="btn btn-success">레시피
				작성</a>
        
      </div>
      <div class="w3-container w3-card w3-white w3-margin-bottom">
        <h2 class="w3-text-grey w3-padding-16">검색/방문한 식당 위치 맵</h2>
        <div id="map" style="width: 100%; height: 350px;"></div>
        <a href="<c:url value="/Board/Restaurant.do"/>" class="btn btn-success">맛집
			검색 </a>
       <script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eb3c657be3f57506889b45e9c871ee43&libraries=services">
			
		</script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder
					.addressSearch(
							'서울특별시 금천구 가산동 가산디지털1로 165 가산비즈니스센터 102호',
							function(result, status) {

								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new kakao.maps.Marker({
										map : map,
										position : coords
									});

									// 인포윈도우로 장소에 대한 설명을 표시합니다
									var infowindow = new kakao.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:6px 0;">서브웨이</div>'
											});
									infowindow.open(map, marker);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
		</script> 
        
      </div>
 

    <!-- End Right Column    -->
    </div>
  
  <!-- End Grid  -->
  </div>
 
  <!-- End Page Container -->
</div>
