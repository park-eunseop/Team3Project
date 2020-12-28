package com.kosmo.veve.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		int following = service.getFollowing(userID);
		int follower = service.getFollower(userID);
		System.out.println("following:" + following);
		System.out.println("follower:" + follower);
		req.setAttribute("following", following);
		req.setAttribute("follower", follower);

		if (following > 0) {

			List<MemberFollowDTO> followinglist = new ArrayList<MemberFollowDTO>();
			followinglist = service.getFollowingInfo(userID);
			//System.out.println("other:" + followinglist.get(0).getOtherID());

			List<Map<String, String>> foli = new ArrayList<Map<String, String>>();

			for (MemberFollowDTO fdto : followinglist) {
				Map<String, String> pronick = new HashMap<String, String>();
				System.out.println(fdto.getOtherID());
				map.put("userID", fdto.getOtherID());
				MemberDTO followingdto = service.selectOne(map);
				System.out.println(followingdto);
				pronick.put("nickname", followingdto.getNickname());// nickname저장
				MemberFileDTO followingfiledto = service.selectFile(fdto.getOtherID());
				pronick.put("file_name", followingfiledto.getF_name());// file_name저장
				foli.add(pronick);
			}
			req.setAttribute("followinglist", foli);// 팔로잉 리스트
		}
		if(follower>0) {
			List<MemberFollowDTO> followerlist = new ArrayList<MemberFollowDTO>();
			followerlist = service.getFollowerInfo(userID);
			//System.out.println("other:" + followerlist.get(0).getUserID());
			List<Map<String, String>> fole = new ArrayList<Map<String, String>>();
			for (MemberFollowDTO fdto : followerlist) {
				Map<String, String> pronick = new HashMap<String, String>();
				System.out.println(fdto.getUserID());
				map.put("userID", fdto.getUserID());
				MemberDTO followerdto = service.selectOne(map);
				//System.out.println(followerdto);
				pronick.put("nickname", followerdto.getNickname());// nickname저장
				MemberFileDTO followerfiledto = service.selectFile(fdto.getUserID());
				pronick.put("file_name", followerfiledto.getF_name());// file_name저장
				fole.add(pronick);
			}
			req.setAttribute("followerlist", fole);// 팔로워 리스트
			
		}
		
		

		System.out.println(filedto);
		req.setAttribute("filedto", filedto);

		map.put("userID", userID);
		MemberDTO userdto = service.selectOne(map);
		// String self=userdto.getSelfintro().replace("\n", "<br>");
		// userdto.setSelfintro(self);
		req.setAttribute("userdto", userdto);
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
		
	
	
	

}
