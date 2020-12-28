package com.kosmo.veve.board.notice;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	@RequestMapping("/Board/Notice.do")
	public String gallary(HttpServletRequest req) {
		
		return "board/Notice.tiles";
	}

}
