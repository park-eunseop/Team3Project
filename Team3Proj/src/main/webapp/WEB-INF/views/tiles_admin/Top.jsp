<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- admin_top -->

	
<div class="sidebar" data-color="orange" data-image="/veve/resources/assets_admin/img/vegun_admin_main.jpg">
<!--색 바꾸려면 data-color로 검색해서 css에서 노랑색 추가해서 쓰기   -->
<div class="sidebar-wrapper">
	<div class="logo">
		<a href="<c:url value='/Admin/Main.do'/>" class="simple-text">
			VEVE ADMIN </a>
	</div>

	<ul class="nav">
		<li class="active"><a
			href="<c:url value='/Admin/Main.do'/>"> <i
				class="pe-7s-graph"></i>
				<p>Dashboard</p>
		</a></li>
		<li><a href="#"> <i class="pe-7s-user"></i>
				<p>User Profile</p>
		</a></li>
		<li><a href="<c:url value='/Admin/TableList.do'/>"> <i
				class="pe-7s-note2"></i>
				<p>Table List</p>
		</a></li>
		<li><a href="#"> <i class="pe-7s-news-paper"></i>
				<p>Typography</p>
		</a></li>
		<li><a href="<c:url value='/'/>"> <i class="pe-7s-science"></i>
				<p>HOME</p>
		</a></li>
		<li><a href="#"> <i class="pe-7s-map-marker"></i>
				<p>Maps</p>
		</a></li>
		<li><a href="<c:url value='/Admin/Notification.do'/>"> <i
				class="pe-7s-bell"></i>
				<p>Notifications</p>
		</a></li>
		<li class="active-pro"><a href="#"> <i class="pe-7s-rocket"></i>
				<p>Upgrade to PRO</p>
		</a></li>
	</ul>
</div>
</div>