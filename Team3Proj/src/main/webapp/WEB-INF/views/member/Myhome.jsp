<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/galleryList.css"/>">

<script>
	$(function() { //화면 다 뜨면 시작
		var arraydata;
		$.ajax({
			type : 'post',
			url : "<c:url value="/json"/>",
			dataType : "json",
			success : function(data) {
				console.log("%O", Object.values(data));
				arraydata = Object.values(data);
				console.log(arraydata);
				$("#search").autocomplete({
					source : arraydata,
					select : function(event, ui) {
						console.log(ui.item);
					},
					focus : function(event, ui) {
						return false;
					}
				});
			}
		});//ajax		

		
		
	});
</script>
<!-- 새로 만든 스타일 -->
<style>
#first_container {
	padding-top: 200px;
	/* 132px이 딱 맞는 크기*/
}

#basicProfile {
	text-align: center;
}

#profileImage {
	width: 150px;
	height: 150px;
	border-radius: 70%;
	overflow: hidden;
}

.nav-item {
	padding: 0 30px;
}

.nav-item a {
	color: #000;
}

.nav-item a.active {
	background-color: #F3D55A !important;
}
</style>
<!-- 새로 만든 스타일 -->


<!-- 새로 만든 틀 -->
<div class="container" id="first_container">
	<div class="row">
		<div class="col-md-12">

			<div class="row">
				<div class="col-md-4">
					<c:if test="${empty KakaoUserId}" var="isNotKakaologin">

						<img id="profileImage" alt="이미지 오류"
							src='<c:url value="/upload/${filedto.f_name}"/>'
							onerror="this.src='/veve/resources/assets/images/basic_profile.gif';" />

					</c:if>
					<c:if test="${not isNotKakaologin }">
						<img id="profileImage" alt="이미지 오류" src='${KakaoUserImg}'
							onerror="this.src='/veve/resources/assets/images/basic_profile.gif';" />

					</c:if>
					<p>
						<i
							class="fa fa-certificate fa-fw w3-margin-right w3-large w3-text-teal"></i>${userdto.nickname}</p>
					<p>
						<i
							class="fa fa-certificate fa-fw w3-margin-right w3-large w3-text-teal"></i>${userdto.vg_level}</p>
					<a id="modal-193710" href="#modal-container-193710" role="button"
						class="btn" data-toggle="modal">팔로워</a>

					<div class="modal fade" id="modal-container-193710" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="myModalLabel">팔로워</h5>
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">

									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th>NickName</th>
												<th>ID</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="following" items="${followerinfos}"
												varStatus="stauts">
												<tr>
													<c:if test="${following.k1n0 eq '1'}" var="isNotKakaologin">
														<td><img alt="#" style="width: 30px; height: 30px"
															src='${followerfileinfos[stauts.index]}' /></td>
													</c:if>
													<c:if test="${!isNotKakaologin}">
														<td><img alt="이미지 오류"
															style="width: 30px; height: 30px"
															src='<c:url value="/upload/${followerfileinfos[stauts.index]}"/>' /></td>
													</c:if>
													<td>${following.nickname}</td>
													<td>${following.userID}</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>


								</div>
								<div class="modal-footer">


									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>

					</div>

					<a id="modal-751188" href="#modal-container-751188" role="button"
						class="btn" data-toggle="modal">팔로잉</a>

					<div class="modal fade" id="modal-container-751188" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="myModalLabel">팔로잉</h5>
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">×</span>
									</button>
								</div>

								<div class="modal-body">


									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th>NickName</th>
												<th>ID</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="following" items="${followinginfos}"
												varStatus="stauts">
												<tr>
													<c:if test="${following.k1n0 eq '1'}" var="isNotKakaologin">
														<td><img alt="#" style="width: 30px; height: 30px"
															src='${followingfileinfos[stauts.index]}' /></td>
													</c:if>
													<c:if test="${!isNotKakaologin}">
														<td><img alt="이미지 오류"
															style="width: 30px; height: 30px"
															src='<c:url value="/upload/${followingfileinfos[stauts.index]}"/>' /></td>
													</c:if>
													<td>${following.nickname}</td>
													<td>${following.userID}</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>



								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>

					</div>
					<!-- 모달 -->
					<div style="padding-top: 15px">
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
					<div style="padding-top: 5px">
						<form method="get" action="<c:url value="/Member/OtherHome.do"/>">
							<input id="search" name="otherid" style="width: 200px" /> <input
								id="serarchBtn" type="submit" class="btn"
								style="font-size: 5px; padding: 5px 5px" value="검색">
						</form>
					</div>


				</div>
				<div class="col-md-4">
					<div class="col-md-12">
						<h4>나의 하루 영양 현황</h4>
						단백질
						<div class="progress">
							<div id="todayProtein" class="progress-bar progress-bar-striped"
								style="width: ${strproteinPercent}%"></div>
						</div>
						<br> 비타민B12
						<div class="progress">
							<div id="todayB12"
								class="progress-bar bg-success progress-bar-striped progress-bar-animated"
								style="width: ${strbPercent}%"></div>
						</div>
						<br> 비타민D
						<div class="progress">
							<div id="todayD"
								class="progress-bar bg-info progress-bar-striped progress-bar-animated"
								style="width: ${strdPercent}%"></div>
						</div>
						<br> 아연
						<div class="progress">
							<div id="todayAyen"
								class="progress-bar bg-warning progress-bar-striped progress-bar-animated"
								style="width: ${strzincPercent}%"></div>
						</div>
						<br> 칼슘
						<div class="progress">
							<div id="todayCal"
								class="progress-bar bg-danger progress-bar-striped progress-bar-animated"
								style="width: ${strcalPercent}%"></div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<iframe id="crawlVideo" src=" "> </iframe>
					<div class="carousel slide" id="carousel-464309">
						<ol class="carousel-indicators">
							<li data-slide-to="0" data-target="#carousel-464309"></li>
							<li data-slide-to="1" data-target="#carousel-464309"></li>
							<li data-slide-to="2" data-target="#carousel-464309"
								class="active"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item">
								<img class="d-block w-100" alt="Carousel Bootstrap First"
									src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg" />
								<div class="carousel-caption">
									<h4>First Thumbnail label</h4>
									<p>Cras justo odio, dapibus ac facilisis in, egestas eget
										quam. Donec id elit non mi porta gravida at eget metus. Nullam
										id dolor id nibh ultricies vehicula ut id elit.</p>
								</div>
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" alt="Carousel Bootstrap Second"
									src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
								<div class="carousel-caption">
									<h4>Second Thumbnail label</h4>
									<p>Cras justo odio, dapibus ac facilisis in, egestas eget
										quam. Donec id elit non mi porta gravida at eget metus. Nullam
										id dolor id nibh ultricies vehicula ut id elit.</p>
								</div>
							</div>
							<div class="carousel-item active">
								<img class="d-block w-100" alt="Carousel Bootstrap Third"
									src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
								<div class="carousel-caption">
									<h4>Third Thumbnail label</h4>
									<p>Cras justo odio, dapibus ac facilisis in, egestas eget
										quam. Donec id elit non mi porta gravida at eget metus. Nullam
										id dolor id nibh ultricies vehicula ut id elit.</p>
								</div>
							</div>
						</div>
						<a class="carousel-control-prev" href="#carousel-464309"
							data-slide="prev"><span class="carousel-control-prev-icon"></span>
							<span class="sr-only">Previous</span></a> <a
							class="carousel-control-next" href="#carousel-464309"
							data-slide="next"><span class="carousel-control-next-icon"></span>
							<span class="sr-only">Next</span></a>
					</div>
				</div>
			</div>
			<hr />
			<!-- tab -->
			<div class="tabbable" id="category_tabs">
				<ul class="nav nav-pills justify-content-center">
					<li class="nav-item"><a class="nav-link active" href="#tab1"
						data-toggle="tab">내 피드</a></li>
					<li class="nav-item"><a class="nav-link" href="#tab2"
						data-toggle="tab">내 레시피</a></li>
					<li class="nav-item"><a class="nav-link" href="#tab3"
						data-toggle="tab">스크랩</a></li>
				</ul>
				<div class="tab-content">
					<!-- tab1 내 피드 -->
					<div class="tab-pane active" id="tab1">
						<!-- sumnail  -->
						<main style="padding-top: 10px">
							<div class="container_main">
								<div class="gallery" id="appendPosition">
									<c:forEach var="item" items="${boardList}" varStatus="var">
										<div class="gallery-item" tabindex="0">
											<img
												src="<c:url value='/upload/${fileList[var.index].fileName}'/>"
												class="gallery-image" alt=""
												style="width: 300px; height: 300px">
											<div class="gallery-item-info"
												onclick="view(${item.gallary_no})"
												style="width: 300px; height: 300px">
												<ul>
													<li class="gallery-item-likes"><span
														class="visually-hidden">Likes:</span><i
														class="fas fa-heart" aria-hidden="true"></i>
														${likeList[var.index] }</li>
													<li class="gallery-item-comments"><span
														class="visually-hidden">Comments:</span><i
														class="fas fa-comment" aria-hidden="true"></i>
														${commentList[var.index] }</li>
												</ul>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<!-- End of container -->
							<a id="a_open" href="#open" hidden=""></a>
						</main>
						<!-- sumnail  -->

					</div>
					<!-- tab1 내 피드 -->

					<!-- 두번째 tab 내 레시피 -->
					<div class="tab-pane" id="tab2">
						<p>Section 2. 내 레시피 보여주기</p>
					</div>
					<!-- 두번째 tab 내 레시피 -->

					<!-- 세번째 tab 내 레시피 -->
					<div class="tab-pane" id="tab3">
						<p>Section 3. 스크랩한 것들</p>
					</div>
					<!-- 세번째 tab 내 레시피 -->


				</div>
				<!-- tab-content -->
			</div>
			<!-- tab -->




		</div>
		<!--최외각 col-md-12 -->
	</div>
	<!-- row -->
</div>
<!-- first_container -->


