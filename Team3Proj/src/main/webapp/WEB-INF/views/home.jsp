<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- home -->
<!-- 한글 깨짐 방지 -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<section id="home" class="home bg-black fix">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="main_home text-center">
				<div class="col-md-12">
					<div class="hello">
						<div class="slid_item">
							<div class="home_text ">
								<h1 class="text-yellow">Team 3</h1>
								<h3 class="text-white text-uppercase">We Create a Concept
									into The Market</h3>
							</div>
						</div>
						<!-- End off slid item -->

					</div>
				</div>

			</div>
			<a class="mouse-scroll" href="#about"> <span class="mouse">
					<span class="mouse-movement"></span>
			</span> <span class="mouse-message fadeIn">Explore</span> <br /> <!--<i class="fa fa-angle-down m-top-10 fadeIn mouse-message"></i>-->
			</a>

		</div>
		<!--End off row-->
	</div>
	<!--End off container -->
</section>
<!--End off Home Sections-->



<!--About Section-->
<section id="about" class="about bg-yellow roomy-80">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="main_about text-center">
					<h1 class="text-black">Made is design studio based on London</h1>
					<h2 class="text-white">- & -</h2>
					<h3 class="text-black text-uppercase">We love to design a
						website and the other awesome graphic</h3>

					<a href="<c:url value='/Admin/Main.do'/>" class="btn btn-primary m-top-100">관리자 게시판으로</a>
				</div>
			</div>
		</div>
	</div>
</section>



<!--Featured Section-->
<section id="features" class="features bg-white">
	<div class="container">
		<div class="row">
			<div class="main_features fix roomy-70">

				<div class="col-md-5">
					<div class="features_item">
						<div class="head_title">
							<h2 class="text-uppercase">
								Our <strong>Featured</strong>
							</h2>
						</div>
						<div class="featured_content">
							<p>Lorem ipsum dolor sit amet consectetur adipiscing elit
								donec fringilla iaculis facilisis morbi nulla lectus, luctus
								interdum eu ultricies ac tortor maecenas nec massa sit amet erat
								condimentum porttitor ac quis turpis.</p>

							<a href="" class="btn btn-default m-top-40">Read More</a>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-md-offset-1 sm-m-top-50">
					<div class="features_item2_area">
						<div class="features_item2 text-center">
							<div class="divider_horizontal"></div>
							<div class="divider_vertical"></div>
							<div class="col-xs-6">
								<div class="features_item_text">
									<img
										src="<c:url value="/resources/assets/images/featured1.jpg"/>"
										alt="" class="img-circle" />
									<p class="m-top-20">Trending Design</p>
								</div>
							</div>
							<div class="col-xs-6">
								<div class="features_item_text">
									<img
										src="<c:url value="/resources/assets/images/featured2.jpg"/>"
										alt="" class="img-circle" />
									<p class="m-top-20">Easy to Customize</p>
								</div>
							</div>
							<div class="col-xs-6">
								<div class="features_item_text m-top-50">
									<img
										src="<c:url value="/resources/assets/images/featured3.jpg"/>"
										alt="" class="img-circle" />
									<p class="m-top-20">Responsive Design</p>
								</div>
							</div>
							<div class="col-xs-6">
								<div class="features_item_text m-top-50">
									<img
										src="<c:url value="/resources/assets/images/featured4.jpg"/>"
										alt="" class="img-circle" />
									<p class="m-top-20">Free Google Font</p>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End off row -->
	</div>
	<!-- End off container -->
</section>
<!-- End off Featured Section-->


<!--Business Section-->
<section id="service" class="service bg-grey roomy-70">
	<div class="container">
		<div class="row">
			<div class="main_service">
				<div class="col-md-6">
					<div class="service_slid">
						<div class="slid_shap bg-yellow"></div>
						<div class="service_slid_item text-center">
							<div class="service_slid_text">
								<span class="icon icon icon-tools text-black"></span>
								<h5 class="text-black m-top-20">UI/UX Design</h5>
							</div>
							<div class="service_slid_text">
								<span class="icon icon icon-sports-2 text-black"></span>
								<h5 class="text-black m-top-20">UI/UX Design</h5>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-5 col-md-offset-1">
					<div class="service_item sm-m-top-50">
						<div class="head_title">
							<h2 class="text-uppercase">
								Our <strong>Service</strong>
							</h2>
						</div>
						<div class="service_content">
							<p>Lorem ipsum dolor sit amet consectetur adipiscing elit
								donec fringilla iaculis facilisis morbi nulla lectus, luctus
								interdum eu ultricies ac tortor maecenas nec massa sit amet erat
								condimentum porttitor ac quis turpis.</p>

							<a href="" class="btn btn-default m-top-40">Read More</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End off Business section -->


