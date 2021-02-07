package com.kosmo.veve.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.MemberServiceImpl;

@Controller
public class MemberInfoController {

	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	//페이지 사이즈 조정
	private int pageSize = 3;//한 페이지에 보이는 수
	private int blockPage = 2;//paging UI 에서 몇번째 페이지까지 선택가능한지


	//맴버 조회
	@RequestMapping("/Admin/MemberInfo.do")
	public String admin_MemberInfo(@RequestParam Map map, Model model,
			@RequestParam(required = false, defaultValue = "1") int nowPage, HttpServletRequest req) {
		//페이징을 위한 로직 시작)
		//전체 레코드 수
		int totalMemberCount = memberService.getTotalMember(map);
		//System.out.println("totalMembercount: "+totalMemberCount);
		//전체 페이지 수
		int totalPage = (int)Math.ceil((double)totalMemberCount/pageSize); 
		//현재 페이지 번호 -- @RequestParam(required = false, defaultValue = "1") int nowPage 처리...

		//시작 및 끝 ROWNUM 구하기
		int start = (nowPage-1) * pageSize+1;
		int end = nowPage * pageSize;
		//페이징을 위한 로직 끝)

		map.put("start", start);		
		map.put("end", end);		

		List<MemberDTO> list = memberService.selectList_admin(map);
		List<Map> authlist = new ArrayList<Map>();
		List<String> idlist = new ArrayList<String>();
		
		System.out.println("여기야:  "+list);
		for(int i=0;i<list.size();i++) {
			Map map1 = new HashMap();
			String id = list.get(i).getUserID();
			map1.put("id", id);
			map1.put("enabled", memberService.showauth(id).get("ENABLED").toString());
			
			authlist.add(map1);
			
		}
		System.out.println(authlist);
		
		
		
		
		//페이징을 위한  path 데이타 저장]
		String path = req.getContextPath();
		if(map.get("searchWord")!=null) {
			path += "/Admin/MemberInfo.do?searchWord=" 
					+map.get("searchWord")+"&searchColumn="+map.get("searchColumn")+"&";
			//마지막 & 는 PagingUtil.java에서 만든 로직 때문...
		}
		else {
			path += "/Admin/MemberInfo.do?";
		}

		//페이징 소스
		String pagingString = 
				PagingUtil.pagingBootStrapStyle(totalMemberCount, pageSize, blockPage, nowPage, path);
		//System.out.println(list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalMemberCount", totalMemberCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("list", list);
		model.addAttribute("authlist", authlist);


		return "admin/MemberInfo.adminTiles";
	}//////////admin_MemberInfo


	//멤버 분류
	@RequestMapping("/Admin/MemberInfo/Sort.do")
	public String admin_MemberInfoSort(@RequestParam Map map, Model model,
			@RequestParam(required = false, defaultValue = "1") int nowPage, HttpServletRequest req) {
		
		return "admin/MemberInfo.adminTiles";
	}//////////admin_MemberInfoSort
	
	//권한 변경
	@RequestMapping("/Admin/MemberInfo/AuthChange.do")
	@ResponseBody
	public String admin_MemberInfoSort(@RequestParam Map map) {
	
		String auth=null;
		System.out.println("auth change:"+map.get("id"));
		String user_auth = memberService.showauth(map.get("id").toString()).get("ENABLED").toString();
		if(user_auth.equals("1")) {
			//유저 권한을 차단하겠음
			auth="forbid";
			map.put("ENABLED",0);
			
			memberService.updateAuth(map);
		}
		else {
			//유저 권한을 허용하겠음
			auth="access";
			map.put("ENABLED",1);
			
			memberService.updateAuth(map);

		}
		
		return auth;
	}//////////auth change
	

}
