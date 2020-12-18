package com.kosmo.veve.board.recipe;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RecipeController {
	@RequestMapping("/Board/Recipe.do")
	public String gallary(HttpServletRequest req) {
		
		return "board/Recipe.tiles";
	}

}
