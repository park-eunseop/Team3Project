package com.kosmo.veve.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.MemberServiceImpl;

@Controller
public class AdminController {
   
   @Resource(name="memberService")
   private MemberServiceImpl memberService;
   //페이지 사이즈 조정
   private int pageSize = 3;//한 페이지에 보이는 수
   private int blockPage = 2;//paging UI 에서 몇번째 페이지까지 선택가능한지
   
   
   //맴버 관리
   @RequestMapping("/Admin/MemberInfo.do")
   public String admin_MemberInfo(Model model,
		   @RequestParam(required = false, defaultValue = "1") int nowPage, HttpServletRequest req) {
	    //페이징을 위한 로직 시작)
		//전체 레코드 수
		int totalMemberCount = memberService.getTotalMember();
		System.out.println("totalMembercount: "+totalMemberCount);
		//전체 페이지 수
		int totalPage = (int)Math.ceil((double)totalMemberCount/pageSize); 
		//현재 페이지 번호 -- @RequestParam(required = false, defaultValue = "1") int nowPage 처리...
	
		//시작 및 끝 ROWNUM 구하기
		int start = (nowPage-1) * pageSize+1;
		int end = nowPage * pageSize;
		//페이징을 위한 로직 끝)
	
		Map map = new HashMap();
		map.put("start", start);		
		map.put("end", end);		
	
		List<MemberDTO> list = memberService.selectList_admin(map);
	
		//데이타 저장]
		String path = req.getContextPath();
		if(map.get("searchWord")!=null) {
			path += "/Admin/MemberInfo.do?searchWord=" 
					+map.get("searchWord")+"&searchColumn="+map.get("searchColumn")+"&";
			//마지막 & 는 PagingUtil.java에서 만든 로직 때문...
		}
		else {
			path += "/Admin/MemberInfo.do?";
		}
		 
		//추가 --페이징 뿌려주기
		String pagingString = 
				PagingUtil.pagingBootStrapStyle(totalMemberCount, pageSize, blockPage, nowPage, path);
		
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalMemberCount", totalMemberCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
	   
	   
     
      model.addAttribute("list", list);
      return "admin/MemberInfo.adminTiles";
   }//////////admin_MemberInfo
   
   
   
   
   
   @RequestMapping("/Admin/PostManagement.do")
   public String admin_PostManagement() {
      return "admin/PostManagement.adminTiles";
   }//////////admin_PostManagement
   
   
   
   @RequestMapping("/Admin/ReportedPost.do")
   public String admin_ReportedPost() {
      return "admin/ReportedPost.adminTiles";
   }//////////admin_ReportedPost
   
   
   @RequestMapping("/Admin/ReportedPostList.do")
   public String admin_ReportedPostList() {
      return "admin/ReportedPostList";
   }//////////admin_ReportedPostList

   
   
   @RequestMapping("/Admin/Notification.do")
   public String admin_Notification() {
      return "admin/Notification.adminTiles";
   }//////////admin_Notification
   
   
   
}