<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<link rel="stylesheet" href="<c:url value="/resources/assets/css/bootstrap.css"/>">


<body data-spy="scroll" data-target=".navbar-collapse" data-offset="100">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-2">
			<div class="col-md-12 heading-section text-center ftco-animate">
				<p>&nbsp;&nbsp;</p>
				<p>&nbsp;&nbsp;</p>
				<h2 class="mb-4">Articles</h2>
				<p>A small river named Duden flows by their place and supplies 
					it with the necessary regelialia. It is a paradisematic country.</p>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-10 text-right">
			<a href="<c:url value="/Gallary/GallaryWrite.do"/>"
				class="btn btn-success">작성</a>
		</div>
	</div>

	<div class="culmn">
			<section class="ftco-section">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="row">
								<c:forEach var="item" items="${boardList}" varStatus="var">
									<div class="col-md-4">
										<div class="blog-entry ftco-animate">
											<div class="mainImg">
												<c:forEach var="file" items="${fileList}">
													<c:if test="${item.gallary_no == file.gallary_no}">
														<img src="<c:url value='/upload/${file.f_name}'/>" style="width: 250px; height: 250px"/>
													</c:if>
												</c:forEach>
											</div>
											<p>&nbsp;&nbsp;</p>
											<div class="text text-2 pt-2 mt-3">
												<h3 class="mb-4">
													<a href="<c:url value='/Gallary/View.do/?gallary_no=${item.gallary_no}'/>">${item.title}</a>
												</h3>
												<p class="mb-4">${item.content}</p>
												<div class="author mb-4 d-flex align-items-center">
													<!-- <a href="#" class="img"
													style="background-image: url(images/person_2.jpg);"></a> -->
													<div class="ml-3 info">
														<span>Written by</span>
														<h3>
															<a href="#">${item.userID }</a>, <span>${item.postDate }</span>
														</h3>
													</div>
												</div>
												<div class="meta-wrap align-items-center">
													<div class="half order-md-last">
														<p class="meta">
															<span><img alt="" src="<c:url value='/resources/assets/images/heart.png'/>" style="width: 20px;height: 20px">${item.visitCount }</span> 
															<span><img alt="" src="<c:url value='/resources/assets/images/speech-bubble.png'/>" style="width: 20px;height: 20px">${commentCount}</span> 
														</p>
													</div>
													<div class="half">
														<p>
															<a href="#" class="btn py-2">Continue Reading <span
																class="ion-ios-arrow-forward"></span></a>
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
</body>
