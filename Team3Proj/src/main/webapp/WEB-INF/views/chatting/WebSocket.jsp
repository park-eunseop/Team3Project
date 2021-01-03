<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container">
	<!-- 점보트론(Jumbotron) -->
	<div class="jumbotron">
		<h1>
			Spring<small>Websocket</small>
		</h1>
	</div>

	<fieldset>
		<legend>웹소켓 클라이언트</legend>
		
			
			<p>나의 닉네임: <span id="nickname">${nickname}</span></p>
			<p>나를 포함한 현재 채팅방 인원: <span id="connectionMemberCount"></span></p>
			
	
			
				<h4>대화내용</h4>
				<div id="chatArea">
					<div id="chatMessage" style="height: 300px; border: 1px gray solid; overflow: auto">
					
					</div>
					<!-- overflow 내용이 많으면 자동으로 스크롤바가 생긴다. -->
				</div>
			
		<form>​
			<div class="form-group">
				<label for="message" class="col-sm-1">메시지</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="message" />
				</div>
			</div>
			<input type="text" style="display:none;"/> <!-- 의미없는 텍스트 박스 -->
			<input class="btn btn-success" type="button" id="sendBtn" value="전송">
		</form>​
	</fieldset>
</div><!-- container -->



<!-- pure speech bubble로 검색 -->
<!-- codepen 사이트에서 가져온다. -->
<script>
	var wsocket;//웹 소켓 저장용
	var nickname;//닉네임 저장용
	
	//서버와 연결된 소켓 클라이언트 생성
	$(document).ready(function(){
		wsocket = new WebSocket("ws://192.168.219.100:8080<c:url value='/chat-ws.do'/>");
		//서버와 연결된 소켓에 이벤트 등록(open,close,message,error)
		wsocket.onopen = open;
		wsocket.onclose=function(){
			appendMessage('연결이 끊어졌어요.');
		};
		wsocket.addEventListener('message',receiveMessage);
		wsocket.onerror=function(e){
			console.log('에러발생: '+e);
		};
		
	});
	
	
	//퇴장 버튼 클릭시
	$('#exitBtn').one('click',function(){
		//서버로 메세지를 보내는 메서드 send()
		wsocket.send('msg: '+nickname+'가(이) 퇴장했어요.');
		wsocket.close();
	});
	
	
	//전송버튼 이벤트 처리-클릭시
	$('#sendBtn').click(function(){
		sendMessage();
	});
	//전송버튼 이벤트 처리-enter입력시
	$('#message').on('keypress',function(e){
		//브라우저마다 다른 엔터 입력값 처리를 위해 e.keyCode,e.which 모두 처리해준다.
		console.log('e.keyCode: %s, e.which: %s',e.keyCode, e.which);
		var keyValue = e.keyCode ? e.keyCode : e.which;
		if(keyValue == 13) {//enter 입력시
			sendMessage();
		}
	});
	
	
	
	/////////////////////////////////////////////////함수 정의
	
	//서버에 연결되었을 때 호출되는 함수
	var open = function(){
		//연결시 닉네임 전송
		//사용자가 입력한 닉네임 저장
		nickname = $('#nickname').html();
		wsocket.send('msg: '+nickname+"가(이) 입장했어요.");
		appendMessage('연결이 되었어요.');
		$('#nickname').html();
		
		
	};
	
	//메세지를 div에 뿌려주기 위한 함수
	var appendMessage = function(msg){
		$('#chatMessage').append("<p style='text-align: left;'>"+msg+"</p>");
	};
	//나의 메세지를 출력하기 위한 함수
	var  appendMyMessage = function(msg){
		$('#chatMessage').append("<p style='text-align: right;'>"+msg+"</p>");
	};
	
	//서버에서 메세지를 받을 때의 함수
	var receiveMessage = function(e){//e는 message 이벤트 객체
		//서버로 부터 받은 데이터는 이벤트 객체(e).data속성에 저장되어 있다.
		var receiveData = e.data;
		if(receiveData.substring(0,4)=='msg:'){
			appendMessage(receiveData.substring(4));
		}
		if(receiveData.substring(0,4)!='msg:'){
			$('#connectionMemberCount').html(receiveData);
		}
		
	};
	
	
	//서버로 메세지를 전송하는 함수
	function sendMessage(){
		//서버로 메세지 전송
		wsocket.send("msg: "+nickname+':'+$('#message').val()); //msg:Superman:안녕
		//div(대화영역)에 메세지 출력
		appendMyMessage($('#message').val());
		//기존 메세지 클리어
		$('#message').val("");
		$('#message').focus();
	};
	
	
</script>
