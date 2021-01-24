package com.kosmo.veve.chatbot;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.veve.model.MemberDTO;

@Controller
public class ChatbotController {
	
	@RequestMapping("/chatbot/ChatbotMain.do")
	public String ChatbotMain(@RequestParam Map map, Model model, HttpSession session) {
		return "chatbot/ChatbotMain";
	}//////////webSocketChatting

}
