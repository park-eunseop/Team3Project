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
public class MemberController {
	
	@Resource(name = "memberService")
	private MemberService service;
	
	// 마이홈 페이지 이동
	@RequestMapping("/Member/MyHome.do")
	public String login(HttpServletRequest req) {
		
		String userID = (String)req.getSession().getAttribute("UserID");
		System.out.println("myhome:"+userID);
		MemberFileDTO filedto = service.selectFile(userID);
		System.out.println(filedto);
		req.setAttribute("filedto", filedto);
		Map map = new HashMap();
		map.put("userID", userID);
		MemberDTO userdto = service.selectOne(map);
		String self=userdto.getSelfintro().replace("\r\n", "</br>");
		userdto.setSelfintro(self);
		req.setAttribute("userdto", userdto);
		return "member/Myhome.tiles";
	}
}
