<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
   /*현재 페이지는 네비게이션바와 footer를 없앤 페이지입니다.*/
   .navbar{
       display: none;
   }
   .footer{
       display: none;
   }
   body{
       background-color: #fcfcfc;
   }
</style>

<!-- 로그인화면 -->
<div class="login-form d-flex align-items-center">
    <div class="container align-items-center">
        
        <div class="text-center m-bottom-30">
            <a href="<c:url value="/"/>"><img src="<c:url value="/resources/assets/images/로고-로그인.png"/>" alt=""></a> <!--여기는 홈페이지 이동으로 연결해주세요-->
        </div>

        
        <form id="form" method="post" action="<c:url value='/Member/Auth/LoginProcess.do'/>" class="needs-validation" novalidate>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="form-group-id">
            <input type="text" autofocus="autofocus" class="form-control" id="uname" placeholder="아이디" name="userID" required>
        </div>
        <div class="form-group-pwd">
            <input type="password" autocomplete="off" class="form-control" id="pwd" placeholder="비밀번호" name="password" required>
        </div>
        
        <button type="submit" class="btn btn-login m-top-20 m-bottom-20">로그인</button>
        </form>

        <div class="sns text-center">
            <ul>
                <li><a href="#">아이디/비밀번호찾기</a></li>
                <li><a href="<c:url value="/Member/SignUp.do"/>">회원가입</a></li>
            </ul>
        </div>

        <div class="separator2"></div>
        
        <section class="login-sns text-center">
            <p>SNS계정으로 간편 로그인/회원가입</p>
            <div class="row">
                <div class="offset-3 col-sm-3">
                    <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&
							client_id=a4931dffe864df9872aec1187961a45d
							&redirect_uri=http://localhost:8080/veve/login">
							<img src="<c:url value="/resources/assets/images/카카오아이콘.jpg"/>" alt="카카오" class="icon-sns" />
					</a>
                </div>
                <div class="col-sm-2">
                    <a href="#"><img src="<c:url value="/resources/assets/images/네이버아이콘.jpg"/>" alt="네이버" class="icon-sns" /></a>
                </div>
            </div>

            <br/><br/><br/><br/><br/>
        </section>
    </div>
</div>


<div class="footer-login text-center">
    <address>© 3조. All Rights Reserved</address> 
</div>
<!-- 로그인화면 끝 -->
