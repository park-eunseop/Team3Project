<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



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
				<li><a href="#">
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
					<div class="header">
						<h4 class="title">게시글 관리</h4>
						<p class="category">제목을 클릭하여 해당글로 이동하세요.</p>
					</div>
					<div class="content table-responsive table-full-width">
						<table class="table table-hover table-striped">
							<thead>
								<th>ID</th>
								<th>NickName</th>
								<th>Vegan_LV</th>
								<th>Gender</th>
								<th>Age</th>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list }" varStatus="loop">
									<tr>
										<td>${item.userID }</td>
										<td>${item.nickname}</td>
										<td>${item.vg_level}</td>
										<td>${item.gender}</td>
										<td>${item.age}</td>
									</tr>
								</c:forEach>
								
								<tr><!-- 임시 -->
									<td>임시값1</td>
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
								</tr>
								<tr>
									<td>임시값3</td>
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
								</tr>
								<tr>
									<td>임시값5</td>
									<td>임시값</td>
									<td>임시값</td>
									<td>임시값</td>
									<td>임시값</td>
								</tr>
								
							</tbody>
						</table>

					</div>
				</div>
			</div>


		</div>
	</div>
</div>

