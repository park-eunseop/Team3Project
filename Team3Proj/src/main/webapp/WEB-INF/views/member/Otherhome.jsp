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
					<c:if test="${empty kakaofiledto}" var="isNotKakaologin">

						<img id="profileImage" alt="이미지 오류"
							src='<c:url value="/upload/${filedto.f_name}"/>'
							onerror="this.src='/veve/resources/assets/images/basic_profile.gif';" />

					</c:if>
					<c:if test="${not isNotKakaologin }">
						<img id="profileImage" alt="이미지 오류" src='${kakaofiledto.f_name}'
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
									<h5 class="modal-title" id="myModalLabel">Modal title</h5>
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">...</div>
								<div class="modal-footer">

									<button type="button" class="btn btn-primary">Save
										changes</button>
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
									<h5 class="modal-title" id="myModalLabel">Modal title</h5>
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">...</div>
								<div class="modal-footer">

									<button type="button" class="btn btn-primary">Save
										changes</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>

					</div>
					<!-- 모달 -->
					<div>
						<c:if test="${empty isfollowing}" var="isNotFollowing">
							<button id="follow" class="btn btn-success btn-sm">팔로우</button>
							<button id="following" class="btn btn-success btn-sm" hidden="">팔로잉</button>

						</c:if>
						<c:if test="${not isNotFollowing }">
							<button id="following" class="btn btn-success btn-sm">팔로잉</button>
							<button id="follow" class="btn btn-success btn-sm " hidden="">팔로우</button>
						</c:if>

					</div>


					<div>
						<form method="get" action="<c:url value="/Member/OtherHome.do"/>">
							<input id="search" name="otherid" style="width: 200px" /> <input
								id="serarchBtn" type="submit" class="btn" value="research">
						</form>
					</div>


				</div>
				<div class="col-md-4">
					<h2>Heading</h2>
					<p>Donec id elit non mi porta gravida at eget metus. Fusce
						dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
						ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
						magna mollis euismod. Donec sed odio dui.</p>
					<p>
						<a class="btn" href="#">View details »</a>
					</p>
				</div>
				<div class="col-md-4">
					<div id="card-560222">
						<div class="card">
							<div class="card-header">
								<a class="card-link" data-toggle="collapse"
									data-parent="#card-560222" href="#card-element-992035">Collapsible
									Group Item #1</a>
							</div>
							<div id="card-element-992035" class="collapse show">
								<div class="card-body">Anim pariatur cliche...</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								<a class="card-link" data-toggle="collapse"
									data-parent="#card-560222" href="#card-element-656013">Collapsible
									Group Item #2</a>
							</div>
							<div id="card-element-656013" class="collapse show">
								<div class="card-body">Anim pariatur cliche...</div>
							</div>
						</div>
					</div>
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
						<p>내 피드가 들어갈 곳</p>
						<!-- sumnail  -->
						<div class="row">
							<div class="col-md-4">
								<div class="card">
									<img class="card-img-top" alt="Bootstrap Thumbnail First"
										src="https://www.layoutit.com/img/people-q-c-600-200-1.jpg" />
									<div class="card-block">
										<h5 class="card-title">Card title</h5>
										<p class="card-text">
											Cras justo odio, dapibus ac facilisis i<span>n,
												egestas eget quam. Donec id elit non mi porta gravida at
												eget metus. Nullam id dolor id nibh ultricies vehicula ut id
												elit.</span>
										</p>
										<p>
											<a class="btn btn-primary" href="#">Action</a> <a class="btn"
												href="#">Action</a>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="card">
									<img class="card-img-top" alt="Bootstrap Thumbnail Second"
										src="https://www.layoutit.com/img/city-q-c-600-200-1.jpg" />
									<div class="card-block">
										<h5 class="card-title">Card title</h5>
										<p class="card-text">Cras justo odio, dapibus ac facilisis
											in, egestas eget quam. Donec id elit non mi porta gravida at
											eget metus. Nullam id dolor id nibh ultricies vehicula ut id
											elit.</p>
										<p>
											<a class="btn btn-primary" href="#">Action</a> <a class="btn"
												href="#">Action</a>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="card">
									<img class="card-img-top" alt="Bootstrap Thumbnail Third"
										src="https://www.layoutit.com/img/sports-q-c-600-200-1.jpg" />
									<div class="card-block">
										<h5 class="card-title">Card title</h5>
										<p class="card-text">Cras justo odio, dapibus ac facilisis
											in, egestas eget quam. Donec id elit non mi porta gravida at
											eget metus. Nullam id dolor id nibh ultricies vehicula ut id
											elit.</p>
										<p>
											<a class="btn btn-primary" href="#">Action</a> <a class="btn"
												href="#">Action</a>
										</p>
									</div>
								</div>
							</div>
						</div>
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

