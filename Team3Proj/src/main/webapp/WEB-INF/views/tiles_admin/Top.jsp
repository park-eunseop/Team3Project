<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- admin_top -->
<!-- 로그아웃 시작 -->
<script>
	function logout(){
		$('#logoutForm').submit();
	}
</script>
<form id="logoutForm" method="post"
	action="<c:url value="/Member/Auth/Logout.do"/>">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>
<!-- 로그아웃 끝 -->


	
<div class="sidebar" data-color="orange" data-image="/veve/resources/assets_admin/img/vegun_admin_main.jpg">
<!--색 바꾸려면 data-color로 검색해서 css에서 노랑색 추가해서 쓰기   -->
<div class="sidebar-wrapper">
	<div class="logo">
		<a href="<c:url value='/Admin/Main.do'/>" class="simple-text">
			VEVE ADMIN </a>
	</div>

	<ul class="nav">
	<!-- 
	li tag에  class="active"를 주면 어떤 화면을 택한건지 표시가 나타난다.
	시간 남을때 동적으로 page확인해서 li tag에 class 넣어주기
	-->
		<li><a
			href="<c:url value='/Admin/Main.do'/>"> <i
				class="pe-7s-graph"></i>
				<p>Dashboard</p>
		</a></li>
		<li><a href="<c:url value='/Admin/MemberInfo.do'/>"> <i
				class="pe-7s-user"></i>
				<p>Member Information</p>
		</a></li>
		<li><a href="<c:url value='/Admin/PostManagement.do'/>"> <i class="pe-7s-note2"></i>
				<p>Post Management</p>
		</a></li>
		
		<li><a href="<c:url value='/Admin/ReportedPost.do'/>"> <i class="pe-7s-news-paper"></i>
				<p>Reported Post</p>
		</a></li>
		<li><a href="javascript:logout()"> <i class="pe-7s-power"></i>
				<p>Logout</p>
		</a></li>
		<li class="active-pro"><a href="<c:url value='/'/>"> <i class="pe-7s-rocket"></i>
				<p>VEVE HOME</p>
		</a></li>
	</ul>
</div>
</div>