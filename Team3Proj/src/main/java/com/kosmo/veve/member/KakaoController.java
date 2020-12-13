package com.kosmo.veve.member;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class KakaoController {
	
	@Resource(name="kakaoService")
    private KakaoService kakaoService;
	
	
	@RequestMapping("/login")
	public String login(@RequestParam("code") String code, HttpSession session,Model model) {
		System.out.println("code:"+code);
		String access_Token = kakaoService.getAccessToken(code);
	    
	    HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
	    System.out.println("토큰:"+access_Token);
	    session.setAttribute("access_Token", access_Token);
	    
	    System.out.println("login Controller : " + userInfo);
	    
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (userInfo.get("email") != null) {
	        session.setAttribute("userId", userInfo.get("email"));
	        //session.setAttribute("access_Token", access_Token);
	    }
	    model.addAttribute("userinfo", userInfo);
	    System.out.println("카카오톡 로그인 성공!");
	    return "member/Myhome.tiles";
	}

	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("logout here");
		System.out.println(session.getAttribute("access_Token"));
		kakaoService.kakaoLogout((String)session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
	    session.removeAttribute("userId");
	    System.out.println("카카오톡 로그아웃!");
	    return "home.tiles";
	}

	

}
