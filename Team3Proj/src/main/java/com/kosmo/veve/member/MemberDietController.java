package com.kosmo.veve.member;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.MemberFileDTO;
import com.kosmo.veve.model.service.MemberService;

@Controller
public class MemberDietController {
	
	
	// 식단분석
	@RequestMapping("/Member/MemberDiet.do")
	public String myhome(@RequestParam("result") String result) {
		
		System.out.println("사진 분석 result: "+result);
		System.out.println("정보를 가지고 왔어");
		return "member/Myhome.tiles";
	}
	// 식단분석
	@RequestMapping("/Member/MemberDietpost.do")
	public String getdiet(HttpServletRequest req) {
		
		System.out.println("사진 분석 result: "+req.getParameter("menu"));
		System.out.println("정보를 가지고 왔어2");
		return "forward:/Member/MyHome.do";
	}
	

	
	
}
