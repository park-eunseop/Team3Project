package com.kosmo.veve.admin;

import javax.annotation.Resource;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RestController;

import com.kosmo.veve.model.MemberServiceImpl;

@RestController
public class MemberInfoController {
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	//페이지 사이즈 조정
	private int pageSize = 3;//한 페이지에 보이는 수
	private int blockPage = 2;//paging UI 에서 몇번째 페이지까지 선택가능한지
	/*
	 //rest 확인용
		@GetMapping(value="/users/{name}", produces = "text/html; charset=UTF-8")
		public String getURIParameter(@PathVariable String name) {
			return String.format("GET: URI 파라미터 사용-%s", name);
		}//////////////getURIParameter
		
		
		@PostMapping(value="/users", produces = "text/html; charset=UTF-8")
		public String postQueryParameter(@RequestParam String name) {
			return String.format("POST: 쿼리파라미터 사용-%s", name);
		}//////////////postQueryParameter
		@PostMapping(value="/users/{name}", produces = "text/html; charset=UTF-8")
		public String postURIParameter(@PathVariable String name) {
			return String.format("POST: URI 파라미터 사용-%s", name);
		}//////////////postQueryParameter
		*/
	//맴버 관리
	//@RequestMapping("/Admin/MemberInfo.do")
	public String admin_MemberInfo(Model model) {
/*
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


		map.put("start", start);		
		map.put("end", end);		


		List<OneMemoDTO> list= memoService.selectList(map);

		//데이타 저장]
		String path = req.getContextPath();
		if(map.get("searchWord")!=null) {
			path += "/OneMemo/BBS/List.do?searchWord=" 
					+map.get("searchWord")+"&searchColumn="+map.get("searchColumn")+"&";
			//마지막 & 는 PagingUtil.java에서 만든 로직 때문...
		}
		else {
			path += "/OneMemo/BBS/List.do?";
		}

		//추가 --페이징 뿌려주기
		String pagingString = 
				PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage, path);
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);

*/

		//List<MemberDTO> list = memberService.selectList_admin();






		//model.addAttribute("list", list);



		return "admin/MemberInfo.adminTiles";
	}//////////admin_MemberInfo


	   
	   
}
