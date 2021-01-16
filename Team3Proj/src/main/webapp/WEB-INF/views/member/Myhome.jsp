<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<script>
      $(function() {    //화면 다 뜨면 시작
    	var arraydata;
		$.ajax({
			type : 'post',
			url : "<c:url value="/json"/>",
			dataType : "json",
			success : function(data) {
				console.log("%O",Object.values(data));
				arraydata=Object.values(data);
				console.log(arraydata);
				$("#search").autocomplete({
					source: arraydata,
			        select: function(event, ui) {
			            console.log(ui.item);
			        },
			        focus: function(event, ui) {
			            return false;
			        }
			    });
			}
		});//ajax
	});
</script>
<!-- 새로 만든 스타일 -->
<style>
#first_container{
	padding-top: 200px;
	/* 132px이 딱 맞는 크기*/
}
</style><!-- 새로 만든 스타일 -->


<!-- 새로 만든 틀 -->
<div class="container" id="first_container">
	<div class="row">
		<div class="col-md-12">
		
			<div class="row">
				<div class="col-md-4">
					<img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" />
					 <a id="modal-193710" href="#modal-container-193710" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
					
					<div class="modal fade" id="modal-container-193710" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="myModalLabel">
										Modal title
									</h5> 
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">
									...
								</div>
								<div class="modal-footer">
									 
									<button type="button" class="btn btn-primary">
										Save changes
									</button> 
									<button type="button" class="btn btn-secondary" data-dismiss="modal">
										Close
									</button>
								</div>
							</div>
							
						</div>
						
					</div>
					
					 <a id="modal-751188" href="#modal-container-751188" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
					
					<div class="modal fade" id="modal-container-751188" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="myModalLabel">
										Modal title
									</h5> 
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">
									...
								</div>
								<div class="modal-footer">
									 
									<button type="button" class="btn btn-primary">
										Save changes
									</button> 
									<button type="button" class="btn btn-secondary" data-dismiss="modal">
										Close
									</button>
								</div>
							</div>
							
						</div>
						
					</div>
					
				</div>
				<div class="col-md-4">
					<h2>
						Heading
					</h2>
					<p>
						Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
					</p>
					<p>
						<a class="btn" href="#">View details »</a>
					</p>
				</div>
				<div class="col-md-4">
					<div id="card-560222">
						<div class="card">
							<div class="card-header">
								 <a class="card-link" data-toggle="collapse" data-parent="#card-560222" href="#card-element-992035">Collapsible Group Item #1</a>
							</div>
							<div id="card-element-992035" class="collapse show">
								<div class="card-body">
									Anim pariatur cliche...
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								 <a class="card-link" data-toggle="collapse" data-parent="#card-560222" href="#card-element-656013">Collapsible Group Item #2</a>
							</div>
							<div id="card-element-656013" class="collapse show">
								<div class="card-body">
									Anim pariatur cliche...
								</div>
							</div>
						</div>
					</div>
					<div class="carousel slide" id="carousel-464309">
						<ol class="carousel-indicators">
							<li data-slide-to="0" data-target="#carousel-464309">
							</li>
							<li data-slide-to="1" data-target="#carousel-464309">
							</li>
							<li data-slide-to="2" data-target="#carousel-464309" class="active">
							</li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item">
								<img class="d-block w-100" alt="Carousel Bootstrap First" src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg" />
								<div class="carousel-caption">
									<h4>
										First Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" alt="Carousel Bootstrap Second" src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
								<div class="carousel-caption">
									<h4>
										Second Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
							<div class="carousel-item active">
								<img class="d-block w-100" alt="Carousel Bootstrap Third" src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
								<div class="carousel-caption">
									<h4>
										Third Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
						</div> <a class="carousel-control-prev" href="#carousel-464309" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-464309" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
					</div>
				</div>
			</div>
			
			<!-- tab -->
			<div class="tabbable" id="tabs-869666">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active" href="#tab1" data-toggle="tab">내 피드</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#tab2" data-toggle="tab">내 레시피</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#tab3" data-toggle="tab">스크랩</a>
					</li>
				</ul>
				<div class="tab-content">
					<!-- tab1 내 피드 -->
					<div class="tab-pane active" id="tab1">
						<p>
							내 피드가 들어갈 곳
						</p>
						<!-- sumnail  -->
						<div class="row">
							<div class="col-md-4">
								<div class="card">
									<img class="card-img-top" alt="Bootstrap Thumbnail First" src="https://www.layoutit.com/img/people-q-c-600-200-1.jpg" />
									<div class="card-block">
										<h5 class="card-title">
											Card title
										</h5>
										<p class="card-text">
											Cras justo odio, dapibus ac facilisis i<span>n, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</span>
										</p>
										<p>
											<a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="card">
									<img class="card-img-top" alt="Bootstrap Thumbnail Second" src="https://www.layoutit.com/img/city-q-c-600-200-1.jpg" />
									<div class="card-block">
										<h5 class="card-title">
											Card title
										</h5>
										<p class="card-text">
											Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
										</p>
										<p>
											<a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="card">
									<img class="card-img-top" alt="Bootstrap Thumbnail Third" src="https://www.layoutit.com/img/sports-q-c-600-200-1.jpg" />
									<div class="card-block">
										<h5 class="card-title">
											Card title
										</h5>
										<p class="card-text">
											Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
										</p>
										<p>
											<a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
										</p>
									</div>
								</div>
							</div>
						</div><!-- sumnail  -->
						
					</div><!-- tab1 내 피드 -->
					
					<!-- 두번째 tab 내 레시피 -->
					<div class="tab-pane" id="tab2">
						<p>
							Section 2. 내 레시피 보여주기
						</p>
					</div><!-- 두번째 tab 내 레시피 -->
					
					<!-- 세번째 tab 내 레시피 -->
					<div class="tab-pane" id="tab3">
						<p>
							 Section 3. 스크랩한 것들
						</p>
					</div><!-- 세번째 tab 내 레시피 -->
					
					
				</div><!-- tab-content -->
			</div><!-- tab -->
			
			
			
		</div><!--최외각 col-md-12 -->
	</div><!-- row -->
