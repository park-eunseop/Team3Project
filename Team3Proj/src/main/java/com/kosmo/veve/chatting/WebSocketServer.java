package com.kosmo.veve.chatting;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketServer extends TextWebSocketHandler {
	
	//접속한 클라이언트를 저장하기 위한 속성(멤버변수)
	//키는 웹소켓 세션 아이디
	private Map<String,WebSocketSession> clients = new HashMap<String, WebSocketSession>();
	
	
	
	//클라이언트와 연결되었을때 호출되는 콜백 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		clients.put(session.getId(), session);
		String totalCount = "total:"+String.valueOf(clients.size());
		TextMessage connectionMemberCount = new TextMessage(totalCount);
		//시간 저장
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("a h:mm",Locale.KOREAN);
		String nowTime = "time:" + sdf.format(date);
		
		for(WebSocketSession client: clients.values()) {
			client.sendMessage(connectionMemberCount);
			client.sendMessage(new TextMessage(nowTime));
		}
		
	}
	
	//클라이언트와 연결이 끊겼을때 호출되는 콜백 메서드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		clients.remove(session.getId());
		String totalCount = "total:"+String.valueOf(clients.size());
		TextMessage connectionMemberCount = new TextMessage(totalCount);
		for(WebSocketSession client: clients.values()) {
			client.sendMessage(connectionMemberCount);
			client.sendMessage(new TextMessage("ser:상대분이 퇴장했어요."));
		}
	}
	
	//클라이언트로 부터 메세지를 받았을 때 자동으로 호출되는 콜백 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session.getId()+"로 부터 받은 메세지: "+message.getPayload());
		//시간 저장
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("a h:mm",Locale.KOREAN);
		String nowTime = "time:" + sdf.format(date);
		//broadcating(접속한 모든 사용자에게 메세지를 뿌려주기)
		for(WebSocketSession client: clients.values()) {
			if(!session.getId().equals(client.getId())) {//자기가 보낸 메세지가 아니면
				client.sendMessage(message);
				client.sendMessage(new TextMessage(nowTime));
			}
		}
	}

	//에러 발생시 메서드
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId()+"와 통신 장애 발생: "+exception.getMessage());
	}


}
