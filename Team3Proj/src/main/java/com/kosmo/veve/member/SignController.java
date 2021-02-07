package com.kosmo.veve.member;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kosmo.veve.fileupdown.FileUpDownUtils;
import com.kosmo.veve.model.MemberDAO;
import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.service.MemberService;

@Controller
public class SignController {

	@Resource(name = "memberService")
	private MemberService service;
	
	//[안드로이드 앱에 데이타 제공용 추가]
	@Resource(name = "memberDAO")
	private MemberDAO memberDao;

	// 로그인 창 이동
	@RequestMapping("/Member/Auth/Login.do")
	public String login(HttpServletRequest req) {
		System.out.println("여기로 들어왔음2");
		System.out.println(req.getParameter("NotLogin"));
		if(req.getParameter("NotLogin")==null)
			return "member/Login.tiles";
		else
			return "member/Forbid.tiles";
	}
	// 시큐리티에서 로그인 창 이동
		@RequestMapping("/Member/Auth/SecurityLogin.do")
		public String login(Principal principal,HttpServletRequest req) {
			String name = principal.getName();
			System.out.println(name);
			if(name.equalsIgnoreCase("admin")) {
				req.getSession().setAttribute("Admin", name);
				return "forward:/Admin/Main.do";
			}
			req.getSession().setAttribute("UserID", name);
			return "forward:/Member/MyHome.do";
		}

	// 회원가입 창 이동
	@RequestMapping("/Member/SignUp.do")
	public String signUp() {

		return "member/Sign.tiles";
	}
	// 회원가입
	@RequestMapping("/Member/UserSignUpUp.do")
	public String userSign(@RequestParam Map map,@RequestParam MultipartFile upload) {
		System.out.println("here!");
		
		
		return "member/Login.tiles";
	}
	///Member/Auth/Login.do?NotLogin=error


	// 회원가입
	@RequestMapping("/Member/UserSignUp.do")
	public String userSignUp(@RequestParam Map map, @RequestParam MultipartFile upload, HttpServletRequest req)
			throws IllegalStateException, IOException {
		System.out.println("controller here");
		// 1]서버의 물리적 경로 얻기
		String physicalPath = req.getServletContext().getRealPath("/upload");
		//System.out.println(physicalPath);
		String renameFilename = FileUpDownUtils.getNewFileName(physicalPath, upload.getOriginalFilename());
		// File file = new File(physicalPath+File.separator+renameFilename);
		// 2]File객체 생성
		File file = new File(physicalPath + File.separator + upload.getOriginalFilename());
//			//3]업로드 처리		
		upload.transferTo(file);
		map.put("f_path", physicalPath);
		map.put("f_name", upload.getOriginalFilename());
		System.out.println(map.get("userID"));
		System.out.println(map.get("password"));
		
		System.out.println(map.get("nickname"));
		System.out.println(map.get("age"));
		String age = (String)map.get("age");
		String[] birth = age.split("-");
		int born = Integer.parseInt(birth[0]);
		int cuAge = 2021-born;
		
		map.put("name", map.get("nickname")); // name = nickname
		map.put("addr", "서울시"); // 자기소개, Hi
		map.put("editordata", "Hi"); // 자기소개, Hi
		map.put("age", String.valueOf(cuAge));
		
		//일반 회원가입 k1n0 : 0
		map.put("k1n0",0);
		
		System.out.println(map.get("editordata"));
		
		System.out.println(map.get("age"));
		System.out.println(map.get("gender"));
		System.out.println(map.get("vg_level"));
		System.out.println(map.get("addr"));
		
		System.out.println(map.get("f_path"));
		System.out.println(map.get("f_name"));

		int temp = service.insert(map);

		return "member/Login.tiles";
	}
	
	//아이디 중복확인
	@RequestMapping(value = "/Member/sign/idCheck.do",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String idcheck(HttpServletRequest req) {
		
		JSONObject obj = new JSONObject();
		String userID = req.getParameter("userID");
		String msg;
		
		boolean flag = service.idCheck(userID);
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
	//안드로이드
	@RequestMapping(value = "/Member/Auth/SecurityLoginAR.do",method=RequestMethod.POST)
	   public String login2(HttpServletRequest req) {
	      
	      String userID = req.getParameter("userID");
	      String password = req.getParameter("password");
	      
	      MemberDTO member = new MemberDTO();
	      member.setUserID(userID);
	      member.setPassword(password);
	      memberDao.isLogin(member);
	      
	      req.getSession().setAttribute("UserID", userID);
	      req.getSession().setAttribute("password", password);
	      
	      return "forward:/MemberAnd/MemberDiet.do";
	   }
	   
	   @RequestMapping("/Member/Auth/Restaurant.do")
	   public String restaurant() {

	      return "board/Restaurant.tiles";
	   }
	

}