</div><!-- first_container -->




<!-- Page Container -->
<div class="w3-content w3-margin-top" style="max-width: 1400px;">

	<!-- The Grid  -->
	<div class="w3-row-padding">

		<!-- Left Column-->
		<div class="w3-third">

			<div class="w3-white w3-text-grey w3-card-4">
				<div class="w3-display-container">
					<c:if test="${empty KakaoUserId}" var="isNotKakaologin">
						<img src='<c:url value="/upload/${filedto.f_name}"/>'
							style="width: 100%" alt="Avatar">
					</c:if>
					<c:if test="${not isNotKakaologin }">
						<img src='${KakaoUserImg}' style="width: 100%" alt="KaKaoAvatar">
					</c:if>
				</div>
				<div class="w3-container">
					<p>
						<i class="fa fa-certificate fa-fw w3-margin-right w3-large w3-text-teal"></i>${userdto.nickname}</p>
					<p>
						<i
							class="fa fa-certificate fa-fw w3-margin-right w3-large w3-text-teal"></i>${userdto.vg_level}</p>
					<p>
						<i
							class="fa fa-certificate fa-fw w3-margin-right w3-large w3-text-teal"></i>${userdto.selfintro}</p>
					<p>
						<i
							class="fa fa-certificate fa-fw w3-margin-right w3-large w3-text-teal"></i>팔로잉
						/ 팔로워
					</p>
					<div>
						<a href="<c:url value="/Member/Mypage.do"/>"
							class="btn btn-success btn-sm">개인정보 수정 </a>
						<c:if test="${empty KakaoUserId}" var="isNotKakaologin">
							<a href="javascript:logout()" class="btn btn-success btn-sm">로그아웃
							</a>
						</c:if>
						<c:if test="${not isNotKakaologin }">
							<a href="<c:url value="/logout"/>" class="btn btn-success btn-sm">로그아웃</a>
						</c:if>
					</div>
					<div>
						<form method="get" action="<c:url value="/Member/OtherHome.do"/>">
							<input id="search" name="otherid" style="width: 200px" /> <input
								id="serarchBtn" type="submit" class="btn" value="research">
						</form>
					</div>
					<hr>

					<p class="w3-large">
						<b><i
							class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>나의
							식단 분석표</b>
					</p>
					<p>필수 아미노산</p>
					<div class="w3-light-grey w3-round-xlarge w3-small">
						<div class="w3-container w3-center w3-round-xlarge w3-teal"
							style="width: 90%">90%</div>
					</div>
					<p>철분</p>
					<div class="w3-light-grey w3-round-xlarge w3-small">
						<div class="w3-container w3-center w3-round-xlarge w3-teal"
							style="width: 80%">
							<div class="w3-center w3-text-white">80%</div>
						</div>
					</div>
					<p>아연</p>
					<div class="w3-light-grey w3-round-xlarge w3-small">
						<div class="w3-container w3-center w3-round-xlarge w3-teal"
							style="width: 75%">75%</div>
					</div>
					<p>비타민B</p>
					<div class="w3-light-grey w3-round-xlarge w3-small">
						<div class="w3-container w3-center w3-round-xlarge w3-teal"
							style="width: 50%">50%</div>
					</div>


					<a href="<c:url value="/Member/MemberDiet.do"/>"
						class="btn btn-success">식단 분석 </a> <br>

					<p class="w3-large w3-text-theme">
						<b><i
							class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>게시물</b>
					</p>
					<p>갤러리</p>
					<div class="w3-light-grey w3-round-xlarge">
						<div class="w3-round-xlarge w3-teal"
							style="height: 24px; width: 100%"></div>
					</div>
					<p>레시피</p>
					<div class="w3-light-grey w3-round-xlarge">
						<div class="w3-round-xlarge w3-teal"
							style="height: 24px; width: 55%"></div>
					</div>
					<br>
				</div>
			</div>
			<br>



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
				<a href="<c:url value="/recipe.do"/>" class="btn btn-success">레시피
					작성</a>
				<iframe allow="microphone;" width="350" height="430"
					src="https://console.dialogflow.com/api-client/demo/embedded/8a19ff3d-cdd4-46e7-933c-3644cded410f">
				</iframe>

			</div>
			<div class="w3-container w3-card w3-white w3-margin-bottom">
				<h2 class="w3-text-grey w3-padding-16">검색/방문한 식당 위치 맵</h2>
				<div id="map" style="width: 100%; height: 350px;"></div>
				<a href="<c:url value="/Board/Restaurant.do"/>"
					class="btn btn-success">맛집 검색 </a>
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


			<div class="w3-container w3-card w3-white w3-margin-bottom">
				<h2 class="w3-text-grey w3-padding-16">채팅 공간</h2>
				<a href="<c:url value="/chatting/WebSocket.do"/>"
					class="btn btn-success" style="margin-bottom: 30px">채팅하러가기</a>
			</div>


			<!-- End Right Column    -->
		</div>

		<!-- End Grid  -->
	</div>

	<!-- End Page Container -->
</div>


