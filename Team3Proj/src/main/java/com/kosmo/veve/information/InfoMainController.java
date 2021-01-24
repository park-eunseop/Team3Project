package com.kosmo.veve.information;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class InfoMainController {
	
	@RequestMapping("/information/VeganLevel.do")
	public String VeganLevel() {
		return "information/VeganLevel.tiles";
	}////////////VeganLevel
	
	
	@RequestMapping("/information/ImportantNutrient.do")
	public String ImportantNutrient() {
		return "information/ImportantNutrient.tiles";
	}//////////ImportantNutrient
	
	
}
