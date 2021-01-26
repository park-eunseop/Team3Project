<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!------------------------------------------------------------ chatbot -->
<!-- 챗봇 스타일 -->
<link rel="stylesheet" href="<c:url value="/resources/chatbot/chatbot_style.css"/>">

<!-- 챗봇 다이브 -->
<div id="chatbot_container">
	<!-- chatbot_header -->
	<div id="chatbot_header">
		<img id="vevebot_icon" src="/veve/resources/chatbot/VEVEbot.png" alt="베베봇"/>
		<div id="chatbot_name"><strong>베베봇</strong></div>
		<div id="chatbot_header_close">
			<svg height="20" width="20">
			    <line x1="1" y1="19"  x2="19" y2="1"   stroke="white"  stroke-width="3"/>
			    <line x1="1" y1="1"   x2="19" y2="19"   stroke="white"   stroke-width="3"/>
			</svg>
		</div>
	</div><!-- chatbot_header -->
	
	<!-- chatbot_chatlog -->
	<div id="chatbot_chatlog">
		<ul class="chatbot__messages">
			<li class="is-ai">
				<span class="chatbot__arrow chatbot__arrow--left"></span>
				<p class='chatbot__message'>
					안녕하세요? 베베봇이에요! 😀<br/>
					저는 비건등급, 중요 영양소, 홈페이지 기능을 알려드릴 수 있어요~
				</p>
			</li>
			<!-- 대화가 추가되는 곳 -->
		</ul>
	</div><!-- chatbot_chatlog -->
	
	<!-- chatbot_input -->
	<div id="chatbot_input">
		<input type="text" placeholder="질문을  써주세요." id="query"/>
		<img id="send_message_icon" src="/veve/resources/chatbot/send_message_icon.png" alt="보내기 이미지"/>
	</div><!-- chatbot_input -->
  
</div><!-- chatbot_container -->

<!-- 챗봇, 채팅 js -->
<script src="<c:url value="/resources/chatbot/chatbot.js"/>"></script>

<!-- 우측 하단의 버튼 -->
<c:if test="${empty UserID}" var="IsLogin">
<a href="javascript:login()">
	<img id="userChat_img" src="/veve/resources/chatbot/userChat.png" alt="유저  채팅 이미지"/>
</a>
</c:if>
<c:if test="${! IsLogin}">
<a href="javascript:openChatPop('<c:url value="/chatting/WebSocket.do"/>', 'userChat');">
	<img id="userChat_img" src="/veve/resources/chatbot/userChat.png" alt="유저  채팅 이미지"/>
</a>
</c:if>


<img id="chatbot_img" src="/veve/resources/chatbot/VEVEbot.png" alt="베베봇"
	onmouseover="this.src='/veve/resources/chatbot/VEVEbot_hover.png'" 
	onmouseout="this.src='/veve/resources/chatbot/VEVEbot.png'" />
<!-- ----------------------------------------------------------chatbot -->




<!-- footer -->
<section class="footer bg-black roomy-40">
        
    <div class="main_footer fix bg-mega text-center p-bottom-30">
        <div class="col-md-12">
            <p class="wow fadeInRight" data-wow-duration="1s">
                <a target="_blank" href="#">3조</a> 
                2020. All Rights Reserved
            </p>
        </div>
    </div>
</section>
<!-- footer 끝 -->






<!-- 부트스트랩 4.5.2 플러그인들 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- summernote -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- owl 캐러셀 -->
<script src="<c:url value="/resources/assets/js/owl.carousel.min.js"/>"></script>

<!-- 커스텀 js -->
<script src="<c:url value="/resources/assets/js/nav.js"/>"></script><!--네비게이션 바-->
<script src="<c:url value="/resources/assets/js/day.js"/>"></script><!--메인화면 요일 표기-->
<script src="<c:url value="/resources/assets/js/rolling.js"/>"></script><!--메인화면 채식메뉴 롤링-->
<script src="<c:url value="/resources/assets/js/carousel.js"/>"></script><!--캐러셀 -->
<script>
	window.onresize = function() {
		$('#display_width').html(window.innerWidth);
	};
</script>