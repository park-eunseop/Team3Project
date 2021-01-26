package com.kosmo.veve.board.notice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosmo.veve.model.service.NoticeCommentService;


@RequestMapping("/Notice/Comment")
@Controller
public class NoticeCommentController {
	
	@Resource(name="noticeCommentService")
	private NoticeCommentService noticeCommentService;
	
	//코멘트 입력처리]
	@RequestMapping(value="/NoticeWrite.do",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String write(@RequestParam Map map) {
		//서비스 호출]
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		map.put("userID", auth.getName());
		noticeCommentService.insert(map);
		return map.get("notice_no").toString();//원본글의 번호 반환
	}/////////////////
	//특정 글번호에 대한 코멘트 목록 가져오기]
	@ResponseBody
	@RequestMapping(value="/NoticeList.do", produces = "text/html; charset=UTF-8")
	public String list(@RequestParam Map map) {
		//서비스 호출]
		List<Map> list = noticeCommentService.selectList(map);
		System.out.println(JSONArray.toJSONString(list));
		return JSONArray.toJSONString(list);
	}////////////
	//코멘트 수정처리]
	@ResponseBody
	@RequestMapping(value="/NoticeEdit.do",produces = "text/html; charset=UTF-8")
	public String update(@RequestParam Map map) {
		//서비스 호출]
		noticeCommentService.update(map);
		//원본글:댓글 번호 반환(확인)
		return String.format("%s : %s",map.get("notice_no").toString(),map.get("notice_com_no").toString());
		
	}
	//코멘트 삭제처리]
	@ResponseBody
	@RequestMapping(value="Delete.do",produces = "text/html; charset=UTF-8")
	public String delete(@RequestParam Map map) {
		//서비스 호출]
		noticeCommentService.delete(map);
		//삭제 댓글 번호 반환(확인)
		return String.format("%s",map.get("notice_com_no").toString());
		
	}
}
