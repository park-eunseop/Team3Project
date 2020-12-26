<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
* {
  box-sizing: border-box;
}

.bg-img {
  /* The image used */
  background-image: url('<c:url value="/resources/assets/images/homebg.jpg"/>');

  min-height: 500px;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}

/* Add styles to the form container */
.container {
  position: absolute;
  right: 0;
  margin: 20px;
  max-width: 300px;
  padding: 16px;
  background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit button */
.btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}


.btn:hover {
  opacity: 1;
}

</style>

<div class="bg-img">
  <form id="form" method="post" action="<c:url value='/Member/Auth/LoginProcess.do'/>" class="container">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <h1>Login</h1>

    <label for="userID"><b>ID</b></label>
    <input type="text" placeholder="Enter ID" name="userID" required>

    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>

    <button type="submit" class="btn">Login</button>
    <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&
								client_id=a4931dffe864df9872aec1187961a45d
								&redirect_uri=http://localhost:8080/veve/login" 
								style="margin-top: 20px">
    <img style="width:100%;height:55px;padding-top: 5px" src="<c:url value="/resources/assets/images/kakao_login_medium_narrow.png"/>" alt="KAKAO">
    </a>
  </form>
</div>
