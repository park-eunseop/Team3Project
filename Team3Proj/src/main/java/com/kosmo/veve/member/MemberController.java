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
	
	//다른 회원 정보로 보내기
	@RequestMapping("/Member/OtherHome.do")
	public String otherhome(HttpServletRequest req) {
		//세션에 담긴 filedto,kakaofiledto 삭제
		req.getSession().removeAttribute("kakaofiledto");
		req.getSession().removeAttribute("filedto");	
		
		Map map = new HashMap();
		String otherkey = req.getParameter("otherid");
		String userID;
		//1)id인지 key인지 
		//true 아이디 false nickname
		boolean flag = service.idCheck(otherkey);
		if(flag)
			//id
			userID = otherkey;
		else 
			//nickname-> 아이디
			userID = service.getid(otherkey);
		
		//만약에 자기 자신의 아이디라면 마이 홈으로
		if(userID.equals((String) req.getSession().getAttribute("UserID"))) {
			System.out.println("내 아이디지롱");
			return "forward:/Member/MyHome.do";
		}
			
		

		//2)카카오 회원인지 아닌지 k1no =1 이면 카카오 ,iskakao true = 카카오
		boolean kakaoflag =service.isKakao(userID);
		MemberFileDTO filedto = service.selectFile(userID);
		if(kakaoflag) {			
			//카카오 회원이라면 카카오 사진 파일
			System.out.println(filedto.getF_name());
			req.getSession().setAttribute("kakaofiledto", filedto);
		}
		else {
			//일반 회원이랑면 일반 사진 파일
			System.out.println(filedto.getF_name());
			req.getSession().setAttribute("filedto", filedto);			
		}

		System.out.println("otherhome:" + userID);		
		map.put("userID", userID);
		MemberDTO userdto = service.selectOne(map);
		req.getSession().setAttribute("userdto", userdto);
		
		
		return "member/Otherhome.tiles";
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
		
	    
        Gson gson = new Gson();

        return gson.toJson(memberlist);
	}
	
	
	

}
