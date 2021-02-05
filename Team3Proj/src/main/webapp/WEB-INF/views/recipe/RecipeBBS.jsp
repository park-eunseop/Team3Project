<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>




<!-- 네비게이션바 거리유지 -->
<section class="pad">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">dfadfadf</div>
		</div>
	</div>
</section>
<!--네비게이션바 거리유지 끝-->


<!-- 오늘의 채식 레시피 BEST -->
<section class="today_recipe bg-grey">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h2>오늘의 레시피 BEST</h2>
			</div>

			<!-- 오울캐러셀2 -->
			<div class="col-sm-12 text-center">
				<div class="owl-board">
					<div id="owl2" class="owl-carousel owl-theme">
						<div class="item">
							<img src="<c:url value="/resources/assets/images/레시피1.jpg"/>"
								alt="오늘의베스트">
						</div>
						<div class="item">
							<img src="<c:url value="/resources/assets/images/레시피1.jpg"/>"
								alt="오늘의베스트">
						</div>
						<div class="item">
							<img src="<c:url value="/resources/assets/images/레시피1.jpg"/>"
								alt="오늘의베스트">
						</div>
						<div class="item">
							<img src="<c:url value="/resources/assets/images/레시피1.jpg"/>"
								alt="오늘의베스트">
						</div>
						<div class="item">
							<img src="<c:url value="/resources/assets/images/레시피1.jpg"/>"
								alt="오늘의베스트">
						</div>
						<div class="item">
							<img src="<c:url value="/resources/assets/images/레시피1.jpg"/>"
								alt="오늘의베스트">
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>
<!-- 오늘의 채식 레시피 BEST 끝-->



<!-- 필터바 -->
<section class="nav-filter bg-grey sticky-top">
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<div class="write text-center">
					<a href="<c:url value="/RecipeBBS/write.do"/>" class="btn btn-sign">레시피
						작성하기</a>
				</div>
			</div>


			<!--아이콘-->
			<div class="col-sm-8">
				<div class="filters">
					<div id="filter7" class="text-center">
						<img
							src="<c:url value="/resources/assets/images/filter_off7.png"/>"
							alt="비건"><br />
					</div>
					<div id="filter6" class="text-center">
						<img
							src="<c:url value="/resources/assets/images/filter_off6.png"/>"
							alt="비건"><br />
					</div>
					<div id="filter5" class="text-center">
						<img
							src="<c:url value="/resources/assets/images/filter_off5.png"/>"
							alt="비건"><br />
					</div>
					<div id="filter4" class="text-center">
						<img
							src="<c:url value="/resources/assets/images/filter_off4.png"/>"
							alt="비건"><br />
					</div>
					<div id="filter3" class="text-center">
						<img
							src="<c:url value="/resources/assets/images/filter_off3.png"/>"
							alt="비건"><br />
					</div>
					<div id="filter2 class="text-center">
						<img
							src="<c:url value="/resources/assets/images/filter_off2.png"/>"
							alt="비건"><br />
					</div>
					<div id="filter1" class="text-center">
						<img
							src="<c:url value="/resources/assets/images/filter_off1.png"/>"
							alt="비건"><br />
					</div>
					<div id="filter0" class="text-center">
						<img
							src="<c:url value="/resources/assets/images/filter_off0.png"/>"
							alt="전체"><br />
					</div>

				</div>
			</div>

		</div>
	</div>
</section>
<!-- 필터바 끝-->

<!-- 필터바 거리유지 -->
<section class="pad-filter bg-grey">
	<div class="container"></div>
</section>
<!--필터바 거리유지 끝-->


<!-- 레시피게시글 -->
<section class="recipe_list bg-white roomy-60">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h2>채식 레시피</h2>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-9">
				<button type="button" class="btn btn-recipe">전체</button>
				<button type="button" class="btn btn-recipe">식사 레시피</button>
				<button type="button" class="btn btn-recipe">간식 레시피</button>
				<button type="button" class="btn btn-recipe">홈카페 레시피</button>
			</div>
			<div class="col-sm-3">
				<div class="input-group input-group-sm">
					<input type="text" class="form-control" placeholder="Search">
					<div class="input-group-append">
						<button class="btn btn-dark" type="submit">검색</button>
					</div>
				</div>
			</div>
		</div>




		<div class="row">
			<div>
				<p>전체 12,325개</p>
			</div>

			<!--정렬기준(드롭다운)-->
			<div class="dropdown array">
				<button type="button" class="btn btn-primary dropdown-toggle"
					data-toggle="dropdown">정렬방식</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">추천순</a> <a class="dropdown-item"
						href="#">최신순</a> <a class="dropdown-item" href="#">조회순</a> <a
						class="dropdown-item" href="#">좋아요순</a> <a class="dropdown-item"
						href="#">댓글순</a>
				</div>
			</div>
		</div>


		<!--리스트 원래 자리-->
	</div>
</section>
<!-- 레시피게시글-->


<!--리스트-->
<section>
	<div class="container">
		<div class="row">

			<c:if test="${empty boardList }" var="isEmpty">
				<tr>
					<td colspan="4">등록된 게시물이 없어요</td>
				</tr>
			</c:if>

			<c:forEach var="item" items="${boardList}" varStatus="var">
				<div class="col-sm-3">
					<div class="list" style="background-color: #fffff0;">
						<c:forEach var="file" items="${fileList}" varStatus="var">
							<c:if test="${item.rec_no == file.rec_no}">
								<img src="<c:url value='/upload/${file.f_name}'/>" style="height: 255px; width: 100%;" />
							</c:if>
						</c:forEach>

						<div class="summary">
							<h2>
								<a href="<c:url value='/RecipeBBS/view.do?rec_no=${item.rec_no}'/>">${item.title}</a>
							</h2>

							<a href="<c:url value='/RecipeBBS/view.do?rec_no=${item.rec_no}'/>">${item.content }</a>
							<p></p>
							<p>${item.userID }</p>
							<p>${item.postDate }</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
<!--리스트 끝-->
