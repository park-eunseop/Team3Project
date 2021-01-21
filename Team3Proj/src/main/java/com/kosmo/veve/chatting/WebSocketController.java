package com.kosmo.veve.chatting;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.veve.model.MemberDTO;

@Controller
public class WebSocketController {
	
	@Resource(name="webSocketServiceImpl")
	private WebSocketServiceImpl webSocketService;
	
	@RequestMapping("/chatting/WebSocket.do")
	public String webSocketChatting(@RequestParam Map map, Model model, HttpSession session) {
		map.put("userID", session.getAttribute("UserID"));
		MemberDTO member = webSocketService.getNickname(map);
		String nickname = member.getNickname();
		
		model.addAttribute("nickname",nickname);
		return "chatting/WebSocket";
	}//////////webSocketChatting
	
}
