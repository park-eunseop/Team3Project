package com.kosmo.veve.board.restaurant;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RestaurantController {
	@RequestMapping("/Board/Restaurant.do")
	public String gallary(HttpServletRequest req) {
		
		return "board/Restaurant.tiles";
	}

}
