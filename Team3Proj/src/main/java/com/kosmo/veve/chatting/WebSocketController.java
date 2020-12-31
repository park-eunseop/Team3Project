package com.kosmo.veve.chatting;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebSocketController {
	
	@RequestMapping("/chatting/WebSocket.do")
	public String webSocketChatting() {
		return "chatting/WebSocket.tiles";
	}//////////webSocketChatting
	
}
