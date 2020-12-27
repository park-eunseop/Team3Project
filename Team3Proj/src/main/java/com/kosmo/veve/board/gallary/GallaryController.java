package com.kosmo.veve.board.gallary;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GallaryController {
	@RequestMapping("/Board/Gallary.do")
	public String gallary(HttpServletRequest req) {
		
		return "board/Gallary.tiles";
	}

}
