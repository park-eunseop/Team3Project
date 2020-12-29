<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- footer -->
<section class="footer bg-black roomy-40">


	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="item_icon">
					<i class="fa fa-location-arrow"></i>
				</div>
				<h6 class="text-white">Location</h6>
				<p>123 suscipit ipsum nam auctor mauris dui, ac sollicitudin
					mauris, Bandung</p>

				<div class="widget_ab_item m-top-30">
					<div class="item_icon">
						<i class="fa fa-phone"></i>
					</div>
					<div class="widget_ab_item_text">
						<h6 class="text-white">Phone :</h6>
						<p>+1 2345 6789</p>
					</div>
				</div>

				<div class="widget_ab_item m-top-30">
					<div class="item_icon">
						<i class="fa fa-envelope-o"></i>
					</div>
					<div class="widget_ab_item_text">
						<h6 class="text-white">Email Address :</h6>
						<p>youremail@mail.com</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="widget_item widget_service sm-m-top-50">
					<h5 class="text-white">Latest News</h5>
					<ul class="m-top-20">
						<li class="m-top-20"><a href="#"><i
								class="fa fa-angle-right"></i> Web Design</a></li>
						<li class="m-top-20"><a href="#"><i
								class="fa fa-angle-right"></i> User Interface Design</a></li>
						<li class="m-top-20"><a href="#"><i
								class="fa fa-angle-right"></i> Web Hosting</a></li>
						<li class="m-top-20"><a href="#"><i
								class="fa fa-angle-right"></i> Themes</a></li>
						<li class="m-top-20"><a href="#"><i
								class="fa fa-angle-right"></i> Support Forums</a></li>
					</ul>
				</div>
			</div>

			<div class="col-md-4">
				<div class="widget_item widget_newsletter sm-m-top-50">
					<h5 class="text-white">Newsletter</h5>
					<form class="form-inline m-top-30">
						<div class="form-group">
							<input type="email" class="form-control"
								placeholder="Enter you Email">
							<button type="submit" class="btn text-center">
								<i class="fa fa-arrow-right"></i>
							</button>
						</div>
					</form>

					<div class="widget_brand">
						<a href="" class="text-uppercase">Your Logo</a>
						<p>Lorem ipsum dolor sit amet consec tetur adipiscing elit
							nulla aliquet pretium nisi in</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="main_footer fix bg-mega text-center p-bottom-30">
		<div class="col-md-12">
			<p class="wow fadeInRight" data-wow-duration="1s">
				<a target="_blank" href="#">3조</a> 2020. All Rights Reserved
			</p>
		</div>
	</div>
</section>


  <!-- 부트스트랩 4.5.2 플러그인들 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   
 
  


<!-- owl 캐러셀 -->
<script src="<c:url value="/resources/assets/js/owl.carousel.min.js"/>"></script>

<!-- js -->
<script src="<c:url value="/resources/assets/js/nav.js"/>"></script>
<!--메인화면 요일 표기-->
<script src="<c:url value="/resources/assets/js/day.js"/>"></script>
<!--메인화면 요일 표기-->
<script src="<c:url value="/resources/assets/js/rolling.js"/>"></script>
<!--메인화면 채식메뉴 롤링-->
<script src="<c:url value="/resources/assets/js/carousel.js"/>"></script>
<!-- 캐러셀 -->
<script>
		window.onresize = function() {
			$('#display_width').html(window.innerWidth);
		};
</script>