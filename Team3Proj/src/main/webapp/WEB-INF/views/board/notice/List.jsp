<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Notice List -->

<section>
	<div class="visible-lg" style="background: black; height: 5em;">
	</div>
	<div class="hidden-lg" style="height: 5em;"></div>
</section>
<section>
	<div style="height: 2em;"></div>
</section>
<div class="container">
	<!-- 점보트론(Jumbotron) -->
	<div class="jumbotron">
		<h1>
			<small>공지사항</small>
		</h1>
	</div>
	<!-- 작성하기 버튼 -->
	<div class="row">
		<div class="col-md-12 text-right">
		<c:if test="${! empty Admin}">
			<a href="<c:url value="/Board/Notice/NoticeWrite.do"/>" class="btn btn-nav">등록</a>
		</c:if>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">&nbsp;</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table
				class="table table-bordered table-hover table-condensed text-center">
				<!-- 테이블 컬럼폭은 col-*-*계열로 설정 -->
				<tr>
					<th style="width: 16% text-center">번호</th>
					<th style="width: 52% text-center">제목</th>
					<th style="width: 16% text-center">작성자</th>
					<th style="width: 16% text-center">작성일</th>
				</tr>
				<c:if test="${empty noticeList }" var="isEmpty">
					<tr>
						<td colspan="4" style="height: 16em; vertical-align: middle;">등록된 게시물이 없어요</td>
					</tr>
				</c:if>
				<c:if test="${!isEmpty}">
					<c:forEach var="item" items="${noticeList}" varStatus="loop">
						<tr>
							<td>${item.notice_no}</td>
							<td class="text-left">
							<a	href="<c:url value='/Board/Notice/NoticeView.do?notice_no=${item.notice_no}&nowPage='/><c:out value='${param.nowPage}' default='1'/>">${item.title }</a></td>
							<%-- <td>${item.notice_no}</td>
							<td>${item.title}</td> --%>
							<td>${item.userID}</td>
							<td>${item.postDate}</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
		<!-- column -->
	</div>
	<!-- row -->
	<!-- 페이징 -->
	<div class="row">
		<div class="col-md-12 text-center">${pagingString }</div>
	</div>
	<!-- 검색용 UI -->
	<div class="row">
		<div class="text-center">
			<form class="form-inline" method="post"
				action="<c:url value="/Board/Notice/NoticeList.do"/>">
				<div class="form-group">
					<select name="searchColumn" class="form-control">
						<option value="title">제목</option>
						<option value="name">작성자</option>
						<option value="content">내용</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" name="searchWord" class="form-control" />
				</div>
				<button type="submit" class="btn btn-primary:hover">검색</button>
			</form>
		</div>
	</div>
</div>
<section>
	<div style="height: 2em;"></div>
</section>