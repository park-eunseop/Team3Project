
//채팅
function openChatPop(url, name){//채팅 이미지 클릭시 팝업창 띄우기
    var options = 'top=30, left=30, width=552, height=600, status=no, menubar=no, toolbar=no';
    window.open(url, name, options);
}


//챗봇
$(document).ready(function(){//아래 DOM 객체들이 전부 생긴뒤 코드가 진행
	$('#chatbot_img').click(function(){//chatbot toggle
		$('#chatbot_container').toggle();	
		$('#chatbot_input input').focus();
	});

	$('#chatbot_header').click(function(){//chatbot_header close
		$('#chatbot_container').hide();
	});
	
	function sendMessage(message) {
        //console.log('입력메시지:',message)
        //flask서버로부터 응답을 받으면 receiveResponse콜백함수가 호촐됨
        //$.post( "/message", {'message': message}, receiveResponse);

        $.ajax({
        	url:"http://localhost:8383/message",
        	data:{'message': message},
        	type:'post',
        	success:receiveResponse,
        	beforeSend:appendLoader,//loader 띄우기
    	    complete:removeLoader//loader 지우기
        });

        function appendLoader(){
			$('.chatbot__messages').append(
				'<li class="is-ai" id="loader_li">'+
					'<span class="chatbot__arrow chatbot__arrow--left"></span>'+
					'<p class="chatbot__message">'+ 
						'<span class="loader">'+
							'<span class="loader__dot"></span>'+
							'<span class="loader__dot"></span>'+
							'<span class="loader__dot"></span>'+
						'</span>'+
					'</p>'+
				'</li>'
			);
			
			$("#chatbot_chatlog").scrollTop($("#chatbot_chatlog")[0].scrollHeight);
		}
		
		function removeLoader(){
			$('#loader_li').remove();
		}
		
		function receiveResponse(data) {//data는 flask로부터 받은 응답 {'message':'다이얼로그플로우가 보내준값'}
			//chat-container에 bot의 응답 추가
			$('.chatbot__messages').append(
				'<li class="is-ai">'+
					'<span class="chatbot__arrow chatbot__arrow--left"></span>'+
					'<p class="chatbot__message">'+ data.message + '</p>'+
				'</li>'
			)
			$("#chatbot_chatlog").scrollTop($("#chatbot_chatlog")[0].scrollHeight);//스크롤바 아래로
			//console.log('받은 메시지:',data);
		}
		
        function receiveResponse(data) {//data는 flask로부터 받은 응답 {'message':'다이얼로그플로우가 보내준값'}
		    //chat-container에 bot의 응답 추가
		    $('.chatbot__messages').append(
	    		'<li class="is-ai">'+
					'<span class="chatbot__arrow chatbot__arrow--left"></span>'+
					'<p class="chatbot__message">'+ data.message + '</p>'+
				'</li>'
		    );
		    
        	$("#chatbot_chatlog").scrollTop($("#chatbot_chatlog")[0].scrollHeight);
        	//console.log('받은 메시지:',data);
        }
    }////////////sendMessage
    
    function userMessageInput(){
    	var query = $('#query').val()
        //console.log(query);
        if (!query) {//텍스트를 입력하지 않는 경우
          return
        }
        //chat-container에 사용자의 응답 추가
        $('.chatbot__messages').append(
    		'<li class="is-user">'+
				'<p class="chatbot__message">'+ query +'</p>'+
				'<span class="chatbot__arrow chatbot__arrow--right"></span>'+
			'</li>'
        )
        // 입력창 클리어
        $('#query').val('');
        //스크롤바 아래로
        $("#chatbot_chatlog").scrollTop($("#chatbot_chatlog")[0].scrollHeight);
    	//메시지 전송
        sendMessage(query);
    }////////////userMessageInput
    
	$("#query").on('keypress',function(e) {//enter를 친 경우
		var keyValue = e.keyCode ? e.keyCode : e.which;
	    if (keyValue == 13){//enter 키
	    	userMessageInput();
	    }
	});
    
	$("#send_message_icon").click(function(e) {//보내기 이미지 누른 경우
		userMessageInput();
	});
    
});/////ready

