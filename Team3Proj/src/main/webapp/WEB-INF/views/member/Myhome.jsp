<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<section>

	<div class="container">	 
		<div class="jumbotron" style="color: black; background-color: #5FEE9E">
			<h1>
				마이홈 페이지   <small>프로필</small>
			</h1>
		</div>
		<div>
		<img style="width: 300px; height: 300px;"
		src="${userinfo.profile_image}"/>						
		</div>
		<h2>${userinfo.gender}</h2>
		<h2>${userinfo.nickname}</h2>
		<h2>${userinfo.age_range}</h2>
		<h2>${userinfo.email}</h2>
	</div>



</section>