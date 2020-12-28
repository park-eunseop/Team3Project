package com.kosmo.veve.member;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.MemberFileDTO;
import com.kosmo.veve.model.service.MemberService;

@Controller
public class MemberDietController {
	
	
	// 식단분석
	@RequestMapping("/Member/MemberDiet.do")
	public String myhome(HttpServletRequest req) {
		
		
		return "member/Diet.tiles";
	}
	

	
	
}
