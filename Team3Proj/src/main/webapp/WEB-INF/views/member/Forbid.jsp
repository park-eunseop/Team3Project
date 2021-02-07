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
        <div class="sns text-center">
          <h2>없는 아이디거나 차단된 아이디입니다. 관리자에게 문의해주세요</h2>
        </div>

        
        

        

    </div>
</div>


<div class="footer-login text-center">
    <address>© 3조. All Rights Reserved</address> 
</div>
<!-- 로그인화면 끝 -->