<!--Team And Skill Section-->
<section id="teams" class="teams roomy-80">
	<div class="container">
		<div class="row">
			<div class="main_teams_content fix">
				<div class="col-md-6">
					<div class="teams_item">
						<div class="head_title">
							<h2 class="text-uppercase">
								Our <strong>Best Team & Skill</strong>
							</h2>
						</div>
						<p>Lorem ipsum dolor sit amet consectetur adipiscing elit
							donec fringilla iaculis facilisis morbi nulla lectus, luctus
							interdum eu ultricies tortor maecenas nec massa sit amet erat
							condimentum porttitorac quis turpis nulla lectus sit amet
							consectetur.</p>


					</div>
				</div>
				<div class="col-md-6">
					<div class="teams_item text-center sm-m-top-50">
						<div class="row">
							<div class="col-sm-4">
								<img src="assets/images/team1.jpg" alt="" class="img-circle" />
								<h4 class="m-top-20">
									John <strong>Doe</strong>
								</h4>
								<h5>Lead Designer</h5>
								<div class="separator"></div>
								<ul class="list-inline">
									<li><a href=""><i class="fa fa-facebook"></i></a></li>
									<li><a href=""><i class="fa fa-twitter"></i></a></li>
									<li><a href=""><i class="fa fa-dribbble"></i></a></li>
								</ul>
							</div>
							<!-- End off col-md-4 -->
							<div class="col-sm-4">
								<img src="assets/images/team2.jpg" alt="" class="img-circle" />
								<h4 class="m-top-20">
									Sarah <strong>Smith</strong>
								</h4>
								<h5>UX Designer</h5>
								<div class="separator"></div>
								<ul class="list-inline">
									<li><a href=""><i class="fa fa-facebook"></i></a></li>
									<li><a href=""><i class="fa fa-twitter"></i></a></li>
									<li><a href=""><i class="fa fa-dribbble"></i></a></li>
								</ul>
							</div>
							<!-- End off col-md-4 -->
							<div class="col-sm-4">
								<img src="assets/images/team3.jpg" alt="" class="img-circle" />
								<h4 class="m-top-20">
									Fabian <strong>Doe</strong>
								</h4>
								<h5>Web Engineer</h5>
								<div class="separator"></div>
								<ul class="list-inline">
									<li><a href=""><i class="fa fa-facebook"></i></a></li>
									<li><a href=""><i class="fa fa-twitter"></i></a></li>
									<li><a href=""><i class="fa fa-dribbble"></i></a></li>
								</ul>
							</div>
							<!-- End off col-md-4 -->
						</div>
					</div>
				</div>
				<!-- End off col-md-6 -->
			</div>
			<!-- End off main Team -->

			<div class="col-md-12">
				<div class="skill">
					<div class="team_content_details_skills m-top-50">
						<div class="row">
							<div class="col-sm-6">
								<div class="teamskillbar clearfix m-top-50 text-uppercase"
									data-percent="80%">
									<label>Photoshop</label>
									<div class="teamskillbar-bar" style="width: 80%;"></div>
								</div>
								<!-- End Skill Bar -->

								<div class="teamskillbar clearfix m-top-50 text-uppercase"
									data-percent="75%">
									<label>Web Design</label>
									<div class="teamskillbar-bar" style="width: 75%;"></div>
								</div>
								<!-- End Skill Bar -->
							</div>

							<div class="col-sm-6">
								<div class="teamskillbar clearfix m-top-50 text-uppercase"
									data-percent="90%">
									<label>DEvelopment</label>
									<div class="teamskillbar-bar" style="width: 90%;"></div>
								</div>
								<!-- End Skill Bar -->

								<div class="teamskillbar clearfix m-top-50 text-uppercase"
									data-percent="98%">
									<label>Branding</label>
									<div class="teamskillbar-bar" style="width: 98%;"></div>
								</div>
								<!-- End Skill Bar -->
							</div>

						</div>
					</div>
				</div>
				<!-- End off skill -->
			</div>
			<!-- End col-md-12 -->
		</div>
		<!-- End off row -->
	</div>
	<!-- End off container -->
