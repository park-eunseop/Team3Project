package com.kosmo.veve.admin;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FcmController {

   @GetMapping(value ="/Admin/fcm.do")
   public String getToken(HttpServletRequest req) {
      
      System.out.println(req.getParameter("token"));
      
      return "fcm/RegisterToken";
   }
   
   @PostMapping(value ="/Admin/fcm.do")
   public String postToken(HttpServletRequest req) {
      
      System.out.println(req.getParameter("token"));
      
      return "fcm/RegisterToken";
   }
   
   @GetMapping(value ="/Admin/Main.do")
   public String getMessage(Model model) {
	 //네이버 키워드 검색 API
	 		JSONObject jsonObject = NaverDataLabTrend.getData();
	 		JSONArray keyword3 = (JSONArray)jsonObject.get("results");//배열에 3개의 (키워드에 따른) json
	 		
	 		JSONObject vegan = (JSONObject)keyword3.get(0);
	 		JSONObject recipe = (JSONObject)keyword3.get(1);
	 		JSONObject health = (JSONObject)keyword3.get(2);

	 		model.addAttribute("vegan",vegan);
	 		model.addAttribute("recipe",recipe);
	 		model.addAttribute("health",health);
      
      return "admin/AdminMain.adminTiles";
   }
   
   @PostMapping(value ="/Admin/Main.do")
   public String postMessage(Model model) {
		 //네이버 키워드 검색 API
		JSONObject jsonObject = NaverDataLabTrend.getData();
		JSONArray keyword3 = (JSONArray)jsonObject.get("results");//배열에 3개의 (키워드에 따른) json
		
		JSONObject vegan = (JSONObject)keyword3.get(0);
		JSONObject recipe = (JSONObject)keyword3.get(1);
		JSONObject health = (JSONObject)keyword3.get(2);

		model.addAttribute("vegan",vegan);
		model.addAttribute("recipe",recipe);
		model.addAttribute("health",health);
      
      return "admin/AdminMain.adminTiles";
   }
   
   @RequestMapping(value = "/Admin/fcmPostToAndroid.do")
   public String postToAndroid() {
      return "fcm/PushToPhone";
   }
   
}