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
		
		
		
	</div>
	<div class="row text-center">
		<div class="col-sm-4">
		<span class="margin">레시피 게시물</span>
		<button class="btn" >레시피 게시물 작성</button>
		</div>
		<div class="col-sm-4">
		<img src='<c:url value="/upload/${filedto.f_name}"></c:url>' alt="no">
		<textarea style="padding-top: 10px; border: none" rows="5 cols="10">${userdto.selfintro}</textarea>
		<button class="btn" >개인 정보 수정</button>
		</div>
		<div class="col-sm-4">식단 영양 프로그래스바</div>
	</div>
	<div class="text-center">
		<div class="margin">팔로워,자기가 작성한 갤러리 게시물</div>		
		<div class="col-sm-4">게시물1</div>
		<div class="col-sm-4">게시물2</div>
		<div class="col-sm-4">게시물3</div>	
	</div>	
	<button class="btn" >갤러리 게시물 작성</button>
	<div class="text-center">
		<span class="margin">최근 검색 위치</span>
		<button class="btn" >맛집 검색하러 가기</button>
		<div>지도</div>	
	</div>

</section>