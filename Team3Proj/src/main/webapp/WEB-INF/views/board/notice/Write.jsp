<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Notice Write -->


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
			Notice<small>공지사항</small>
		</h1>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form class="form-horizontal" method="post"
				action="<c:url value='/Board/Notice/NoticeWrite.do'/>">
				<!-- 씨큐리티 적용:csrf취약점 방어용 -->
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<div class="form-group">
					<label class="col-md-2 control-label">제목</label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="title" placeholder="제목을 입력하세요?">
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-2 control-label">내용</label>
					<!-- 중첩 컬럼 사용 -->
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-8">
								<textarea class="form-control" name="content" rows="5"
									placeholder="내용 입력하세요"></textarea>
							</div>
						</div>
					</div>
				</div>

				<!-- 취소/등록버튼 -->
				<div class="form-group">
					<div class="hidden-md hidden-lg text-center">
						<div class="btn-group" role="group" aria-label="...">
							<a href="<c:url value="/Board/Notice/NoticeList.do"/>" class="btn btn-nav">취소</a>
							<button class="btn btn-nav" type="submit">등록</button>
						</div>
					</div>
					<div class="hidden-xs hidden-sm col-md-offset-2 col-md-10">
						<a href="<c:url value="/Board/Notice/NoticeList.do"/>" class="btn btn-nav">취소</a>
						<button class="btn btn-nav" type="submit">등록</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</div>
<section>
	<div style="height: 2em;"></div>
</section>
