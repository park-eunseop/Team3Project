<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Notice View -->


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
		<div class="col-md-offset-2 col-md-8">
			<ul style="list-style: decimal;">
				<c:forEach var="authority" items="${authorities}">
					<li>${authority }</li>
				</c:forEach>
			</ul>
		</div>
	</div>

	<div class="row">
		<div class="col-md-offset-2 col-md-8">
			<table class="table table-bordered table-striped">
				<tr>
					<th class="col-md-2 text-center">번호</th>
					<td>${record.no}</td>
				</tr>
				<tr>
					<th class="text-center">제목</th>
					<td>${record.title}</td>
				</tr>
				<tr>
					<th class="text-center">작성자</th>
					<td>${record.name}</td>
				</tr>

				<tr>
					<th class="text-center">등록일</th>
					<td>${record.postDate}</td>
				</tr>
				<tr>
					<th class="text-center" colspan="2">내용</th>
				</tr>
				<tr>
					<td colspan="2">${record.content}</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- row -->
	<div class="row">
		<div class="col-md-offset-2 col-md-8">
			<!-- .center-block 사용시 해당 블락의 크기를 지정하자 -->
			<ul id="pillMenu" class="nav nav-pills center-block"
				style="width: 200px; margin-bottom: 10px">
				<!-- 씨큐리티 미 사용시 -->
				<%-- 
				<c:if test="${sessionScope.id == record.id }">
				--%>
				<!-- 씨큐리티 사용시 -->
				<c:if test="${username == record.id }">
					<%--
							<c:if test="${username == record.id }">
						--%>
					<li><a
						href="<c:url value='/Board/Notice/NoticeEdit.do?no=${record.no}'/>"
						class="btn btn-success">수정</a></li>
					<li><a href="javascript:isDelete();" class="btn btn-success">삭제</a></li>
				</c:if>

				<li><a
					href="<c:url value='/Board/Notice/NoticeList.do?nowPage=${param.nowPage}'/>"
					class="btn btn-success">목록</a></li>

			</ul>
		</div>
	</div>

	<!-- row -->
	<div class="row">
		<div class="col-md-12">
			<div class="text-center">


				<!-- 한줄 코멘트 입력 폼-->
				<!-- 마이바티스의 리절트맵 테스트용:${record.comments.size()} -->
				<h2>한줄 댓글 입력 폼(${record.comments.size()})</h2>
				<form class="form-inline" id="frm" method="post">
					<!-- 씨큐리티 적용:csrf취약점 방어용 -->
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <input type="hidden" name="no"
						value="${record.no}" />

					<!-- 수정 및 삭제용 파라미터 -->
					<input type="hidden" name="cno" /> <input placeholder="댓글을 입력하세요"
						id="title" class="form-control" type="text" size="50"
						name="content" /> <input class="btn btn-success"
						id="submit" type="button" value="등록" />

				</form>
				<div class="row">
					<!-- 한줄 코멘트 목록-->
					<!-- ajax로 아래에 코멘트 목록 뿌리기 -->
					<div id="comments" class="col-md-offset-3 col-md-6"></div>
				</div>
			</div>
		</div>
	</div>
</div>



<script>
	//페이지 로드시 코멘트 목록 뿌려주기]		
	showComments();
	//코멘트 입력 및 수정처리]
	var action;
	$("#submit").click(function() {

		if ($(this).val() == "등록")
			action = "<c:url value='/Notice/Comment/NoticeWrite.do'/>";
		else
			action = "<c:url value='/Notice/Comment/NoticeEdit.do'/>";
		//ajax로 요청]
		$.ajax({
			url : action,
			data : $('#frm').serialize(),
			dataType : 'text',
			type : 'post',
			success : function(data) {
				console.log(data);
				//글 등록후 코멘트 목록 뿌려주는 함수 다시 호출
				showComments();
				//입력댓글 클리어 및 포커스 주기
				$('#title').val('');
				$('#title').focus();
				//글 수정후 등록버튼으로 다시 교체하기
				if ($('#submit').val() == '수정')
					$('#submit').val('등록');
			}
		});
	});/////////////////
	//현재 글번호에 대한 모든 댓글을 요청하는 함수
	function showComments() {
		$.ajax({
			url : "<c:url value='/Notice/Comment/NoticeList.do'/>",
			data : {
				"notice_no" : "${record.notice_no}",
				"_csrf" : "${_csrf.token}"
			},
			dataType : 'json',
			type : 'post',
			success : showComments_,
			error : function(e) {
				console.log(e);
			}

		});

	}//////////////showComments
	//실제 댓글 목록을 뿌려주는 함수]
	function showComments_(data) {
		console.log('코멘트 목록:', data);
		var comments = "<h2>Notice Comment List</h2>";
		comments += "<table class='table table-bordered'>";
		comments += "<tr><th class='text-center col-md-2'>작성자</th><th class='text-center'>코멘트</th><th class='text-center col-md-2'>작성일</th><th class='text-center col-md-1'>삭제</th></tr>";
		if (data.length == 0) {
			comments += "<tr><td colspan='4'>등록된 댓글이 없습니다.</td></tr>";
		}
		$
				.each(
						data,
						function(index, element) {
							comments += "<tr><td>" + element['NAME'] + '</td>';
							
							//if ("${sessionScope.id}" == element['ID'])//씨큐리티 미 사용시
							if ("${username}" == element['userID'])//씨큐리티 사용시
								comments += "<td class='text-left'><span class='commentEdit' title='"+element['notice_com_no']+"' style='cursor:pointer'>"
										+ element['CONTENT']
										+ '</span></td>';
							else
								comments += "<td class='text-left'>"
										+ element['CONTENT'] + "</td>";

							comments += "<td>" + element['POSTDATE'] + "</td>";
							comments += "<td>";
							//if ("${sessionScope.id}" == element['ID'])
							if ("${username}" == element['userID'])
								comments += "<span class='commentDelete' title='"+element['CNO']+"' style='cursor:pointer'>삭제</span></td>";
							else
								comments += "<span style='color:gray;font-size:.7em'>삭제불가</span>";
							comments += "</td></tr>";
						});

		comments += "</table>";

		$('#comments').html(comments);

		//반드시 showComments_() 함수 안에
		//코멘트 제목 클릭시 코멘트 수정처리를 위한 UI변경부분]	
		$(".commentEdit").click(function() {
			console.log('클릭한 댓글의 키값(CNO):', $(this).attr('title'));
			//클릭한 제목으로 텍스트박스 값 설정
			$('#title').val($(this).html());
			//버튼은 등록에서 수정으로
			$('#submit').val('수정');
			//form의 hidden속성중 name="cno"값 설정
			$('input[name=notice_com_no]').val($(this).attr('title'));
		});
		//코멘트 삭제 처리]
		$(".commentDelete").click(function() {
			$.ajax({
				url : "<c:url value='/Notice/Comment/Delete.do'/>",
				data : {
					"notice_com_no" : $(this).attr('title'),
					"_csrf" : "${_csrf.token}"
				},
				dataType : 'text',
				type : 'post',
				success : function() {
					showComments();
				}

			});

		});

	}////////////////////	
	function isDelete() {
		if (confirm("정말로 삭제 하시겠습니까?")) {
			location
					.replace("<c:url value='/Board/Notice/Delete.do?no=${record.no}'/>");
		}
	}////////////isDelete
</script>