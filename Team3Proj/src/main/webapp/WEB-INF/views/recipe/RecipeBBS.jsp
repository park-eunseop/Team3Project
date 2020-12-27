<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<style>
button {
	height: 20px;
	width: 100px;
	margin: -20px -50px;
	position: relative;
	top: 50%;
	left: 50%;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('.slider').bxSlider({
			auto : true,
			autoControls : true,
			stopAutoOnClick : true,
			pager : true
		});
	});

	$(document).ready(function() {
		$('#myCarousel').carousel();
		$('#myCarousel2').carousel();
	});
</script>
<section class="hotel_list section_padding single_page_hotel_list">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-6">
				<div class="section_tittle text-center">
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<h2>Recipe</h2>
					<a href="<c:url value="/RecipeBBS/write.do"/>"
						class="btn btn-success">등록</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-sm-6">
				<div class="container">
					<h2>캐러젤</h2>
					<div id="myCarousel" class="carousel slide" data-ride="carousel"
						data-interval="100000">
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1" class=""></li>
							<li data-target="#myCarousel" data-slide-to="2" class=""></li>
						</ol>
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img src="<c:url value="/resources/assets/images/김.jpg"/>">
							</div>
							<div class="item">
								<img
									src="<c:url value="/resources/assets/images/recipe03.jpg"/>">
							</div>
							<div class="item">
								<img
									src="<c:url value="/resources/assets/images/recipe02.jpg"/>">
							</div>
						</div>
						<a class="left carousel-control" href="#myCarousel" role="button"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							role="button" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
					<hr>
				</div>

				<p>
					<br />
				</p>
				<p>
					<br />
				</p>
				<p>
					<br />
				</p>
				<p>
					<br />
				</p>



			</div>
		</div>
		<c:if test="${empty boardList }" var="isEmpty">
				<tr>
					<td colspan="4">등록된 게시물이 없어요</td>
				</tr>
			</c:if>
		<c:forEach var="item" items="${boardList}" varStatus="var">
			<div class="col-lg-4 col-sm-6">
				<div class="single_ihotel_list" style="background-color: #fffff0;">
					<c:forEach var="file" items="${fileList}" varStatus="var">
						<c:if test="${item.res_no == file.res_no}">
							<li><img src="<c:url value='/upload/${file.f_name}'/>" /></li>
						</c:if>
					</c:forEach>

					<div class="hotel_text_iner">
						<h3>
							<a
								href="<c:url value='/RecipeBBS/view.do?res_no=${item.res_no}'/>">${item.title}</a>
						</h3>
						<div class="place_review">
							<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
								class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
							<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
								class="fas fa-star"></i></a> <span>(210 review)</span>
						</div>
						<a
							href="<c:url value='/RecipeBBS/view.do?res_no=${item.res_no}'/>">${item.content }</a>
						<p></p>
						<p>ID: ${item.userID }</p>
						<p>Date: ${item.postDate }</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</section>