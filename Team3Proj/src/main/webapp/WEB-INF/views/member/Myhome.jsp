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
	<div class="row text-center">
		<div class="col-sm-4">자기소개</div>
		<div class="col-sm-4">프로필사진</div>
		<div class="col-sm-4">식단 영양 프로그래스바</div>
	</div>
	<div class="text-center">
		<span class="margin">팔로워,자기가 작성한 갤러리 게시물</span>
		<button class="btn" >갤러리 게시물 작성</button>
		<div class="col-sm-4">게시물1</div>
		<div class="col-sm-4">게시물2</div>
		<div class="col-sm-4">게시물3</div>	
	</div>
	<div class="text-center">
		<span class="margin">레시피 게시물</span>
		<button class="btn" >레시피 게시물 작성</button>
		<div class="col-sm-4">게시물4</div>
		<div class="col-sm-4">게시물5</div>
		<div class="col-sm-4">게시물6</div>	
	</div>
	<div class="text-center">
		<span class="margin">최근 검색 위치</span>
		<button class="btn" >맛집 검색하러 가기</button>
		<div>지도</div>	
	</div>

</section>