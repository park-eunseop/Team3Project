<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<section id="home" class="home bg-black fix" style="height: 200px">
	<div class="container">
		<div class="row">
			<div class="main_home text-center">
				<div class="col-md-12">
					<div class="hello">
						<div class="slid_item">
							<div class="home_text ">
								<h1 class="text-yellow">Login</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section>

	<div class="container">	 
		<c:if test="${not empty param.NotLogin }">
			<div class="row">
				<div class="col-sm-5 alert alert-warning fade in">
					<button class="close" data-dismiss="alert">
						<span>&times;</span>
					</button>
					  인증이 안된 사용자입니다.
				</div>
			</div>
		</c:if>
		<div class="row">
			
			<sec:authorize access="isAuthenticated()">
				<div class="col-sm-5 alert alert-success"><sec:authentication property="principal.username"/>님
					즐감하세요</div>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
				<div class="col-sm-12">
					<form class="form-horizontal" id="form" method="post" 
						action="<c:url value='/Member/Auth/LoginProcess.do'/>">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<div class="form-group" style="color: black">
							<label for="id" class="col-sm-3  control-label">아이디</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="userID" id="userID"
									placeholder="아이디를 입력하세요">
							</div>
						</div>
						<div class="form-group" style="color: black">
							<label for="pwd" class="col-sm-3  control-label">비밀번호</label>
							<div class="col-sm-4">
								<input type="password" class="form-control" id="password" name="password"
									placeholder="비밀번호를 입력하세요">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-6 col-sm-10">
								<input type="submit" value="로그인" class="btn btn-danger" id="btn"/>
							</div>
						</div>
					</form>
					<a
						href="https://kauth.kakao.com/oauth/authorize?response_type=code&
								client_id=a4931dffe864df9872aec1187961a45d
								&redirect_uri=http://localhost:8080/veve/login"
						class="m-b-20"> 
						<img style="width: 230px; height: 40px;"
						src="<c:url value="#"/>"
						alt="KAKAO">
						카카오 로그인</a>
				</div>				
			</sec:authorize>
		</div>
	</div>



</section>