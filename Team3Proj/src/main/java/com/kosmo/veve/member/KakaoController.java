package com.kosmo.veve.member;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.veve.model.service.MemberService;

@Controller
public class KakaoController {
	
	@Resource(name="kakaoService")
    private KakaoService kakaoService;
	
	@Resource(name = "memberService")
	private MemberService service;
	
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
	        session.setAttribute("KakaoUserId", userInfo.get("email"));
	        session.setAttribute("UserID", (String)userInfo.get("email"));//아이디
	        session.setAttribute("KakaoUserImg", userInfo.get("profile_image"));
	        //session.setAttribute("access_Token", access_Token);
	    }
	    //model.addAttribute("userinfo", userInfo);
	    System.out.println("카카오톡 로그인 성공!");
	    //카카오에서 뽑아온 정보
	    String userID = (String)userInfo.get("email");
	    String nickname = (String)userInfo.get("nickname");
	    String gender = (String)userInfo.get("gender");
	    String age = (String)userInfo.get("age_range");
	    if(age !=null)
	    	age = age.split("~")[0];    
	    
	    Map map = new HashMap();
	    
	    System.out.println("여기까진 나오나?");
	    String userIDforFlag = (String)session.getAttribute("UserID");
	    
	    boolean flag = service.idCheck(userIDforFlag);
	    System.out.println(flag); //true면 있는 아이디, false면 없는아이디
	    if(flag) {
	    	//회원가입 필요없어
	    	//일반 회원처럼 정보를 가져와야지
	    	
	    	
	    	System.out.println("회원가입 필요없어");
	    	
	    	return "forward:/Member/MyHome.do";
	    }
	    else{
	    	//회원가입해야해
	    	map.put("userID",userID);
		    map.put("password","1"); //pw 임의 값
		    map.put("name",nickname); //name 임의값
		    map.put("nickname",nickname);
		    map.put("gender",gender);
		    map.put("age",age);
	    	map.put("vg_level","Vegun"); //레벨 임의값
		    map.put("addr","서울시"); //주소 임의값 -> 임의값은 추후 입력
		    map.put("editordata","Hi"); //자기소개 임의값 -> 임의값은 추후 입력
	    	//카카오 회원가입 시
		    map.put("k1n0",1);
		    //파일 insert
		    map.put("f_path","http");
		    map.put("f_name",userInfo.get("profile_image"));
		    
	    	//테이블에 insert 할거야
	    	int temp = service.kakoinsert(map);
	    	System.out.println("kakaoinsert temp:"+temp);
	    	return "member/KakaoSign.tiles";
	    }
	    
	    
	}

	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("logout here");
		System.out.println(session.getAttribute("access_Token"));
		kakaoService.kakaoLogout((String)session.getAttribute("access_Token"));
		
	    session.invalidate();
	    System.out.println("카카오톡 로그아웃!");
	    return "home.tiles";
	}

	

}
