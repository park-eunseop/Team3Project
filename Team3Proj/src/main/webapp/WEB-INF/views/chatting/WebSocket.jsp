<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="icon" type="image/png" href="/veve/resources/assets_admin/img/veve_admin_favicon.png">
<title>VeVe들과의 이야기 방 </title>
</head>

<body>
<!-- jq -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<link href="/veve/resources/assets/css/websocket.css" rel="stylesheet">

<div class="container">
	<!-- 점보트론(Jumbotron) -->
	<div class="jumbotron" style="height:250px; margin:20px"></div>

	<fieldset>
		<legend>VeVe들과의 이야기 방</legend>
		<p style="text-align: right"> 나를 포함한 채팅방 인원: <span id="connectionMemberCount" style="color:red"></span></p>
		<p style="text-align: right"> 나의 닉네임: <span id="nickname">${nickname}</span> </p>
		
        <div id="chatArea">
        	<div id="chatMessage" style="height: 400px; background:#2E8B57 ;border-radius: 9px; overflow: auto;"></div>
        </div> <!-- overflow 내용이 많으면 자동으로 스크롤바가 생긴다. -->


		<form>​
			<div class="form-group">
				
				<label for="message" class="col-xs-1" style="width:80px;margin-top:10px;">메시지</label>
				<div class="col-xs-5" style="text-align: center;">
					<input class="form-control" type="text" id="message"/>
				</div>
				<input type="text" style="display:none;"/> <!-- 의미없는 텍스트 박스 -->
				<input class="btn" style="color: #FFFFFF; background-color: #F3D55A;" type="button" id="sendBtn" value="전송">
			</div>
		</form>
		
		<div style="font-size: 7px;padding-right: 10px">
		</div>
	
		​
	</fieldset>
</div><!-- container -->


<!-- pure speech bubble로 검색 -->
<!-- codepen 사이트에서 가져온다. -->
<script>
	var wsocket;//웹 소켓 저장용
	var nickname;//닉네임 저장용
	var time;//시간 출력 저장용
	
	//서버와 연결된 소켓 클라이언트 생성
	$(document).ready(function(){
		wsocket = new WebSocket("ws://192.168.0.14:8080<c:url value='/chat-ws.do'/>");
		//서버와 연결된 소켓에 이벤트 등록(open,close,message,error)
		wsocket.onopen = open;
		wsocket.onclose=function(){
			appendServerMessage('연결이 끊어졌어요.');
		};
		wsocket.addEventListener('message',receiveMessage);
		wsocket.onerror=function(e){
			console.log('에러발생: '+e);
		};
		
	});
	
	
	//퇴장 버튼 클릭시
	$('#exitBtn').one('click',function(){
		//서버로 메세지를 보내는 메서드 send()
		wsocket.send('ser: '+nickname+'가(이) 퇴장했어요.');
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
		wsocket.send('ser: '+nickname+"님이 입장했어요.");
		appendServerMessage('연결이 되었어요.');
		$('#nickname').html();
	};
	
	//서버의 메세지를 뿌려주기 위한 함수
	var appendServerMessage =function(msg){
       $('#chatMessage').append("<div style='clear:both;text-align:center; background-color: #ffF3D55A; margin-top:10px; margin-bottom:10px; padding:10px'>" + msg + "</div>");
       $("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);//스크롤 내리기
    };
    //상대방의 닉네임을 뿌려주기 위한 함수
    var appendNickname = function(nickname){
    	$('#chatMessage').append(
   			"<div style='margin-top:13px;clear:both;'>"+
   				"&nbsp;&nbsp;<span style='padding:5px;background:#ffF3D55A ;border-radius: 9px;'>"+nickname+"</span>"+
   			"</div>");
    };
	//메시지를 DIV태그에 뿌려주기 위한 함수
    var appendMessage =function(msg){
       $('#chatMessage').append(
	  		   "<div style='text-align:left; width:100%;clear:both;'>"+
	  		   		"<div class='balloon test_3' style='float: left;'>" + 
	  		   			"<span>" + msg + "</span>" +
	  		   		"</div>"+
	  		   		"<div style='position: relative; bottom: -27px;font-size: 7px;'>"+time+"</div>"+
	  		   "</div>");
       $("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);//스크롤 내리기
    };
    //나의 메시지를 출력하기 위한 함수
    var appendMyMessage = function(msg){
       $('#chatMessage').append(
    			"<div style='text-align:right; width:100%;clear:both;'>"+
    				"<div class='balloon test_4' style='float: right;'>" + 
    					"<span>" + msg + "</span>"  + 
    				"</div>"+
    				"<div style='position: relative; bottom: -27px;font-size: 7px'>"+time+"</div>"+
    			"</div>");
       $("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);//스크롤 내리기
    };
   
    
	
	//서버에서 메세지를 받을 때의 함수
	var receiveMessage = function(e){//e는 message 이벤트 객체
		//서버로 부터 받은 데이터는 이벤트 객체(e).data속성에 저장되어 있다.
		var receiveData = e.data;
		if(receiveData.substring(0,4)=='msg:'){//대화 출력
			var nicknameAndMessage = receiveData.substring(4).split(":");
			appendNickname(nicknameAndMessage[0]);
			appendMessage(nicknameAndMessage[1]);
			return;
		}
		if(receiveData.substring(0,4)=='ser:'){//server 메세지 출력
			appendServerMessage(receiveData.substring(4));
			return;
		}
		if(receiveData.substring(0,5)=='time:'){//시간 표출
			time = receiveData.substring(5);
			return;
		}
		if(receiveData.substring(0,6)=='total:'){//총 인원수 출력
			$('#connectionMemberCount').html(receiveData.substring(6));
			return;
		}
		
	};
	
	
	//서버로 메세지를 전송하는 함수
	function sendMessage(){
		if($('#message').val().trim()!=""){
			//서버로 메세지 전송
			wsocket.send("msg: "+nickname+':'+$('#message').val()); //msg:Superman:안녕
			//div(대화영역)에 메세지 출력
			appendMyMessage($('#message').val());
			//기존 메세지 클리어
			$('#message').val("");
			$('#message').focus();
			
		}
		else{
			$('#message').val("");
			$('#message').focus();
		}
		
	};
	
</script>

</body>
</html>
