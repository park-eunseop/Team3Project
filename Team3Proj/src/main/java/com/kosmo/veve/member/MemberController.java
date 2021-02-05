package com.kosmo.veve.member;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kosmo.veve.model.GallaryBoardDTO;
import com.kosmo.veve.model.GallaryFileDTO;
import com.kosmo.veve.model.GallaryScrapDTO;
import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.MemberFileDTO;
import com.kosmo.veve.model.MemberFollowDTO;
import com.kosmo.veve.model.NutrientDTO;
import com.kosmo.veve.model.RecipeDTO;
import com.kosmo.veve.model.RecipeFileDTO;
import com.kosmo.veve.model.UserDietDTO;
import com.kosmo.veve.model.service.GallaryBoardService;
import com.kosmo.veve.model.service.GallaryCommentService;
import com.kosmo.veve.model.service.GallaryLikeService;
import com.kosmo.veve.model.service.GallaryScrapService;
import com.kosmo.veve.model.service.MemberService;
import com.kosmo.veve.model.service.RecipeService;
import com.kosmo.veve.model.service.UserDietService;

@Controller
public class MemberController {

	@Resource(name = "memberService")
	private MemberService service;
	@Resource(name = "userDietService")
	private UserDietService dietservice;
	
	@Resource(name="gallaryService") 
	private GallaryBoardService gallaryService;

	@Resource(name = "gallaryLikeService")
	private GallaryLikeService likeservice;
	
	@Resource(name = "gallaryscrapService")
	private GallaryScrapService scrapservice;
	
	@Resource(name="galcommentService")
	private GallaryCommentService commentService;
	
	@Resource(name="recipeService")
	private RecipeService recipeService;
	
