package com.kosmo.veve.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.MemberFileDTO;
import com.kosmo.veve.model.service.MemberService;

@Controller
public class MemberDietController {
	
	@Resource(name="api")
    private Api foodapi;
	
	
	// 식단분석
	@RequestMapping("/Member/MemberDiet.do")
	public String myhome() {
		
		return "member/Diet.tiles";
	}
	// 식단분석
	@RequestMapping("/Member/MemberDietpost.do")
	public void getdiet(HttpServletRequest req) throws IOException {
		
		System.out.println("사진 분석 result: "+req.getParameter("data"));
		System.out.println("정보를 가지고 왔어2");
		foodapi.getFoodData();
		System.out.println("json 데이타 끝");
		
	}
	

	
	
}
