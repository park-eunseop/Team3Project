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
	
	
	
	
	
	
	

}