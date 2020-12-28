<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- home -->
<!-- 한글 깨짐 방지 -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- Preloader -->
<div id="loading">
	<div id="loading-center">
		<div id="loading-center-absolute">
			<div class="object" id="object_one"></div>
			<div class="object" id="object_two"></div>
			<div class="object" id="object_three"></div>
			<div class="object" id="object_four"></div>
		</div>
	</div>
</div>
<!--End off Preloader -->
<div class="culmn">

	<!--Home Sections-->

	<section id="home" class="home bg-black fix">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="main_home text-center">
					<div class="col-md-12">
						<div class="hello">
							<div class="slid_item">
								<div class="home_text">
									<h2>
										<span id="day" class="text-white">날짜별 정보 입력</span>
									</h2>
									<h1 class="text-yellow">캬라멜 아몬드라떼</h1>

									<h2 class="text-white">메뉴로 건강한 채식을 도전해볼까?</h2>
								</div>
							</div>
							<!-- End off slid item -->

						</div>
					</div>

				</div>

				<a class="mouse-scroll" href="#about"> <span class="mouse">
						<span class="mouse-movement"></span>
				</span> <span class="mouse-message fadeIn">시작하기</span> <br /> <!--<i class="fa fa-angle-down m-top-10 fadeIn mouse-message"></i>-->
				</a>

			</div>
			<!--End off row-->
		</div>
		<!--End off container -->
	</section>
	<!--End off Home Sections-->



	<!--About Section-->
	<section id="about" class="about bg-yellow roomy-70">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="main_about text-center">
						<h2 class="text-black">정말정말&nbsp;건강한&nbsp;&nbsp;채식&nbsp;라이프엔?</h2>
						<h1 class="text-black">VERY VEGGI.</h1>
						<h2 class="text-white">-</h2>
						<h3 class="text-black text-uppercase">
							여러분의 채식 스타일은 무엇인가요? 락토? 아니면.. 비건?<br /> VERY VEGGI.는 더 건강하고 편리한
							채식 라이프를 위해, 이용자 채식 스타일별 맞춤 컨텐츠를 제공합니다.<br /> 다른 사람들과 다양한 채식 노하우를
							VERY VEGGI.에서 공유해보세요!
						</h3>


						<a href="<c:url value="/Member/SignUp.do"/>" class="btn btn-primary m-top-40">회원가입하러 가기</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--베지식단 코칭 설명-->
	<section id="features" class="features bg-white">
		<div class="container">
			<div class="row">
				<div class="main_features fix roomy-120">

					<div class="col-md-offset-1 col-md-4">
						<div class="features_item">
							<div class="head_title">
								<h2 class="text-uppercase">
									<strong>베지식단</strong> 코칭
								</h2>
							</div>
							<div class="featured_content">
								<p>
									나의 채식 라이프, 영양균형이 잘 맞는지 궁금하다면?<br /> 매 끼니 식사 전 사진 촬영 한번으로 올바른
									채식생활을 위한 코칭 서비스를 이용해보세요!<br /> VERI VEGGI.만의 알고리즘을 통해, 기간 별
									영양밸런스 분석으로 추가 섭취해야 할 채식 메뉴를 피드백 받을 수 있습니다.
								</p>
								<a href="<c:url value="/Member/Auth/Login.do"/>" class="btn btn-default m-top-40">오늘의 채식 식단
									코칭받으러가기!</a>
							</div>
						</div>
					</div>

					<!--캐러셀 (속도 조절은 main.js)-->
					<div class="col-md-offset-1 col-md-5">
						<div class="choose_mac">
							<div class="choose_slide">
								<div class="choose_item">
									<img src="<c:url value="/resources/assets/images/코칭4.jpg"/>" alt="" />
								</div>
								<div class="choose_item">
									<img src="<c:url value="/resources/assets/images/코칭3.jpg"/>" alt="" />
								</div>
								<div class="choose_item">
									<img src="<c:url value="/resources/assets/images/코칭2.jpg"/>" alt="" />
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!--베지식단 코칭 설명 끝-->

	<!--베지맛집 찾기 설명-->
	<section id="features" class="features bg-grey">
		<div class="container">
			<div class="row">
				<div class="main_features fix roomy-120">

					<!--캐러셀 (속도 조절은 main.js)-->
					<div class="col-md-offset-1 col-md-5">
						<div class="choose_mac">
							<div class="choose_slide">
								<div class="choose_item">
									<img src="<c:url value="/resources/assets/images/맛집1.jpg"/>" alt="" />
								</div>
								<div class="choose_item">
									<img src="<c:url value="/resources/assets/images/맛집2.jpg"/>" alt="" />
								</div>
								<div class="choose_item">
									<img src="<c:url value="/resources/assets/images/맛집3.jpg"/>" alt="" />
								</div>
							</div>
						</div>
					</div>


					<div class="col-md-offset-1 col-md-4">
						<div class="features_item">
							<div class="head_title">
								<h2 class="text-uppercase">
									<strong>베지맛집</strong> 찾기
								</h2>
							</div>
							<div class="featured_content">
								<p>
									논-비건 친구들과 함께 외식을 즐기고싶다면?<br /> 더 스마트한 채식라이프를 위해, 내주변 식당을 지도로
									쉽게 검색하는 서비스를 제공합니다.&nbsp;&nbsp; 채식단계 필터 기능과 다른 이용자들의 후기를 확인하여,
									검증된 채식맛집을 찾아보세요!
								</p>
								<a href="<c:url value="/Member/Auth/Login.do"/>" class="btn btn-default m-top-40">인생 채식 맛집 찾으러가기!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End off row -->
		</div>
		<!-- End off container -->
	</section>
	<!--베지맛집 찾기 설명 끝-->




	<!--채식레시피 검색 설명-->
	<section id="features" class="features bg-white">
		<div class="container">
			<div class="row">
				<div class="main_features fix roomy-120">

					<div class="col-md-offset-1 col-md-10">
						<div class="features_item">
							<div class="head_title" style="padding-bottom: 9px;">
								<h2 class="text-uppercase">
									<strong>채식레시피</strong> 검색
								</h2>
							</div>
							<div class="featured_content">
								<p>
									이번 주 주말엔 담백한 두부스테이크 어떤가요?<br /> 마이 홈에 미리 지정해둔 나의 채식 단계에 따라,
									원하는 테마의 채식 레시피를 쉽게 검색할 수 있습니다.<br /> 다른 이용자들과의 레시피 공유를 통해, 영감을
									받고 맛있는 쿠킹라이프를 즐기세요.&nbsp;&nbsp;이제 레시피 검색은 예전처럼 책이나 유튜브에 의지할 필요가
									없어요 :)

								</p>
							</div>
						</div>
					</div>

					<!-- 동그라미 메뉴 -->
					<div class="col-md-offset-1 col-md-10">
						<div class="teams_item text-center sm-m-top-60">
							<div class="row">
								<div class="col-sm-4">
									<img src="<c:url value="/resources/assets/images/레시피1.jpg"/>" alt="" class="img-circle" />
									<h4 class="m-top-20">
										<strong>식사 레시피</strong>
									</h4>
									<div class="separator"></div>
									<h5>
										채식 한끼 먹더라도 식사는 든든하게!<br /> 내 채식 스타일에 맞추어<br /> 다양한 레시피를
										찾아보세요.
									</h5>
								</div>
								<!-- End off col-md-4 -->
								<div class="col-sm-4">
									<img src="<c:url value="/resources/assets/images/레시피2.JPG"/>" alt="" class="img-circle" />
									<h4 class="m-top-20">
										<strong>간식 레시피</strong>
									</h4>
									<div class="separator"></div>
									<h5>
										출출함을 달래줄 맛있는 간식,<br />과자부터 케이크까지<br />건강한 군것질 메뉴를 준비했습니다.
									</h5>
								</div>
								<!-- End off col-md-4 -->
								<div class="col-sm-4">
									<img src="<c:url value="/resources/assets/images/레시피3.jpg"/>" alt="" class="img-circle" />
									<h4 class="m-top-20">
										<strong>홈카페 레시피</strong>
									</h4>
									<div class="separator"></div>
									<h5>
										채식 카페음료 레시피<br />기존의 동물성 식재료 없이도,<br />감성적인 홈카페를 즐길 수 있어요.
									</h5>
								</div>
								<!-- End off col-md-4 -->
							</div>
						</div>
					</div>
					<!-- 동그라미 메뉴 끝 -->

					<div class="col-md-offset-1 col-md-10 text-center">
						<div class="features_item">
							<div class="featured_content">
								<a href="<c:url value="/Member/Auth/Login.do"/>" class="btn btn-default m-top-40">맛있는 두부스테이크
									만들러가기!</a>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- End off row -->
		</div>
		<!-- End off container -->
	</section>
	<!--채식레시피 검색 설명 끝-->



	<!--커뮤니티 설명-->
	<section id="features" class="features bg-grey">
		<div class="container">
			<div class="row">
				<div class="main_features fix roomy-120">

					<div class="col-md-offset-1 col-md-10">
						<div class="features_item">
							<div class="head_title" style="padding-bottom: 9px;">
								<h2 class="text-uppercase">
									다른 사람들과 <strong>채식정보 공유하기</strong>
								</h2>
							</div>
							<div class="featured_content">
								<p>
									오늘의 채식 식단과 라이프스타일을 다른사람들과 함께 공유해보세요!<br /> 나와 같은 채식스타일을 가진
									사람들의 게시글을 필터링하여, 내게 꼭 필요한 정보만 볼 수 있습니다.<br />
								</p>
							</div>
						</div>
					</div>

					<!--피드캐러셀 (속도 조절은 main.js)-->
					<div class="col-md-offset-1 col-md-10">
						<div class="commu_mac m-top-30">
							<div class="commu_slide">
								<div class="commu_item">
									<img src="assets/images/" alt="" />
								</div>
								<div class="commu_item">
									<img src="assets/images/" alt="" />
								</div>
								<div class="commu_item">
									<img src="assets/images/" alt="" />
								</div>
							</div>
						</div>
					</div>
					<!--피드 캐러셀-->

					<div class="col-md-offset-1 col-md-10 text-center">
						<div class="features_item">
							<div class="featured_content">
								<a href="<c:url value="/Member/Auth/Login.do"/>" class="btn btn-default m-top-40">채식 꿀팁 소통하기!</a>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- End off row -->
		</div>
		<!-- End off container -->
	</section>
	<!--커뮤니티 설명 끝-->
</div>