</section>
<!-- End off Team & Skill section -->


<!--Choose section-->
<section id="choose" class="choose bg-grey roomy-80">
	<div class="container">
		<div class="row">
			<div class="main_choose">
				<div class="col-md-6">
					<div class="choose_mac">
						<div class="choose_slide">
							<div class="choose_item">
								<img src="assets/images/choose-img1.png" alt="" />
							</div>
							<div class="choose_item">
								<img src="assets/images/choose-img1.png" alt="" />
							</div>
							<div class="choose_item">
								<img src="assets/images/choose-img1.png" alt="" />
							</div>
						</div>
					</div>
				</div>
				<!-- End off col-md-6 -->

				<div class="col-md-5 col-md-offset-1">
					<div class="choose_content sm-m-top-40">
						<div class="head_title">
							<h2 class="text-uppercase">
								Why <strong>Choose Us</strong>
							</h2>
						</div>
						<div class="choose_item_text fix">
							<h6>
								<i class="fa fa-check-square-o"></i> Easy to costumize.
							</h6>
							<p>Atque ducimus velit, earum quidem, iusto dolorem.</p>
						</div>
						<div class="choose_item_text fix m-top-20">
							<h6>
								<i class="fa fa-check-square-o"></i> Full of features.
							</h6>
							<p>Atque ducimus velit, earum quidem, iusto dolorem.</p>
						</div>
						<div class="choose_item_text fix m-top-20">
							<h6>
								<i class="fa fa-check-square-o"></i> 24/7 Support.
							</h6>
							<p>Atque ducimus velit, earum quidem, iusto dolorem.</p>
						</div>
						<div class="choose_item_text fix m-top-20">
							<h6>
								<i class="fa fa-check-square-o"></i> All in psd files.
							</h6>
							<p>Atque ducimus velit, earum quidem, iusto dolorem.</p>
						</div>
					</div>
				</div>
				<!-- End off col-md-6 -->
			</div>
		</div>
		<!-- End off row -->
	</div>
	<!-- End off container -->
</section>
<!-- End off choose section -->


<!--Portfolio Section-->



