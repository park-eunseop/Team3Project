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

 <nav class="navbar navbar-default bootsnav navbar-fixed no-background white">
                <div class="container"> 
                    <!-- 마이홈 버튼-->
                    <div class="myhome-nav">
                        <ul>
                        	<sec:authorize access="isAnonymous()">
                            <li class="myhome">
                                <a href="<c:url value="/Member/Auth/Login.do"/>" class="btn btn-myhome">
                                    <i class="fas fa-user"></i>&nbsp;&nbsp;Login
                                </a>
                            </li>
                            </sec:authorize>
                            <sec:authorize access="isAuthenticated()">
                            <li class="myhome">
                            	<c:if test="${empty Admin}">
                                <a href="<c:url value="/Member/MyHome.do"/>" class="btn btn-myhome">
                                    <i class="fas fa-user"></i>&nbsp;&nbsp;MyHome
                                </a>
                                </c:if>
                                <c:if test="${!empty Admin}">
                                <a href="<c:url value="/Admin/Main.do"/>" class="btn btn-myhome">
                                    <i class="fas fa-user"></i>&nbsp;&nbsp;Admin
                                </a>
                                </c:if>
                                
                            </li>
                            </sec:authorize>
                            
                        </ul>
                    </div>


                    <!-- 통합검색 버튼-->
                    <div class="attr-nav">
                        <ul>
                            <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                        </ul>
                    </div>
                    
                    
                    <!-- 브랜드 로고 -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                            <i class="fa fa-bars"></i>
                        </button>
                        <a class="navbar-brand" href="<c:url value="/"/>">
                            <img src="<c:url value="/resources/assets/images/로고7.png"/>" class="logo" alt="">
                        </a>
                    </div>


                    <!-- 메뉴바 -->
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="<c:url value="/"/>">홈</a></li> 
                            
                            <li class="dropdown menu-large"><a href="#" class="dropdown-toggle" data-toggle="dropdown">채식서비스 <b class="caret"></b></a>          
                                <ul class="dropdown-menu megamenu row">
                                    <li><a href="<c:url value="/Member/MemberDiet.do"/>">베지식단 코칭</a></li>
                                    <li><a href="<c:url value="/Board/Restaurant.do"/>">베지맛집 찾기</a></li>
                                    
                                </ul>
                            </li>

                            <li class="dropdown menu-large"><a href="#" class="dropdown-toggle" data-toggle="dropdown">커뮤니티 <b class="caret"></b></a>          
                                <ul class="dropdown-menu megamenu row">
                                    <li><a href="<c:url value="/Gallary/List.do"/>">스토리</a></li>
                                    <li><a href="<c:url value="/recipe.do"/>">채식레시피 공유</a></li>
                                </ul>
                            </li>

                            <li class="dropdown menu-large"><a href="#" class="dropdown-toggle" data-toggle="dropdown">이벤트 <b class="caret"></b></a>          
                                <ul class="dropdown-menu megamenu row">
                                    <li><a href="#">진행중 이벤트</a></li>
                                    <li><a href="#">종료된 이벤트</a></li>
                                </ul>
                            </li>

                            <li class="dropdown menu-large"><a href="#" class="dropdown-toggle" data-toggle="dropdown">고객센터 <b class="caret"></b></a>          
                                <ul class="dropdown-menu megamenu row">
                                    <li><a href="<c:url value="/Board/Notice.do"/>">공지사항</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div>


                <!-- 숨은 검색창 -->
                <div class="top-search">
                    <div class="container">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-search"></i></span>
                            <input type="text" class="form-control" placeholder="Search">
                            <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                        </div>
                    </div>
                </div>

            </nav>










