<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script>
$(function() {   
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
  		
  		//follow버튼 클릭시
  		$('#follow').click(function(){
  			console.log('follow click');
  			$.ajax({
  				type : 'post',
  				url : "<c:url value="/Member/follow"/>",
  				dataType : "text",
  				success : function(data) {
  					console.log('follow success'); 
  					$('#follow').hide();
  					$('#following').removeAttr("hidden");
  					$('#following').show();
  					
  				}
  			});//ajax  			
  		});//follow
  		$('#following').click(function(){
  			console.log('following click');
  			$.ajax({
  				type : 'post',
  				url : "<c:url value="/Member/following"/>",
  				dataType : "text",
  				success : function(data) {
  					console.log('follow success'); 
  					$('#follow').show();
  					$('#follow').removeAttr("hidden");
  					$('#following').hide();
  					
  					
  				}
  			});//ajax
  		});//following
  		
});   	  

</script>



<!-- Page Container -->
<div class="w3-content w3-margin-top" style="max-width:1400px;">

  <!-- The Grid  -->
  <div class="w3-row-padding">
 
    <!-- Left Column-->
    <div class="w3-third">
    
      <div class="w3-white w3-text-grey w3-card-4">
        <div class="w3-display-container">
          <c:if test="${empty kakaofiledto}" var="isNotKakaologin">
          <img src='<c:url value="/upload/${filedto.f_name}"/>' style="width:100%" alt="Avatar">
          </c:if>
          <c:if test="${not isNotKakaologin }">
          <img src='${kakaofiledto.f_name}' style="width:100%" alt="KaKaoAvatar">
          </c:if>
        </div>
        <div class="w3-container">
          <p><i class="fa fa-certificate fa-fw w3-margin-right w3-large w3-text-teal"></i>${userdto.nickname}</p>
          <p><i class="fa fa-certificate fa-fw w3-margin-right w3-large w3-text-teal"></i>${userdto.vg_level}</p>
          <p><i class="fa fa-certificate fa-fw w3-margin-right w3-large w3-text-teal"></i>${userdto.selfintro}</p>
          <p><i class="fa fa-certificate fa-fw w3-margin-right w3-large w3-text-teal"></i>팔로잉 / 팔로워</p>
          <div>
          		<c:if test="${empty isfollowing}" var="isNotFollowing">	
				<button id="follow"
					class="btn btn-success btn-sm">팔로우 </button>
				<button id="following" class="btn btn-success btn-sm" hidden="">팔로잉</button>	
					
				</c:if>
				<c:if test="${not isNotFollowing }">
				<button id="following" class="btn btn-success btn-sm">팔로잉</button>	
				<button id="follow"
					class="btn btn-success btn-sm " hidden="">팔로우</button>
				</c:if>		
			
			</div>
			<div>
				<form method="get" action="<c:url value="/Member/OtherHome.do"/>">
					<input id="search" name="otherid" style="width:200px"/>
					<input id="serarchBtn" type="submit" class="btn" value="research">
				</form>
			</div>
          <hr>

          <p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>다른 유저의 식단 분석표</b></p>
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
        <a href="<c:url value="/recipe.do"/>" class="btn btn-success">레시피
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
      
      
      <div class="w3-container w3-card w3-white w3-margin-bottom">
        <h2 class="w3-text-grey w3-padding-16">채팅 공간</h2>
        <a href="<c:url value="/chatting/WebSocket.do"/>" class="btn btn-success" style="margin-bottom: 30px">채팅하러가기</a>
      </div>
 	

    <!-- End Right Column    -->
    </div>
  
  <!-- End Grid  -->
  </div>
 
  <!-- End Page Container -->
</div>
