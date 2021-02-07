<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 로그아웃 시작 -->
<script>
	function logout(){
		$('#logoutForm').submit();
	}

</script>
<form id="logoutForm" method="post" action="<c:url value="/Member/Auth/Logout.do"/>">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<!-- 로그아웃 끝 -->

<!-- 정렬 -->
<script>
	var isAscending = true;
	/*console.log(${isAscending})*/
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
						<div style="float:left; font-size: 20px; font-weight: lighter ; padding: 1px">전체 회원</div><!-- h4 tag의 font-size:20px -->
						<div style="text-align: right; float:right;">
							<span style="font-size: 0.8em; border: 0.5rem outset orange; border-radius: 9px;">
							&nbsp;총 회원수: ${totalMemberCount}&nbsp; 
							</span>
						</div>
						<p class="category" style="clear:both;">
						권한 제거 항목으로 유저 계정을 차단하세요.<br/>
						 나이순, 게시글, 댓글 순 정렬 넣기<br/>
						차단 당한 회원, 회원 레벨별 분류, 성별 분류 버튼 만들기</br>
						분류한 내용대로 총 인원수 알려주기
						</p>
					</div>
					
					<!-- 검색용 UI -->
					<div style="text-align: right; margin: 20px">
						<form class="form-inline" method="post" action="<c:url value='/Admin/MemberInfo.do'/>">
							<div class="form-group">
								<select name="searchColumn" class="form-control">
									<option value="nickname">닉네임</option>
									<option value="userID">아이디</option>
								</select>
							</div>
							<div class="form-group">
								<input type="text" name="searchWord" class="form-control" />
							</div>
							<button type="submit" class="btn ">검색</button>
						</form>
					</div>
					
					<!-- table 시작 -->
					<div class="content table-responsive table-full-width">
						<table class="table table-hover table-striped">
							<thead>
								<th class="col-xs-2">아이디</th>
								<th class="col-xs-2">닉네임</th>
								<th class="col-xs-2">비건 등급</th>
								<th class="col-xs-2">성별</th>
								<th class="col-xs-1">나이
								<!-- ?searchWord=" 
					+map.get("searchWord")+"&searchColumn="+map.get("searchColumn")+"&"
					nowPage=${nowPage } -->
									<c:choose >
										<c:when test="${searchWord != null and isAscending == true}">
											<a href="<c:url value="/Admin/MemberInfo/Sort.do?nowPage=${nowPage }&searchWord=${searchWord }&searchColumn=${searchColumn }"/>">
										</c:when>
										<c:otherwise>
											<a href="<c:url value="/Admin/MemberInfo/Sort.do?nowPage=${nowPage }"/>">
										</c:otherwise>
									</c:choose>
										<span class="glyphicon glyphicon-sort-by-attributes"></span>
									</a>
								</th>
								<th class="col-xs-1">게시글 수
									<a href="<c:url value="/Admin/MemberInfo.do"/>">
										<span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
									</a>
								</th>
								<th class="col-xs-1">댓글 수
									<a href="<c:url value="/Admin/MemberInfo.do"/>">
										<span class="glyphicon glyphicon-sort-by-attributes"></span>
									</a>
								</th>
								<th class="col-xs-1">권한 제거</th>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list }" varStatus="loop">
									<tr>
										<td>${item.userID }</td>
										<td>${item.nickname}</td>
										<td>${item.vg_level}</td>
										<td>${item.gender}</td>
										<td>${item.age}</td>
										<td>${item.writtenPostCount}</td>
										<td>${item.writtenCommentCount}</td>
										<c:if test="${authlist[loop.index].enabled eq '1'}" var="forbid">
										<td><div onclick="changeAuth('${item.userID}')"><i class="fas fa-user-alt ${item.userID}"></i></div></td>
										</c:if>
										<c:if test="${!forbid}">
										<td><div onclick="changeAuth('${item.userID}')"><i class="fas fa-user-slash ${item.userID}"></i></div></td>
										</c:if>
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
			</div><!-- col-md-12 -->
		</div><!-- row -->
		
		
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="header">
						<div style="float:left; font-size: 20px; font-weight: lighter ; padding: 1px">
						비건 등급
						</div><!-- h4 tag의 font-size:20px -->
						<p class="category" style="clear:both;">
						드랍다운느낌으로 설명 뿌려주기<br/> 비건 회원별로 볼 수 있는 버튼 만들고 등급별 인원수 뿌려주기
						</p>
					</div>
				</div><!-- card -->
			</div><!-- col-md-12 -->
		</div><!-- row -->
		
		
	</div><!-- container-fluid -->
</div><!-- content -->
<script>

function changeAuth(data){
	console.log(data);
	
	$.ajax({
        url:"<c:url value='/Admin/MemberInfo/AuthChange.do'/>",
        data:{"id":data},
        dataType:'text',
        type:'post',
        success:function(data){ 
        	console.log(data);
        	if(data=='forbid'){
        		//차단시킴
        		location.reload();
        	}
        	else{
        		location.reload();
        	}
      	  
        },
        error:function(e){console.log(e);}                 
     });
	
}	
</script>
