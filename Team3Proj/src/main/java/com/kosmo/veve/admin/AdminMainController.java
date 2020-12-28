package com.kosmo.veve.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMainController {

	
	@RequestMapping("/Admin/Main.do")
	public String admin_Main(Model model) {
		//네이버 키워드 검색 API
		JSONObject jsonObject = NaverDataLabTrend.getData();
		JSONArray keyword3 = (JSONArray)jsonObject.get("results");//배열에 3개의 (키워드에 따른) json
		
		JSONObject vegan = (JSONObject)keyword3.get(0);
		JSONObject recipe = (JSONObject)keyword3.get(1);
		JSONObject health = (JSONObject)keyword3.get(2);

		model.addAttribute("vegan",vegan);
		model.addAttribute("recipe",recipe);
		model.addAttribute("health",health);
		
		
		//뷰정보 반환
		return "admin/AdminMain.adminTiles";
	}//////////admin_Main
	
	
	
	
	
}
