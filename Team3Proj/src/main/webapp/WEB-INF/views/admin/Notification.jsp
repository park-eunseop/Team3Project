<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- showNotification 여러가지 알람창이 있는 페이지(미완) -->

<!-- 로그아웃 시작 -->
<script>
	function logout(){
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
			<a class="navbar-brand" href="#">Notifications</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-left">
				<li><a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-dashboard"></i>
						<p class="hidden-lg hidden-md">Dashboard</p>
				</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <i class="fa fa-globe"></i> <b
						class="caret hidden-sm hidden-xs"></b> <span
						class="notification hidden-sm hidden-xs">5</span>
						<p class="hidden-lg hidden-md">
							5 Notifications <b class="caret"></b>
						</p>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">Notification 1</a></li>
						<li><a href="#">Notification 2</a></li>
						<li><a href="#">Notification 3</a></li>
						<li><a href="#">Notification 4</a></li>
						<li><a href="#">Another notification</a></li>
					</ul></li>
				<li><a href=""> <i class="fa fa-search"></i>
						<p class="hidden-lg hidden-md">Search</p>
				</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="">
						<p>Account</p>
				</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">
						<p>
							Dropdown <b class="caret"></b>
						</p>

				</a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
					</ul></li>
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
		<div class="card">
			<div class="header">
				<h4 class="title">Notifications</h4>
				<p class="category">
					Handcrafted by our friend <a target="_blank"
						href="https://github.com/mouse0270">Robert McIntosh</a>. Please
					checkout the <a href="http://bootstrap-notify.remabledesigns.com/"
						target="_blank">full documentation.</a>
				</p>

			</div>
			<div class="content">
				<div class="row">
					<div class="col-md-6">
						<h5>Notifications Style</h5>
						<div class="alert alert-info">
							<span>This is a plain notification</span>
						</div>
						<div class="alert alert-info">
							<button type="button" aria-hidden="true" class="close">×</button>
							<span>This is a notification with close button.</span>
						</div>
						<div class="alert alert-info alert-with-icon"
							data-notify="container">
							<button type="button" aria-hidden="true" class="close">×</button>
							<span data-notify="icon" class="pe-7s-bell"></span> <span
								data-notify="message">This is a notification with close
								button and icon.</span>
						</div>
						<div class="alert alert-info alert-with-icon"
							data-notify="container">
							<button type="button" aria-hidden="true" class="close">×</button>
							<span data-notify="icon" class="pe-7s-bell"></span> <span
								data-notify="message">This is a notification with close
								button and icon and have many lines. You can see that the icon
								and the close button are always vertically aligned. This is a
								beautiful notification. So you don't have to worry about the
								style.</span>
						</div>
					</div>
					<div class="col-md-6">
						<h5>Notification states</h5>
						<div class="alert alert-info">
							<button type="button" aria-hidden="true" class="close">×</button>
							<span><b> Info - </b> This is a regular notification made
								with ".alert-info"</span>
						</div>
						<div class="alert alert-success">
							<button type="button" aria-hidden="true" class="close">×</button>
							<span><b> Success - </b> This is a regular notification
								made with ".alert-success"</span>
						</div>
						<div class="alert alert-warning">
							<button type="button" aria-hidden="true" class="close">×</button>
							<span><b> Warning - </b> This is a regular notification
								made with ".alert-warning"</span>
						</div>
						<div class="alert alert-danger">
							<button type="button" aria-hidden="true" class="close">×</button>
							<span><b> Danger - </b> This is a regular notification
								made with ".alert-danger"</span>
						</div>
					</div>
				</div>
				<br> <br>
				<div class="places-buttons">
					<div class="row">
						<div class="col-md-6 col-md-offset-3 text-center">
							<h5>
								Notifications Places
								<p class="category">Click to view notifications</p>
							</h5>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2 col-md-offset-3">
							<button class="btn btn-default btn-block"
								onclick="demo.showNotification('top','left')">Top Left</button>
						</div>
						<div class="col-md-2">
							<button class="btn btn-default btn-block"
								onclick="demo.showNotification('top','center')">Top
								Center</button>
						</div>
						<div class="col-md-2">
							<button class="btn btn-default btn-block"
								onclick="demo.showNotification('top','right')">Top
								Right</button>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2 col-md-offset-3">
							<button class="btn btn-default btn-block"
								onclick="demo.showNotification('bottom','left')">Bottom
								Left</button>
						</div>
						<div class="col-md-2">
							<button class="btn btn-default btn-block"
								onclick="demo.showNotification('bottom','center')">Bottom
								Center</button>
						</div>
						<div class="col-md-2">
							<button class="btn btn-default btn-block"
								onclick="demo.showNotification('bottom','right')">Bottom
								Right</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


