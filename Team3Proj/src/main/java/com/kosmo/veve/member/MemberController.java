package com.kosmo.veve.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	// 로그인 창 이동
		@RequestMapping("/Member/MyHome.do")
		public String login() {
			
			
			return "member/Myhome.tiles";
		}
}
