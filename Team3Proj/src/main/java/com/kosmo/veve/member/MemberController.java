package com.kosmo.veve.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.MemberFileDTO;
import com.kosmo.veve.model.MemberFollowDTO;
import com.kosmo.veve.model.service.MemberService;

@Controller
public class MemberController {

	@Resource(name = "memberService")
	private MemberService service;

	// 마이홈 페이지 이동
	@RequestMapping("/Member/MyHome.do")
	public String myhome(HttpServletRequest req) {
		Map map = new HashMap();
		String userID = (String) req.getSession().getAttribute("UserID");
		System.out.println("myhome:" + userID);
		MemberFileDTO filedto = service.selectFile(userID);


		
		
		

		//user 사진 가져오기
		req.getSession().setAttribute("filedto", filedto);
		map.put("userID", userID);
		MemberDTO userdto = service.selectOne(map);
		// String self=userdto.getSelfintro().replace("\n", "<br>");
		// userdto.setSelfintro(self);
		req.getSession().setAttribute("userdto", userdto);
		return "member/Myhome.tiles";
	}

	// 마이정보 페이지 이동
	@RequestMapping("/Member/Mypage.do")
	public String mypage(HttpServletRequest req) {

		String userID = (String) req.getSession().getAttribute("UserID");
		System.out.println("myhome:" + userID);
		MemberFileDTO filedto = service.selectFile(userID);
		System.out.println(filedto);
		req.setAttribute("filedto", filedto);
		Map map = new HashMap();
		map.put("userID", userID);
		MemberDTO userdto = service.selectOne(map);
		req.setAttribute("userdto", userdto);
		return "member/Mypage.tiles";
	}
	
	//회원탈퇴
	@RequestMapping("/Member/MemberRemove")
	@ResponseBody
	public String memberRemove(HttpServletRequest req) {
		
		String curPwd = req.getParameter("curPwd");
		//사용중인 사용자 아이디 가져오기
		String userID = (String) req.getSession().getAttribute("UserID");
		Map map = new HashMap();
		map.put("userID", userID);
		MemberDTO userdto = service.selectOne(map);
		String userPwd = userdto.getPassword();
		//비교하기
		if(userPwd.equals(curPwd)) {
			//삭제해야해
			service.delete(map);	
			return "Success";
		}
		else {
			return "false";
		}
		
	}
	
	//회원 검색 자동완성
	@RequestMapping(value = "/json", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String json(HttpServletRequest req) {   
		
		String userID = (String) req.getSession().getAttribute("UserID");
		Map map = new HashMap();
		map.put("userID", userID);
		List<MemberDTO> list =service.selectList(map);
		System.out.println("member list size:"+list.size());
		List<String> memberlist = new ArrayList<String>();
		for(int i=0;i<list.size();i++) {
			memberlist.add(list.get(i).getUserID());
		}
		for(int i=0;i<list.size();i++) {
			memberlist.add(list.get(i).getName());
		}
		
		String[] array = {"김치 볶음밥", "신라면", "진라면", "라볶이", "팥빙수","너구리","삼양라면","안성탕면","불닭볶음면","짜왕","라면사리"};
	    
        Gson gson = new Gson();

        return gson.toJson(memberlist);
	}
	
	
	

}
