<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<script>
/*
	function isLogin(){
	//ajax로 요청-로그인 여부 판단
	$.ajax({
		url:"<c:url value='/Member/Auth/IsLogin.do'/>",
		dataType:'json',
		success:function(data){
			if(data.isLogin =='YES')//로그인 되었다면
				//목록페이지로 이동
				location.replace("<c:url value='/BBS/List.do'/>");
			else{//로그인 안되었다면
				alert("로그인 후 이용하세요");
				location.replace("<c:url value="/Member/Auth/Login.do"/>");
				
			}
				
		},
		error:function(e){console.log(e);}
		
	});
	
	}
	*/

	function logout(){
		//location.replace("<c:url value="/OneMemo/Auth/Logout.do"/>");
		$('#logoutForm').submit();//스프링 씨큐리티의 csrf공격 사용시
	}

</script>

<!-- 로그아웃 GET->POST방식으로 변경하기 위한 폼 추가 -->
<form id="logoutForm" method="post"
	action="<c:url value="/Member/Auth/Logout.do"/>">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>



<!-- 
<nav
	class="navbar navbar-default bootsnav navbar-fixed no-background white">

	<div class="top-search">
		<div class="container">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-search"></i></span>
				<input type="text" class="form-control" placeholder="Search">
				<span class="input-group-addon close-search"><i
					class="fa fa-times"></i></span>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="attr-nav">
			<ul>
				<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
			</ul>
		</div>

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-menu">
				<i class="fa fa-bars"></i>
			</button>
			<a class="navbar-brand" href="<c:url value="/"/>"> <img
				src="<c:url value="/resources/assets/images/logo.png"/>"
				class="logo" alt=""> 
			</a>

		</div>

		<div class="collapse navbar-collapse" id="navbar-menu">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<c:url value="/"/>">Home</a></li>
				<c:if test="${empty userId}" var="isNotKakaologin">
					<sec:authorize access="isAnonymous()">
						<li><a href="<c:url value="/Member/Auth/Login.do"/>">Login</a></li>
						<li><a href="<c:url value="/Member/SignUp.do"/>">Sign up</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li><a href="javascript:logout()">Logout</a></li>
						<c:if test="${empty Admin}">
							<li><a href="<c:url value="/Member/MyHome.do"/>">My page</a></li>
						</c:if>
					</sec:authorize>
				</c:if>
				<c:if test="${not isNotKakaologin }">
					<li><a href="<c:url value="/logout"/>">Logout</a></li>
					<li><a href="<c:url value="/Member/MyHome.do"/>">My page</a></li>
				</c:if>
				<li><a href="<c:url value="/Board/Gallary.do"/>">Gallary</a></li>
				<li><a href="<c:url value="/Board/Recipe.do"/>">Recipe</a></li>
				<li><a href="<c:url value="/Board/Notice.do"/>">Notice</a></li>
				<c:if test="${!empty Admin}">
					<li><a href="<c:url value="/Admin/Main.do"/>">Admin</a></li>
				</c:if>
			</ul>
		</div>
	</div>

</nav>
 -->


<!-- ----------- -->

    <!-- 네비게이션바 -->
    <nav class="navbar">
        <div class="content text-center">
          <div class="logo">
            <a href="<c:url value="/"/>"><img src="<c:url value="/resources/assets/images/로고.png"/>" alt=""></a>
          </div>
          <div class="logo2">
            <a href="<c:url value="/"/>"><img src="<c:url value="/resources/assets/images/로고2.png"/>" alt=""></a>
          </div>

            <ul class="menu-list">
                <div class="icon cancel-btn">
                <i class="fas fa-times"></i>
                </div>
                <li><a href="<c:url value="/"/>">홈</a></li>
                <li><a href="#">채식서비스</a>
                    <!--<ul class="submenu">
                        <li><a href="#">베지식단 코칭</a></li>
                        <li><a href="#">베지맛집 찾기</a></li>
                        <li><a href="#">채식레시피 검색</a></li>
                    </ul>-->
                </li>
                <li><a href="#">커뮤니티</a></li>
                <li><a href="#">이벤트</a></li>
                <li><a href="#">고객센터</a></li>
            </ul>




		 <sec:authorize access="isAnonymous()">
          <div class="login">
            <button><a href="<c:url value="/Member/Auth/Login.do"/>" class="btn btn-nav"><i class="fas fa-user"></i>&nbsp;&nbsp;Login</a></button>
          </div>         
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
          	<c:if test="${empty Admin}">
                 <button><a href="<c:url value="/Member/MyHome.do"/>" class="btn btn-nav"><i class="fas fa-user"></i>&nbsp;&nbsp;MyHome</a></button>   
            </c:if>
            <c:if test="${!empty Admin}">
                 <button><a href="<c:url value="/Admin/Main.do"/>" class="btn btn-nav"><i class="fas fa-user"></i>&nbsp;&nbsp;Admin</a></button>   
             </c:if>
          </sec:authorize>
          
    
          <div class="icon menu-btn">
            <i class="fas fa-bars"></i>
          </div>
    
          
    
        </div>
      </nav>
    <!-- 네비게이션바 끝 -->




