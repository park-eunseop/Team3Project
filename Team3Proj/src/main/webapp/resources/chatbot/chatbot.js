function sendMessage(message) {
        console.log('입력메시지:',message)
        //flask서버로부터 응답을 받으면 receiveResponse콜백함수가 호촐됨
        //$.post( "/message", {'message': message}, receiveResponse);

        $.ajax({url:"http://localhost:8383/message",data:{'message': message},type:'post',success:receiveResponse})
        //rest api 용(서버 주소  http://localhost:9292)
        //$.ajax({url:"http://localhost:9292/message",data:{'message': message,'session_id':{{session_id}}},type:'post',success:receiveResponse})

        function receiveResponse(data) {//data는 flask로부터 받은 응답 {'message':'다이얼로그플로우가 보내준값'}
          //chat-container에 bot의 응답 추가
          $('.chat-container').append(`
                <div class="chat-message col-md-5 bot-message">
                    ${data.message}
                </div>
          `)
          //스크롤바 아래로
          $(".chat-container").scrollTop($(".chat-container")[0].scrollHeight);

             console.log('받은 메시지:',data)
        }
    }
$("#query").on('keypress',function(e) {

    if (e.keyCode == 13){//enter 키
        //e.preventDefault();
        var query = $('#query').val()
        console.log(query)
        if (!query) {//텍스트를 입력하지 않는 경우
          return
        }
        //chat-container에 사용자의 응답 추가
        $('.chat-container').append(`
            <div class="chat-message col-md-5 offset-md-7 human-message">
                ${query}
            </div>
        `)
        // 입력창 클리어
        $('#query').val('')
        //스크롤바 아래로
        $(".chat-container").scrollTop($(".chat-container")[0].scrollHeight);
        //메시지 전송
        sendMessage(query)
    }
});