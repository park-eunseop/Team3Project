<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



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

<!-- 페이징 -->
<script>
	$(function(){
		//POST method: json으로 하나의 데이터를 받아서 받은 결과 그대로 json으로 응답 보내기
		$('#btn1').on('click',function(){
			//var data = $('#form1').serialize();//쿼리스트링으로 연결된다.//name=1&age=2&addr=3
			var data =  $('#form1').serializeArray();//[{…}, {…}, {…}] 형태
			/*
			[{name: "name", value: "1"},
			{name: "age", value: "2"},
			{name: "addr", value: "3"}]
			폼 하위요소의 속성명이 키가 되고, 파라미터 명이나 사용자가 입력한 값이 속성명에 따른 벨류값이 돤다.
			*/
			console.log(data);
			obj = {};
			$.each(data,function(index,element){
				obj[element.name]=element.value;
			});
			console.log(obj);
			$.ajax({
				type:'post',
				url:"<c:url value='/json/users/one'/>",
				dataType:'json',
				data:JSON.stringify(obj),
				contentType:'application/json',
				success:function(data){
					console.log('서버로 부터 받은 데이터: ',data);
				}
			});
			
		});
	});//로드시 실행되는 function
</script>

<nav class="navbar navbar-default navbar-fixed">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navigation-example-2">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Member Information</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-left"></ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="javascript:logout()">
						<p>Log out</p>
				</a></li>
				<li class="separator hidden-lg hidden-md"></li>
			</ul>
		</div>
	</div>
</nav>

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="header">
						<h4>전체 회원</h4>
						<p class="category">
						테이블을 클릭하여 유저 정보를 관리하세요.<br/>
						회원 레벨별 분류, 나이순, 게시글, 댓글 순 정렬 넣기
						</p>
					</div>
					<div class="content table-responsive table-full-width">
						<table class="table table-hover table-striped">
							<thead>
								<th>아이디</th>
								<th>닉네임</th>
								<th>비건 등급</th>
								<th>성별</th>
								<th>나이</th>
								<th>게시글 수</th>
								<th>댓글 수</th>
								<th>권한 제거</th>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list }" varStatus="loop">
									<tr>
										<td>${item.userID }</td>
										<td>${item.nickname}</td>
										<td>${item.vg_level}</td>
										<td>${item.gender}</td>
										<td>${item.age}</td>
										<td>${item.age}</td>
										<td>${item.age}</td>
										<td>${item.age}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div><!-- table div -->
					
					<!-- 페이징 -->
					<div class="row">
						<div class="col-md-12 text-center">${pagingString }</div>
					</div>
					
				</div><!-- card -->
			</div>


		</div><!-- row -->
	</div>
</div>

