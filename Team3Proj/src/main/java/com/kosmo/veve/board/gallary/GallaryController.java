package com.kosmo.veve.board.gallary;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.veve.model.GallaryBoardDTO;
import com.kosmo.veve.model.GallaryCommentDTO;
import com.kosmo.veve.model.GallaryFileDTO;
import com.kosmo.veve.model.service.GallaryBoardService;


@SessionAttributes("id")//스프링 씨큐리티를 사용하지 않을때
@Controller
public class GallaryController {

	private static final int RESULT_EXCEED_SIZE = -2;
    private static final int RESULT_UNACCEPTED_EXTENSION = -1;
    private static final int RESULT_SUCCESS = 1;
    private static final long LIMIT_SIZE = 10 * 1024 * 1024;
		
	@Resource(name="gallaryService") 
	private GallaryBoardService gallaryService;
	
	@RequestMapping("/Gallary/GallaryEdit.do") 
	public String edit(
						//@RequestParam("upload") List<MultipartFile> files,
						@RequestParam Map map,
						HttpServletRequest req//컨텍스트 루트 얻기용
						) throws IllegalStateException, IOException{
		
		if(req.getMethod().equals("GET")) {//수정폼으로 이동
			//서비스 호출]
			GallaryBoardDTO record=gallaryService.selectBoardOne(map);
			List<GallaryFileDTO> fileList = gallaryService.selectFileList(map);
			//데이타 저장]
			req.setAttribute("record",record);
			req.setAttribute("fileList", fileList);
			/*
			 * Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			 * String path = req.getSession().getServletContext().getRealPath("/upload");
			 * for(MultipartFile mf : files) { File file = new
			 * File(path+File.separator+mf.getOriginalFilename()); //파일생성
			 * 
			 * mf.transferTo(file); //업로드 //서비스 호출] map.put("f_path", path); // map에 path랑
			 * name 저장 map.put("f_name", mf.getOriginalFilename()); map.put("userID",
			 * auth.getName()); gallaryService.updateFile(map);
			 */
			//}
			//수정 폼으로 이동]
			return "gallary/Edit";
		}
		//수정처리후 상세보기로 이동
		//서비스 호출
		gallaryService.update(map);
		//gallaryService.updateFile(map);
		return "forward:/Gallary/View.do"; 
	}
	
	//삭제처리]
	@RequestMapping("/Gallary/GallaryDelete.do")
	public String delete(@RequestParam Map map) {
		//서비스 호출
		gallaryService.deleteBoard(map);
		//뷰정보 반환]
		return "forward:/Gallary/List.do";
	}////////////
	
	@RequestMapping("/Gallary/List.do") 
	public String list(@RequestParam Map map,
						HttpServletRequest req,//컨텍스트 루트 얻기용
						Model model) {
		List<GallaryBoardDTO> boardList= gallaryService.selectBoardList(map);
		List<GallaryFileDTO> fileList = gallaryService.selectFileList(map);
	
		//데이타 저장]
		String path=req.getContextPath();
		model.addAttribute("boardList", boardList);
		model.addAttribute("fileList",fileList);
		return "gallary/List"; 
	}
	
	@RequestMapping(value="/Gallary/GallaryWrite.do",method = RequestMethod.GET) 
	public String write() {
		return "gallary/Write"; 
	}//////////////

	//입력처리]
	@RequestMapping(value="/Gallary/GallaryWrite.do",method = RequestMethod.POST) 
	public String writeOk( 
			@RequestParam("upload") List<MultipartFile> files,
			@RequestParam Map map,
			HttpServletRequest req,
			MultipartHttpServletRequest multipartRequest) throws IllegalStateException, IOException { 
		//서비스 호출] 
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		map.put("userID", auth.getName());//호출전 아이디 맵에 저장
		gallaryService.insert(map); //뷰정보 반환:목록으로 이동 
		writeFile(files, map, req,multipartRequest);
		return "forward:/Gallary/List.do";
	}
	
	@RequestMapping(value = "/gallaryboardWriteFile.do", method = RequestMethod.POST)
	public void writeFile(
			@RequestParam("upload") List<MultipartFile> files,
			@RequestParam Map map,
			HttpServletRequest req,
			MultipartHttpServletRequest multipartRequest
			) throws IllegalStateException, IOException {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		//String path = req.getServletContext().getContextPath();  //파일 저장 경로
		//String path = req.getServletContext().getRealPath("/upload");
		String path = req.getServletContext().getRealPath("/upload");
		
		Iterator<String> itr = multipartRequest.getFileNames();
		while(itr.hasNext()) {//받은 파일들을 모두 돌린다.
			MultipartFile mpf = multipartRequest.getFile(itr.next());
			String originalFilename=mpf.getOriginalFilename();
			String fileFullPath=path+"/"+originalFilename;
			
			try {
				mpf.transferTo(new File(fileFullPath));
				map.put("f_path", path);
				map.put("f_name", mpf.getOriginalFilename());
				map.put("userID", auth.getName());
				
				gallaryService.insertFile(map);
			}catch(Exception e) {e.printStackTrace();}
		}
		
		/*for(MultipartFile mf : files) {
			File file = new File(path+File.separator+mf.getOriginalFilename()); //파일생성

			mf.transferTo(file);  //업로드
			//서비스 호출]
			map.put("f_path", path);  // map에 path랑 name 저장
			map.put("f_name", mf.getOriginalFilename());
			map.put("userID", auth.getName());
			gallaryService.insertFile(map);
		}*/
	}//////////////
	
	@ResponseBody
    @RequestMapping(value="/imageupload", method=RequestMethod.POST)
    public int multiImageUpload(@RequestParam("files")List<MultipartFile> images) {
        long sizeSum = 0;
        for(MultipartFile image : images) {
            String originalName = image.getOriginalFilename();
            //확장자 검사
            if(!isValidExtension(originalName)){
                return RESULT_UNACCEPTED_EXTENSION;
            }
            
            //용량 검사
            sizeSum += image.getSize();
            if(sizeSum >= LIMIT_SIZE) {
                return RESULT_EXCEED_SIZE;
            }
            
            //TODO 저장..
        }
        
        //실제로는 저장 후 이미지를 불러올 위치를 콜백반환하거나,
        //특정 행위를 유도하는 값을 주는 것이 옳은 것 같다.
        return RESULT_SUCCESS;
    }
    
    //required above jdk 1.7 - switch(String)
    private boolean isValidExtension(String originalName) {
        String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1);
        switch(originalNameExtension) {
        case "jpg":
        case "png":
        case "gif":
            return true;
        }
        return false;
    }
    
    @RequestMapping("/Gallary/View.do")
	public String view(@RequestParam Map map,Model model) {
		//서비스 호출]
		GallaryBoardDTO boardList= gallaryService.selectBoardOne(map);
		List<GallaryFileDTO> fileList = gallaryService.selectFileList(map);
		//데이타 저장]
		//줄바꿈 처리
		//boardList.setContent(boardList.getContent().replace("\r\n","<br/>"));
		model.addAttribute("item", boardList);
		model.addAttribute("fitem", fileList);
		//뷰정보 반환]
		return "gallary/View";
	}/////////////

}