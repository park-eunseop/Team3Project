<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="icon" type="image/png" href="/veve/resources/assets_admin/img/veve_admin_favicon.png">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/resources/chatbot/chatbot_style.css" />">
<title>VEVE 챗봇</title>
</head>
<!-- 선생님 참고 수업자료 -->
<!-- template -> Footer.jsp에 챗봇 자료 담김 -->
<body>
	<div class="container h-100">
		<div class="row align-items-center h-100">
			<div class="col-md-8 col-sm-12 mx-auto">
				<div class="h-100 justify-content-center">
					<div class="chat-container" style="overflow: auto; max-height: 80vh">
						<div class="chat-message col-md-5 bot-message" style="margin-bottom: 50px">
							안녕하세요. VEVE 챗봇입니다. 😀 현재 저는 비건등급, 중요 영양소, 홈페이지 기능을 알려드릴 수 있어요~
						</div>
					</div>
					<input class="input" type="text" placeholder="질의어를 입력하세요" id="query" />

				</div>
			</div>
		</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<script src="<c:url value="/resources/chatbot/chatbot.js" />"></script>

</body>
</html>