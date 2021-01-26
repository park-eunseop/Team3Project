package com.kosmo.veve.board.notice;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.veve.model.service.NoticeBoardService;

@RequestMapping("/Board/Notice")
@Controller
public class NoticeBoardController {

	//서비스 주입]
	@Resource(name="noticeService")
	private NoticeBoardService noticeBoardService;
	
	@RequestMapping("/Notice.do")
	public String gallary(HttpServletRequest req) {

		return "board/Notice.tiles";
	}

	@RequestMapping("/NoticeList.do")
	public String list() {
		// 뷰정보 반환]
		return "board/notice/List.tiles";
	}

	@RequestMapping(value = "/NoticeWrite.do", method = RequestMethod.GET)
	public String write() {
		// 뷰정보 반환]
		return "board/notice/Write.tiles";
	}
	
	@RequestMapping(value = "/NoticeWrite.do", method = RequestMethod.POST)
	public String writeOk(@RequestParam Map map) {
		// 서비스 호출]
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		map.put("userID", ((UserDetails) auth.getPrincipal()).getUsername());// 씨큐리티 사용시
		//noticeBoardService.insert(map);
		// 뷰정보 반환:목록으로 이동
		return "forward:/Board/Notice/NoticeList.do";
	}

	@RequestMapping("/NoticeView.do")
	public String view() {
		// 뷰정보 반환]
		return "board/notice/View.tiles";
	}
}