	// 마이홈 페이지 이동
	@RequestMapping("/Member/MyHome.do")
	public String myhome(HttpServletRequest req, Model model) {
		Map map = new HashMap();
		String userID = (String) req.getSession().getAttribute("UserID");
		System.out.println("myhome:" + userID);
		MemberFileDTO filedto = service.selectFile(userID);

		// user 사진 가져오기
		req.getSession().setAttribute("filedto", filedto);
		map.put("userID", userID);
		MemberDTO userdto = service.selectOne(map);
		// String self=userdto.getSelfintro().replace("\n", "<br>");
		// userdto.setSelfintro(self);
		req.getSession().setAttribute("userdto", userdto);

		// 식단가져오기위한
		String gender = userdto.getGender().toLowerCase();
		int age = Integer.parseInt(userdto.getAge());
		System.out.println("Age:" + age);
		age = age / 10;
		age = age * 10;
		System.out.println("Age:" + age);
		map.put("gender", gender);
		map.put("age", String.valueOf(age));

		// 하루 식단 가져오기
		Date nowDate = new Date();
		System.out.println("포맷 지정 전 : " + nowDate);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy/MM/dd"); // 원하는 데이터 포맷 지정
		String strNowDate = simpleDateFormat.format(nowDate);
		System.out.println("포맷 지정 후 : " + strNowDate);
		String eatDate = strNowDate;
		map.put("eatDate", eatDate);
		List<UserDietDTO> todaylist = dietservice.getTodayNutrientInfo(map);
		System.out.println(todaylist);

		float TodayvitB12 = 0;
		float Todayprotein = 0;
		float Todayzinc = 0;
		float TodayvitD = 0;
		float Todaycalcium = 0;

		for (int i = 0; i < todaylist.size(); i++) {
			Todayprotein += Float.parseFloat(todaylist.get(i).getProtein());
			TodayvitB12 += Float.parseFloat(todaylist.get(i).getVitB12());
			TodayvitD += Float.parseFloat(todaylist.get(i).getVitD());
			Todayzinc += Float.parseFloat(todaylist.get(i).getZinc());
			Todaycalcium += Float.parseFloat(todaylist.get(i).getCalcium());
		}
		System.out.println("오늘 총:" + (Todayprotein + TodayvitB12 + TodayvitD + Todayzinc + Todaycalcium));

		// 회원 정보에 맞는 표준 정보 가져오기
		NutrientDTO ndto = dietservice.selectOne(map);
		System.out.println(ndto);

		float standardprotein = Float.parseFloat(ndto.getProtein());
		float standardVitB12 = Float.parseFloat(ndto.getVitB12());
		float standardVitD = Float.parseFloat(ndto.getVitD());
		float standardZinc = Float.parseFloat(ndto.getZinc());
		float standardCalcium = Float.parseFloat(ndto.getCalcium());

		// 하루 단백질 %
		float proteinPercent = Todayprotein / standardprotein * 100;
		System.out.println(proteinPercent);
		String strproteinPercent = String.format("%.2f", proteinPercent);
		// 하루 B12 %
		float b12Percent = TodayvitB12 / standardVitB12 * 100;
		System.out.println(b12Percent);
		String strbPercent = String.format("%.2f", b12Percent);
		// 하루 D %
		float dPercent = TodayvitD / standardVitD * 100;
		System.out.println(proteinPercent);
		String strdPercent = String.format("%.2f", dPercent);
		// 하루 아연 %
		float zincPercent = Todayzinc / standardZinc * 100;
		System.out.println(zincPercent);
		String strzincPercent = String.format("%.2f", zincPercent);
		// 하루 칼슘 %
		float calPercent = Todaycalcium / standardCalcium * 100;
		System.out.println(calPercent);
		String strcalPercent = String.format("%.2f", calPercent);

		model.addAttribute("strproteinPercent", strproteinPercent);
		model.addAttribute("strbPercent", strbPercent);
		model.addAttribute("strdPercent", strdPercent);
		model.addAttribute("strzincPercent", strzincPercent);
		model.addAttribute("strcalPercent", strcalPercent);

		// 팔로잉 수 가져오기
		int follwingCount = service.getFollowing(userID);
		System.out.println("following:" + follwingCount);
		// 팔로잉 정보가져오기
		List<MemberFollowDTO> follwinginfo = service.getFollowingInfo(userID);
		List<MemberDTO> followinginfos = new ArrayList<MemberDTO>();
		List<String> followingfileinfos = new ArrayList<String>();

		for (MemberFollowDTO other : follwinginfo) {
			map.put("userID", other.getOtherID());
			MemberDTO dto = service.selectOne(map);
			followinginfos.add(dto);
			MemberFileDTO follwingfile = service.selectFile(other.getOtherID());
			followingfileinfos.add(follwingfile.getF_name());
		}

		model.addAttribute("follwingCount", follwingCount);
		model.addAttribute("followinginfos", followinginfos);
		model.addAttribute("followingfileinfos", followingfileinfos);

		// 팔로워 가져오기
		int follwerCount = service.getFollower(userID);
		List<MemberFollowDTO> followeringinfo = service.getFollowerInfo(userID);
		List<MemberDTO> followerinfos = new ArrayList<MemberDTO>();
		List<String> followerfileinfos = new ArrayList<String>();

		for (MemberFollowDTO other : followeringinfo) {
			map.put("userID", other.getUserID());
			MemberDTO dto = service.selectOne(map);
			followerinfos.add(dto);
			MemberFileDTO follwerfile = service.selectFile(other.getUserID());
			followerfileinfos.add(follwerfile.getF_name());
		}

		model.addAttribute("follwerCount", follwerCount);
		model.addAttribute("followerinfos", followerinfos);
		model.addAttribute("followerfileinfos", followerfileinfos);

		///////////////////////////////
		// 갤러리 피드 가져오기
		// map은 사실상 필요없는거야
		userID = (String) req.getSession().getAttribute("UserID");
		map.put("userID", userID);
		
		List<GallaryBoardDTO> boardList = gallaryService.selectMyBoardList(map);
		List<GallaryFileDTO> fileList = gallaryService.selectFileList(map);

		List<String> likeList = new ArrayList<String>();
		List<String> commentList = new ArrayList<String>();
		List<List> files = new ArrayList<List>();

		for (int i = 0; i < boardList.size(); i++) {
			// 리스트 크기만큰 for문을 돌면서 번호에 해당하는 파일들을 List에 담아올꺼야
			String no = boardList.get(i).getGallary_no();
			// System.out.println("대장 게시물:"+no);
			List<String> files2 = new ArrayList<String>();

			// 파일 리스트 돌면서 일치하는 파일들을 List에 넣을꺼야
			for (int k = 0; k < fileList.size(); k++) {
				// System.out.println("쫄병 게시물:"+fileList.get(k).getGallary_no());
				String includeno = fileList.get(k).getGallary_no();

				if (no.equals(includeno)) {
					// System.out.println("쫄병 게시물:"+fileList.get(k).getGallary_no());

					files2.add(fileList.get(k).getF_name());
				}
			}

			files.add(files2);

			// 게시물 번호로 좋아요 갯수를 가져올꺼야

			map.put("gallary_no", no);
			int likeCount = likeservice.getLikeCount(map);
			System.out.printf("%s 게실물 , %s 좋아요 갯수 %n", no, likeCount);
			likeList.add(String.valueOf(likeCount));

			// 게시물 번호로 댓글 수 가져올꺼야

			int commentCount = commentService.getCommentCount(no);
			System.out.println("댓글수:" + commentCount);
			commentList.add(String.valueOf(commentCount));

		}
		System.out.println("게시판 갯수:" + boardList.size());
		System.out.println("게시판 갯수(파일):" + files.size());

		model.addAttribute("boardList", boardList);
		model.addAttribute("likeList", likeList);
		model.addAttribute("commentList", commentList);

		List<Map> fileList3 = new ArrayList<Map>();

		for (int j = 0; j < files.size(); j++) {
			Map filemap = new HashMap();
			filemap.put("fileSize", files.get(j).size());
			filemap.put("fileName", files.get(j).get(0));
			fileList3.add(filemap);
		}
		model.addAttribute("fileList", fileList3);
		
		
		
		///////스크랩 가져오기
		List<GallaryScrapDTO> gsdto =  scrapservice.selectScrapList(map);
		System.out.println("내가 스크랩한 리스트:"+gsdto.size());
		                                                         
		//갤러리 번호로 갤러리 정보를 가져와야해
		List<GallaryBoardDTO> scrapgallist = new ArrayList<GallaryBoardDTO>();
		for(int g=0;g<gsdto.size();g++) {
			map.put("gallary_no", gsdto.get(g).getGallary_no());
			GallaryBoardDTO sgdto = gallaryService.selectBoardOneByNo(map);
			scrapgallist.add(sgdto);
		}
		System.out.println("sgdto:"+scrapgallist);
		
		/////////////여기서 부터 수정
		List<GallaryFileDTO> scrapfileList = gallaryService.selectFileList(map);

		List<String> scraplikeList = new ArrayList<String>();
		List<String> scrapcommentList = new ArrayList<String>();
		List<List> scrapfiles = new ArrayList<List>();

		for (int i = 0; i < scrapgallist.size(); i++) {
			// 리스트 크기만큰 for문을 돌면서 번호에 해당하는 파일들을 List에 담아올꺼야
			String no = scrapgallist.get(i).getGallary_no();
			// System.out.println("대장 게시물:"+no);
			List<String> scrapfiles2 = new ArrayList<String>();

			// 파일 리스트 돌면서 일치하는 파일들을 List에 넣을꺼야
			for (int k = 0; k < scrapfileList.size(); k++) {
				// System.out.println("쫄병 게시물:"+fileList.get(k).getGallary_no());
				String includeno = scrapfileList.get(k).getGallary_no();

				if (no.equals(includeno)) {

					scrapfiles2.add(scrapfileList.get(k).getF_name());
				}
			}
			System.out.println(i+"번째게시물:"+scrapfiles2);
			scrapfiles.add(scrapfiles2);

			// 게시물 번호로 좋아요 갯수를 가져올꺼야

			map.put("gallary_no", no);
			int likeCount = likeservice.getLikeCount(map);
			System.out.printf("%s 게실물 , %s 좋아요 갯수 %n", no, likeCount);
			scraplikeList.add(String.valueOf(likeCount));

			// 게시물 번호로 댓글 수 가져올꺼야

			int commentCount = commentService.getCommentCount(no);
			System.out.println("댓글수:" + commentCount);
			scrapcommentList.add(String.valueOf(commentCount));

		}


		model.addAttribute("scrapboardList", scrapgallist);
		model.addAttribute("scraplikeList", scraplikeList);
		model.addAttribute("scrapcommentList", scrapcommentList);

		List<Map> scrapfileList3 = new ArrayList<Map>();

		for (int j = 0; j < scrapfiles.size(); j++) {
			Map filemap = new HashMap();
			filemap.put("fileSize", scrapfiles.get(j).size());
			filemap.put("fileName", scrapfiles.get(j).get(0));
			scrapfileList3.add(filemap);
		}
		model.addAttribute("scrapfileList", scrapfileList3);
		
		///////////////////////////
		
		
		
		///recipe board
		List<RecipeDTO> reboardList= recipeService.selectList(map);
        List<RecipeFileDTO> refileList = recipeService.selectListFile(map);
        //데이타 저장]
        String path=req.getContextPath();
        model.addAttribute("reboardList", reboardList);
        model.addAttribute("refileList",refileList);

		return "member/Myhome.tiles";
	}

