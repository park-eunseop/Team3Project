<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	function login(){
		alert("로그인 후 이용하세요");
		$('#islogin').get(0).click();
	}

</script>

<!-- 로그아웃 GET->POST방식으로 변경하기 위한 폼 추가 -->
<form id="logoutForm" method="post"
	action="<c:url value="/Member/Auth/Logout.do"/>">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>


    <!-- 네비게이션바 -->
    <nav class="navbar" style="z-index: 9">
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
                <c:if test="${empty UserID}" var="IsLogin">
                <li><a href="javascript:login()">베지식단 코칭</a>
                <li><a href="javascript:login()">베지맛집 찾기</a></li>
                </c:if>
                <c:if test="${! IsLogin}">
                	<li><a href="<c:url value="/Member/MemberDiet.do"/>">베지식단 코칭</a>
                	<li><a href="<c:url value="/Board/Restaurant.do"/>">베지맛집 찾기</a></li>
                </c:if>
                <li><a href="<c:url value="/recipe.do"/>">채식 레시피</a></li>
                <li><a href="<c:url value="/Gallary/List.do"/>">커뮤니티</a></li>
                <li><a href="<c:url value="/Board/Notice/NoticeList.do"/>">공지사항</a></li>
				<a id="islogin" href="<c:url value="/Member/Auth/Login.do"/>" hidden="" ></a>
            </ul>



		 <c:if test="${empty KakaoUserId}" var="isNotKakaologin">
		 <sec:authorize access="isAnonymous()">
          <div class="login">
            <button><a href="<c:url value="/Member/Auth/Login.do"/>" class="btn btn-nav"><i class="fas fa-user"></i>&nbsp;&nbsp;Login</a></button>
          </div>         
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
          	<c:if test="${empty Admin}">
                 <button><a href="<c:url value="/Member/MyHome.do"/>" class="btn btn-nav"><i class="fas fa-user"></i>&nbsp;&nbsp;마이홈</a></button>   
            </c:if>
            <c:if test="${!empty Admin}">
                 <button><a href="<c:url value="/Admin/Main.do"/>" class="btn btn-nav"><i class="fas fa-user"></i>&nbsp;&nbsp;Admin</a></button>   
             </c:if>
          </sec:authorize>
          </c:if>
          <c:if test="${not isNotKakaologin }">
          	<button><a href="<c:url value="/Member/MyHome.do"/>" class="btn btn-nav"><i class="fas fa-user"></i>&nbsp;&nbsp;MyHome</a></button>  
          </c:if>
    
          <div class="icon menu-btn">
            <i class="fas fa-bars"></i>
          </div>
    
          
    
        </div>
      </nav>
    <!-- 네비게이션바 끝 -->




