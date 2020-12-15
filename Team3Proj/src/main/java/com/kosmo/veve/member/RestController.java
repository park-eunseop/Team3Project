package com.kosmo.veve.member;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.service.MemberService;

@org.springframework.web.bind.annotation.RestController
public class RestController {
	
	@Resource(name = "memberService")
	private MemberService service;
	
	@PostMapping(value = "/json/sign/idCheck",produces = "text/html;charset=UTF-8")
	public String idcheck(@RequestBody MemberDTO user) {
		
		JSONObject obj = new JSONObject();
		System.out.println(user);
		String msg;
		
		boolean flag = service.idCheck(user.getUserID());
		System.out.println(flag);
		
		
		if(flag) {
			obj.put("flag", "0");
			obj.put("msg", "사용중인 아이디입니다.");
		}
		else {
			obj.put("flag", "1");
			obj.put("msg", "멋진 아이디네요!");
		}		
		return obj.toJSONString();
	}
	
	
	
	
	

}