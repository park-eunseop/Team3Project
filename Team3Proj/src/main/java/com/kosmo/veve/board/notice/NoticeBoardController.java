package com.kosmo.veve.board.notice;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kosmo.veve.model.NoticeBoardDTO;
import com.kosmo.veve.model.NoticeFileDTO;
import com.kosmo.veve.model.service.NoticeBoardService;



@RequestMapping("/Board/Notice")
@Controller
public class NoticeBoardController {

	//서비스 주입]
	@Resource(name="noticeService")
	private NoticeBoardService noticeBoardService;
	//파일첨부용
	private static final int RESULT_EXCEED_SIZE = -2;
    private static final int RESULT_UNACCEPTED_EXTENSION = -1;
    private static final int RESULT_SUCCESS = 1;
    private static final long LIMIT_SIZE = 10 * 1024 * 1024;
    //페이지 사이즈 조정
	private int pageSize = 5;//한 페이지에 보이는 수
	private int blockPage = 5;//paging UI 에서 몇번째 페이지까지 선택가능한지
	
	@RequestMapping("/Notice.do")
	public String notice(HttpServletRequest req) {
		return "board/Notice.tiles";
	}
	
	@RequestMapping("/NoticeList.do")
	public String list(			
			@RequestParam(required = false,defaultValue = "1") int nowPage,
			HttpServletRequest req, Model model) {
		
		//페이징을 로직]
		//전체 레코드수	
		System.out.println(">>> " + req.getSession().getAttribute("Admin"));
		int totalRecordCount = noticeBoardService.getTotalRecord();		
		//전체 페이지수
		int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize);
		//시작 및 끝 ROWNUM구하기
		int start =(nowPage-1) * pageSize+1;
		int end = nowPage * pageSize;		
		//페이징을 위한 로직 끝]
		Map map = new HashMap();
		map.put("start",start);
		map.put("end",end);///////
		//DTO]
		List<NoticeBoardDTO> noticeList = noticeBoardService.selectList(map);
		List<NoticeFileDTO> fileList = noticeBoardService.selectListFile(map);
		//데이타 저장]
		String path=req.getContextPath();
		if(map.get("searchWord") !=null) {
			path+="/Board/Notice/NoticeList.do?searchWord="+map.get("searchWord")+"&searchColumn="+map.get("searchColumn")+"&";
		}
		else {
			path+="/Board/Notice/NoticeList.do?";
		}
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage, path);
		//
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("fileList",fileList);
		
		// 뷰정보 반환]
		return "board/notice/List.tiles";
	}

	@RequestMapping(value = "/NoticeWrite.do", method = RequestMethod.GET)
	public String write() {
		// 뷰정보 반환]
		return "board/notice/Write.tiles";
	}
	
	@RequestMapping(value = "/NoticeWrite.do", method = RequestMethod.POST)
	public String writeOk(
			@RequestParam("upload") List<MultipartFile> files, 
			@RequestParam Map map,
	         HttpServletRequest req
	         ) throws IllegalStateException, IOException {
		// 서비스 호출]
		
		
		String userID = (String) req.getSession().getAttribute("Admin");
		map.put("userID",userID);
		noticeBoardService.insert(map);
		writeFile(files, map, req);
		// 뷰정보 반환:목록으로 이동
		return "forward:/Board/Notice/NoticeList.do";
	}
	
	@RequestMapping(value = "/NoticeWriteFile.do", method = RequestMethod.POST)
	public void writeFile(
			@RequestParam("upload") List<MultipartFile> files,
			@RequestParam Map map,
			HttpServletRequest req
			) throws IllegalStateException, IOException {
	
		  String userID = (String) req.getSession().getAttribute("Admin");
	      String path = req.getServletContext().getRealPath("/upload");
	      
	      for(MultipartFile mf : files) {
	         File file = new File(path+"/"+mf.getOriginalFilename());

	         mf.transferTo(file); 
	         map.put("f_path", path);  
	         map.put("f_name", mf.getOriginalFilename());
	         map.put("userID",userID); 
	         
	         noticeBoardService.insertFile(map);
	      }
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public int multiImageUpload(@RequestParam("files") List<MultipartFile> images) {
		long sizeSum = 0;
		for (MultipartFile image : images) {
			String originalName = image.getOriginalFilename();
			// 확장자 검사
			if (!isValidExtension(originalName)) {
				return RESULT_UNACCEPTED_EXTENSION;
			}
			// 용량 검사
			sizeSum += image.getSize();
			if (sizeSum >= LIMIT_SIZE) {
				return RESULT_EXCEED_SIZE;
			}
			// TODO 저장..
		}
		// 실제로는 저장 후 이미지를 불러올 위치를 콜백반환하거나,
		// 특정 행위를 유도하는 값을 주는 것이 옳은 것 같다.
		return RESULT_SUCCESS;
	}
	// required above jdk 1.7 - switch(String)
	private boolean isValidExtension(String originalName) {
		String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1);
		switch (originalNameExtension) {
		case "jpg":
		case "png":
		case "gif":
			return true;
		}
		return false;
	}

	@RequestMapping("/NoticeView.do")
	public String view(@RequestParam Map map,Model model) {
		//서비스 호출]
		NoticeBoardDTO noticeView = noticeBoardService.selectOne(map);
		List<NoticeFileDTO> noticeFile = noticeBoardService.selectListFile(map);
		//데이타 저장]
		model.addAttribute("noticeView", noticeView);
		model.addAttribute("noticeFile",noticeFile);
		//줄바꿈 처리
		//noticeView.setContent(noticeView.getContent().replace("\r\n","<br/>"));
		
		// 뷰정보 반환]
		return "board/notice/View.tiles";
	}
	@RequestMapping("/NoticeEdit.do")
	public String edit(HttpServletRequest req,@RequestParam Map map){
		if(req.getMethod().equals("GET")) {
			NoticeBoardDTO noticeView = noticeBoardService.selectOne(map);
			List<NoticeFileDTO> noticeFile = noticeBoardService.selectListFile(map);
			req.setAttribute("noticeView", noticeView);
			req.setAttribute("noticeFile",noticeFile);
			return "board/notice/Edit.tiles";
		}
		noticeBoardService.updateFile(map);
		noticeBoardService.update(map);
		return "forward:/Board/Notice/NoticeView.do";
	}
	
	//삭제처리]
	@RequestMapping("/Delete.do")
	public String delete(@RequestParam Map map) {
		noticeBoardService.delete(map);
		return "forward:/Board/Notice/NoticeList.do";
	}
	
	@RequestMapping("/DeleteFile.do")
	public String deleteFile(@RequestParam Map map) {
		noticeBoardService.deleteFile(map);
		return "forward:/Board/Notice/NoticeWrite.do";
	}
	
		
	
}