<section id="portfolio" class="portfolio margin-top-120">

	<!-- Portfolio container-->
	<div class="container">
		<div class="row">
			<div class="main-portfolio roomy-80">

				<div class="col-md-4">
					<div class="head_title text-left sm-text-center wow fadeInDown">
						<h2>Our Works</h2>
					</div>
				</div>

				<div class="col-md-8">
					<div class="filters-button-group text-right sm-text-center">
						<button class="btn button is-checked" data-filter="*">all</button>
						<button class="btn button" data-filter=".metal">Web
							Design</button>
						<button class="btn button" data-filter=".transition">Logo
							Design</button>
						<button class="btn button" data-filter=".alkali">Branding</button>
						<button class="btn button" data-filter=".ar">Branding</button>
					</div>
				</div>



				<div style="clear: both;"></div>

				<div class="grid text-center">

					<div class="grid-item transition metal ium">
						<img alt="" src="assets/images/porfolio-1.jpg">
						<div class="grid_hover_area text-center">
							<div class="girid_hover_text m-top-110">
								<h4 class="text-white">Your Work Title</h4>
								<p class="text-white">- Business Card, Branding</p>
								<a href="assets/images/porfolio-1.jpg"
									class="btn btn-primary popup-img">View Project</a>
							</div>
						</div>
						<!-- End off grid Hover area -->
					</div>
					<!-- End off grid item -->

					<div class="grid-item metalloid ">
						<img alt="" src="assets/images/porfolio-2.jpg">
						<div class="grid_hover_area text-center">
							<div class="girid_hover_text m-top-180">
								<h4 class="text-white">Your Work Title</h4>
								<p class="text-white">- Business Card, Branding</p>
								<a href="assets/images/porfolio-2.jpg"
									class="btn btn-primary popup-img">View Project</a>
							</div>
						</div>
						<!-- End off grid Hover area -->
					</div>
					<!-- End off grid item -->

					<div class="grid-item post-transition metal numberGreaterThan50">
						<img alt="" src="assets/images/porfolio-3.jpg">
						<div class="grid_hover_area text-center">
							<div class="girid_hover_text m-top-50">
								<h4 class="text-white">Your Work Title</h4>
								<p class="text-white">- Business Card, Branding</p>
								<a href="assets/images/porfolio-3.jpg"
									class="btn btn-primary popup-img">View Project</a>
							</div>
						</div>
						<!-- End off grid Hover area -->
					</div>
					<!-- End off grid item -->

					<div class="grid-item post-transition metal ium">
						<img alt="" src="assets/images/porfolio-4.jpg">
						<div class="grid_hover_area text-center">
							<div class="girid_hover_text m-top-180">
								<h4 class="text-white">Your Work Title</h4>
								<p class="text-white">- Business Card, Branding</p>
								<a href="assets/images/porfolio-4.jpg"
									class="btn btn-primary popup-img">View Project</a>
							</div>
						</div>
						<!-- End off grid Hover area -->
					</div>
					<!-- End off grid item -->

					<div class="grid-item metal ar">
						<img alt="" src="assets/images/porfolio-5.jpg">
						<div class="grid_hover_area text-center">
							<div class="girid_hover_text m-top-110">
								<h4 class="text-white">Your Work Title</h4>
								<p class="text-white">- Business Card, Branding</p>
								<a href="assets/images/porfolio-5.jpg"
									class="btn btn-primary popup-img">View Project</a>
							</div>
						</div>
						<!-- End off grid Hover area -->
					</div>
					<!-- End off grid item -->

					<div class="grid-item alkali ar">
						<img alt="" src="assets/images/porfolio-6.jpg">
						<div class="grid_hover_area text-center">
							<div class="girid_hover_text m-top-50">
								<h4 class="text-white">Your Work Title</h4>
								<p class="text-white">- Business Card, Branding</p>
								<a href="assets/images/porfolio-6.jpg"
									class="btn btn-primary popup-img">View Project</a>
							</div>
						</div>
						<!-- End off grid Hover area -->
					</div>
					<!-- End off grid item -->

				</div>



				<div style="clear: both;"></div>


			</div>
		</div>
	</div>
	<!-- Portfolio container end -->
</section>
<!-- End off portfolio section -->



<!--Test section-->
<section id="test" class="test bg-grey roomy-60 fix">
	<div class="container">
		<div class="row">
			<div class="main_test fix">
				<div class="col-md-6">
					<div class="cbrand text-center">
						<div class="divider_horizontal"></div>
						<div class="divider_vertical"></div>
						<div class="col-xs-6">
							<div class="cbrand_item">
								<img src="assets/images/cbrand-1.png" alt="" />
							</div>
						</div>
						<div class="col-xs-6">
							<div class="cbrand_item">
								<img src="assets/images/cbrand-2.png" alt="" />
							</div>
						</div>
						<div class="col-xs-6">
							<div class="cbrand_item m-top-40">
								<img src="assets/images/cbrand-3.png" alt="" />
							</div>
						</div>
						<div class="col-xs-6">
							<div class="cbrand_item m-top-40">
								<img src="assets/images/cbrand-4.png" alt="" />
							</div>
						</div>

					</div>
				</div>

				<div class="col-md-6 sm-m-top-40">
					<div class="test_item1 fix ">
						<div class="head_title fix">
							<h2 class="text-uppercase">
								What <strong>Client Say</strong>
							</h2>
						</div>
						<div class="item_img">
							<img class="img-circle" src="assets/images/test-img1.jpg" alt="" />
							<i class="fa fa-quote-left"></i>
						</div>

						<div class="item_text">
							<h5>Sarah Smith</h5>
							<h6>envato.com</h6>

							<p>Natus voluptatum enim quod necessitatibus quis expedita
								harum provident eos obcaecati id culpa corporis molestias.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End off test section -->