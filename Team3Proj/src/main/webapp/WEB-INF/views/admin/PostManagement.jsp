<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- tab용 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
	$(function() {
		$('#tabMenu a:first').tab('show');//페이지 로드시 메뉴 1이 보이도록 설정
		$('#tabMenu a').click(function() {
			$(this).tab('show');//클릭한 tab이 보이게
		});
	});
</script>

<!-- 로그아웃 시작 -->
<script>
	function logout() {
		$('#logoutForm').submit();
	}
</script>
<form id="logoutForm" method="post"
	action="<c:url value="/Member/Auth/Logout.do"/>">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>
<!-- 로그아웃 끝 -->



<nav class="navbar navbar-default navbar-fixed">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navigation-example-2">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Post Management</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-left"></ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="javascript:logout()">
						<p>Log out</p>
				</a></li>
				<li class="separator hidden-lg hidden-md"></li>
			</ul>
		</div>
	</div>
</nav>



<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">

					<ul class="nav nav-tabs" id="tabMenu">
						<li><a href="#menu1">공지사항</a></li>
						<li><a href="#menu2">피드</a></li>
						<li><a href="#menu3">레시피</a></li>
					</ul>

					<!-- tab div -->
					<div class="tab-content">
						<div class="tab-pane fade" id="menu1">
							<div class="header">
								<h4>공지사항 관리</h4>
								<p class="category">
									제목을 클릭하여 해당글로 이동하세요. <br /> 글쓴이, 제목, 신고수 누르면 페이지 이동 <br /> 
									게시일, 조회수, 좋아요, 신고수 순으로 정렬가능하게 하기.
								</p>
								<a href="<c:url value="/Board/Notice/NoticeWrite.do"/>" class="btn btn-primary">등록하기</a>
							</div>
							
							<div class="content table-responsive table-full-width">
								<table class="table table-hover table-striped">
									<thead>
										<th>글쓴이</th>
										<th>제목</th>
										<th>게시일</th>
										<th>조회수</th>
										<th>좋아요 수</th>
										<th>신고수</th>
									</thead>
									<tbody>
										<c:forEach var="item" items="${list }" varStatus="loop">
											<tr>
												<td>${item.userID }</td>
												<td>${item.nickname}</td>
												<td>${item.vg_level}</td>
												<td>${item.gender}</td>
												<td>${item.age}</td>
												<td>${item.age}</td>
											</tr>
										</c:forEach>
										<tr>
											<!-- 임시 -->
											<td>임시값1</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
										</tr>
										<tr>
											<td>임시값2</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
										</tr>
										<tr>
											<td>임시값3</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
										</tr>
										<tr>
											<td>임시값4</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
										</tr>
										<tr>
											<td>임시값5</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div><!-- manu1 div -->
						
						<div class="tab-pane fade" id="menu2">
							<div class="header">
								<h4>피드 관리</h4>
								<p class="category">피드얌</p>
							</div>
							
							<div class="content table-responsive table-full-width">
								<table class="table table-hover table-striped">
									<thead>
										<th>글쓴이</th>
										<th>제목</th>
										<th>게시일</th>
										<th>조회수</th>
										<th>좋아요 수</th>
										<th>신고수</th>
									</thead>
									<tbody>
										<c:forEach var="item" items="${list }" varStatus="loop">
											<tr>
												<td>${item.userID }</td>
												<td>${item.nickname}</td>
												<td>${item.vg_level}</td>
												<td>${item.gender}</td>
												<td>${item.age}</td>
												<td>${item.age}</td>
											</tr>
										</c:forEach>
										<tr>
											<!-- 임시 -->
											<td>임시값1</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
										</tr>
										<tr>
											<td>임시값2</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
										</tr>
										<tr>
											<td>임시값3</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
										</tr>
										<tr>
											<td>임시값4</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
										</tr>
										<tr>
											<td>임시값5</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
										</tr>
									</tbody>
								</table>
							</div>
							
						</div><!-- manu2 div -->
						
						<div class="tab-pane fade" id="menu3">
							<div class="header">
								<h4>레시피 관리</h4>
								<p class="category">레시피야!</p>
							</div>
							
							<div class="content table-responsive table-full-width">
								<table class="table table-hover table-striped">
									<thead>
										<th>글쓴이</th>
										<th>제목</th>
										<th>게시일</th>
										<th>조회수</th>
										<th>좋아요 수</th>
										<th>신고수</th>
									</thead>
									<tbody>
										<tr>
											<!-- 임시 -->
											<td>임시값1</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
										</tr>
										<tr>
											<td>임시값2</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
										</tr>
										<tr>
											<td>임시값3</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
											<td>임시값</td>
										</tr>
									</tbody>
								</table>
							</div>
							
						</div><!-- manu3 div -->
						
					</div><!-- tab -->
				</div><!-- card -->
			</div>


		</div>
	</div>
</div>