	// 다른 회원 정보로 보내기
	@RequestMapping("/Member/OtherHome.do")
	public String otherhome(HttpServletRequest req) {
		// 세션에 담긴 filedto,kakaofiledto 삭제
		req.getSession().removeAttribute("kakaofiledto");
		req.getSession().removeAttribute("filedto");
		req.getSession().removeAttribute("isfollowing");

		Map map = new HashMap();
		String otherkey = req.getParameter("otherid");
		String otherID;
		// 1)id인지 key인지
		// true 아이디 false nickname
		boolean flag = service.idCheck(otherkey);
		if (flag)
			// id
			otherID = otherkey;
		else
			// nickname-> 아이디
			otherID = service.getid(otherkey);

		// 만약에 자기 자신의 아이디라면 마이 홈으로
		if (otherID.equals((String) req.getSession().getAttribute("UserID"))) {
			System.out.println("내 아이디지롱");
			return "forward:/Member/MyHome.do";
		}

		req.getSession().setAttribute("otherID", otherID);
		// 내가 팔로잉중인지 확인
		map.put("userID", (String) req.getSession().getAttribute("UserID"));
		map.put("otherID", otherID);
		boolean isfollowing = service.isfollowing(map); // 팔로잉중이면 1, true
		if (isfollowing)
			req.getSession().setAttribute("isfollowing", "success");

		// 2)카카오 회원인지 아닌지 k1no =1 이면 카카오 ,iskakao true = 카카오
		boolean kakaoflag = service.isKakao(otherID);
		MemberFileDTO filedto = service.selectFile(otherID);
		if (kakaoflag) {
			// 카카오 회원이라면 카카오 사진 파일
			System.out.println(filedto.getF_name());
			req.getSession().setAttribute("kakaofiledto", filedto);
		} else {
			// 일반 회원이랑면 일반 사진 파일
			System.out.println(filedto.getF_name());
			req.getSession().setAttribute("filedto", filedto);
		}

		System.out.println("otherhome:" + otherID);
		map.put("userID", otherID);
		MemberDTO userdto = service.selectOne(map);
		req.getSession().setAttribute("userdto", userdto);

		// otheruser의 팔로워 팔로잉 뽑아올거야

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

	// 회원탈퇴
	@RequestMapping("/Member/MemberRemove")
	@ResponseBody
	public String memberRemove(HttpServletRequest req,HttpSession session) {

		String curPwd = req.getParameter("curPwd");
		// 사용중인 사용자 아이디 가져오기
		String userID = (String) req.getSession().getAttribute("UserID");
		Map map = new HashMap();
		map.put("userID", userID);
		MemberDTO userdto = service.selectOne(map);
		String userPwd = userdto.getPassword();
		// 비교하기
		if (userPwd.equals(curPwd)) {
			// 삭제해야해
			System.out.println("탈퇴해야해:"+map.get("userID"));
			//otherid에 있는 follow 다 삭제해야해
			service.deletefollowWithdraw(userID);
			
			int withdraw = service.delete(userID);
			System.out.println("탈퇴여부:"+withdraw);
			session.invalidate();
			return "Success";
		} else {
			return "false";
		}

	}
	// 회원탈퇴
		@RequestMapping("/Member/MemberEditPWD")
		@ResponseBody
		public String memberEditPWD(HttpServletRequest req,HttpSession session) {
			
			//현재사용중인 패스워드
			String curPwd = req.getParameter("curPwd");
			//변경할 패스워드
			String editPwd = req.getParameter("editPwd");
			// 사용중인 사용자 아이디 가져오기
			String userID = (String) req.getSession().getAttribute("UserID");
			Map map = new HashMap();
			map.put("userID", userID);
			map.put("editPWD", editPwd);
		
			MemberDTO userdto = service.selectOne(map);
			String userPwd = userdto.getPassword();
			// 비교하기
			if (userPwd.equals(curPwd)) {
				// 변경해야해
				service.updatePwd(map);			
			
				return "Success";
			} else {
				return "false";
			}

		}
	

	// 회원 검색 자동완성
	@RequestMapping(value = "/json", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String json(HttpServletRequest req) {

		String userID = (String) req.getSession().getAttribute("UserID");
		Map map = new HashMap();
		map.put("userID", userID);
		List<MemberDTO> list = service.selectList(map);
		System.out.println("member list size:" + list.size());
		List<String> memberlist = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			memberlist.add(list.get(i).getUserID());
		}
		for (int i = 0; i < list.size(); i++) {
			memberlist.add(list.get(i).getName());
		}

		Gson gson = new Gson();

		return gson.toJson(memberlist);
	}

	// follow 하기
	@RequestMapping("/Member/follow")
	@ResponseBody
	public String follow(HttpServletRequest req) {
		req.getSession().removeAttribute("isfollowing");
		System.out.println("follow controller");

		String userID = (String) req.getSession().getAttribute("UserID");
		String otherID = (String) req.getSession().getAttribute("otherID");
		System.out.println(userID);
		System.out.println(otherID);
		Map map = new HashMap();
		map.put("userID", userID);
		map.put("otherID", otherID);
		int insertfollow = service.insertfollow(map);
		System.out.println("insertfollow:" + insertfollow);
		return "success";
	}

	// follow해제 하기
	@RequestMapping("/Member/following")
	@ResponseBody
	public String following(HttpServletRequest req) {
		req.getSession().removeAttribute("isfollowing");
		System.out.println("following controller");

		String userID = (String) req.getSession().getAttribute("UserID");
		String otherID = (String) req.getSession().getAttribute("otherID");
		System.out.println("user:" + userID);
		System.out.println("other:" + otherID);
		Map map = new HashMap();
		map.put("userID", userID);
		map.put("otherID", otherID);

		int deletefollow = service.deletefollow(map);
		System.out.println("deletefollow:" + deletefollow);

		return "success";
	}
	
	//카카오 추가 입력정보 페이지에서 마이홈으로
		@RequestMapping("/Member/kakaovgLevel.do")
		public String getSomeInfo(HttpServletRequest req) {
		

			return "forward:/Member/MyHome.do";
		}

}
