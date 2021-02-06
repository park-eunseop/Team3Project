package com.kosmo.veve.board.gallary;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
import com.kosmo.veve.model.GallaryScrapDTO;
import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.MemberFileDTO;
import com.kosmo.veve.model.service.GallaryBoardService;
import com.kosmo.veve.model.service.GallaryCommentService;
import com.kosmo.veve.model.service.GallaryDecService;
import com.kosmo.veve.model.service.GallaryLikeService;
import com.kosmo.veve.model.service.GallaryScrapService;
import com.kosmo.veve.model.service.MemberService;


@Controller
public class GallaryController {

	private static final int RESULT_EXCEED_SIZE = -2;
    private static final int RESULT_UNACCEPTED_EXTENSION = -1;
    private static final int RESULT_SUCCESS = 1;
    private static final long LIMIT_SIZE = 10 * 1024 * 1024;
		
	@Resource(name="gallaryService") 
	private GallaryBoardService gallaryService;
	
	@Resource(name = "memberService")
	private MemberService service;

	@Resource(name = "gallaryLikeService")
	private GallaryLikeService likeservice;
	
	@Resource(name = "gallaryscrapService")
	private GallaryScrapService scrapservice;
	
	@Resource(name="galcommentService")
	private GallaryCommentService commentService;
	
	@Resource(name="gallaryDecService")
	private GallaryDecService decService;
	
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
	
	///무한 스크롤용
	//json 한글 깨짐처리위해 produces = "application/text; charset=UTF-8" 추가
	@RequestMapping(value = "/Gallary/infinit" , produces = "application/text; charset=UTF-8" )
	@ResponseBody
	public String appendlist(HttpServletRequest req) {
		
		System.out.println(req.getParameter("gallary_no"));
		int startNum = Integer.parseInt(req.getParameter("gallary_no"));
		int endNum = startNum + 6;
		Map map = new HashMap();
		map.put("start", startNum);
		map.put("end", endNum);
		System.out.println(String.valueOf(startNum));
		System.out.println(String.valueOf(endNum));
		
		List<GallaryBoardDTO> boardList = gallaryService.selectBoardListInfinit(map);
		System.out.println("가져온 리스트"+boardList);
		List<GallaryFileDTO> fileList = gallaryService.selectFileList(map);
		
		List<String> likeList = new ArrayList<String>();
		List<String> commentList = new ArrayList<String>();
		List<List> files = new ArrayList<List>();
		
		for(int i=0;i<boardList.size();i++) {
			//리스트 크기만큰 for문을 돌면서 번호에 해당하는 파일들을 List에 담아올꺼야
			String no = boardList.get(i).getGallary_no();
			//System.out.println("대장 게시물:"+no);
			List<String> files2 = new ArrayList<String>();

			//전체 파일 리스트 돌면서 일치하는 파일들을 List에 넣을꺼야
			for(int k=0;k<fileList.size();k++) {
				//System.out.println("쫄병 게시물:"+fileList.get(k).getGallary_no());
				String includeno = fileList.get(k).getGallary_no();
				
				if(no.equals(includeno)){
					//System.out.println("쫄병 게시물:"+fileList.get(k).getGallary_no());

					files2.add(fileList.get(k).getF_name());
					//System.out.println("파일 이름 여기야:"+fileList.get(k).getF_name());
				}				
			}
			
			files.add(files2);			
			//게시물 번호로 좋아요 갯수를 가져올꺼야		
			map.put("gallary_no", no);
			int likeCount = likeservice.getLikeCount(map);
			System.out.printf("%s 게실물 , %s 좋아요 갯수 %n",no,likeCount);
			likeList.add(String.valueOf(likeCount));
						
			//게시물 번호로 댓글 수 가져올꺼야			
			int commentCount = commentService.getCommentCount(no);
			System.out.println("댓글수:"+commentCount);
			commentList.add(String.valueOf(commentCount));					
		}
		
		List<Map> totallist = new ArrayList<Map>();
		
		//totalmap.put("test", "test");
		//totallist.add(totalmap);
		for(int j=0;j<boardList.size();j++) {
			Map totalmap = new HashMap();
			totalmap.put("likeCount", likeList.get(j));
			totalmap.put("commentCount", commentList.get(j));
			totalmap.put("boardNum",boardList.get(j).getGallary_no()); //boardNum
			totalmap.put("boardMainPic", files.get(j).get(0));  //메인 사진 name
			
			totallist.add(totalmap);
			
		}
		System.out.println(totallist);
		
				
		return JSONArray.toJSONString(totallist);
	}
	
	
	//list로 보내기
	@RequestMapping("/Gallary/List.do") 
	public String list(@RequestParam Map map,
						HttpServletRequest req,//컨텍스트 루트 얻기용
						Model model) {
		//map은 사실상 필요없는거야
		List<GallaryBoardDTO> boardList= gallaryService.selectBoardList(map);
		List<GallaryFileDTO> fileList = gallaryService.selectFileList(map);
		
		List<String> likeList = new ArrayList<String>();
		List<String> commentList = new ArrayList<String>();
		List<List> files = new ArrayList<List>();
		
		for(int i=0;i<boardList.size();i++) {
			//리스트 크기만큰 for문을 돌면서 번호에 해당하는 파일들을 List에 담아올꺼야
			String no = boardList.get(i).getGallary_no();
			//System.out.println("대장 게시물:"+no);
			List<String> files2 = new ArrayList<String>();

			//파일 리스트 돌면서 일치하는 파일들을 List에 넣을꺼야
			for(int k=0;k<fileList.size();k++) {
				//System.out.println("쫄병 게시물:"+fileList.get(k).getGallary_no());
				String includeno = fileList.get(k).getGallary_no();
				
				if(no.equals(includeno)){
					//System.out.println("쫄병 게시물:"+fileList.get(k).getGallary_no());

					files2.add(fileList.get(k).getF_name());
				}				
			}
			
			files.add(files2);
			
			
			//게시물 번호로 좋아요 갯수를 가져올꺼야
		
			map.put("gallary_no", no);
			int likeCount = likeservice.getLikeCount(map);
			System.out.printf("%s 게실물 , %s 좋아요 갯수 %n",no,likeCount);
			likeList.add(String.valueOf(likeCount));
			
			
			//게시물 번호로 댓글 수 가져올꺼야
			
			int commentCount = commentService.getCommentCount(no);
			System.out.println("댓글수:"+commentCount);
			commentList.add(String.valueOf(commentCount));
			
			
				
				
		}
		System.out.println("게시판 갯수:"+boardList.size());
		System.out.println("게시판 갯수(파일):"+files.size());
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("likeList", likeList);
		model.addAttribute("commentList", commentList);
		
		
		List<Map> fileList3 = new ArrayList<Map>();
		
		
		
		for(int j=0;j<files.size();j++) {
			Map filemap = new HashMap();
			filemap.put("fileSize",files.get(j).size());
			filemap.put("fileName",files.get(j).get(0));
			fileList3.add(filemap);
		}
		model.addAttribute("fileList",fileList3);
		
		
		
		
		
		
		
		return "gallary/List.tiles"; 
	}
	
	@RequestMapping(value="/Gallary/GallaryWrite.do",method = RequestMethod.GET) 
	public String write() {
		return "gallary/Write.tiles"; 
	}//////////////

	
	
	//입력처리]
	@RequestMapping(value="/Gallary/GallaryWrite.do",method = RequestMethod.POST) 
	public String writeOk( 
			@RequestParam("upload") List<MultipartFile> files,
			@RequestParam Map map,
			HttpServletRequest req,
			MultipartHttpServletRequest multipartRequest) throws IllegalStateException, IOException { 
		//서비스 호출] 
		String userID = (String)req.getSession().getAttribute("UserID");
		map.put("userID", userID);//호출전 아이디 맵에 저장
		
		System.out.println("등록성공여부:"+gallaryService.insert(map)); //뷰정보 반환:목록으로 이동 
		
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
		

		String path = req.getServletContext().getRealPath("/upload");
		map.put("f_path", path);//default  
		System.out.println("파일 업로드 컨트롤러");
		
		
		System.out.println("files size:"+files.size());
		for(int i=0;i<files.size();i++) {
			String file_name = files.get(i).getOriginalFilename();
			System.out.println(file_name);
			map.put("f_name", file_name);//default           	
        	File file = new File(path+File.separator+file_name);
        	files.get(i).transferTo(file);						
			gallaryService.insertFile(map);
		}
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
    
    
    //뷰 페이지로 넘길 값들
    @RequestMapping(value="/Gallary/View.do",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String view(@RequestParam Map map,HttpServletRequest req) {
		//서비스 호출]
    	JSONObject obj = new JSONObject();
    	JSONArray array = new JSONArray();
    	
    	
    	System.out.println(map.get("gallary_no"));
		GallaryBoardDTO boardInfo= gallaryService.selectBoardOne(map);
		List<GallaryFileDTO> fileList = gallaryService.selectFileListOne(map);
		System.out.println(boardInfo);
		System.out.println(fileList);
		
		String userID = boardInfo.getUserID();
		map.put("userID", userID);
		MemberDTO userinfo = service.selectOne(map);
		System.out.println(userinfo.getNickname());
		MemberFileDTO userfile = service.selectFile(userID);

		
		//like 유무
		int myLike = likeservice.getMyLike(map);
		System.out.println("나의 라이크:"+myLike);
		
		
		String filenames ="";
		for(int i=0;i<fileList.size();i++) {
			filenames += fileList.get(i).getF_name()+"/";
			System.out.println(filenames);
		}
		obj.put("filenames", filenames); //게시판 사진네임
		obj.put("userk1n0", userinfo.getK1n0()); //유저 카카오 일반 여부
		obj.put("userfile", userfile.getF_name());// 유저 프로필 사진
		obj.put("usernickname", userinfo.getNickname());//user nickname
		obj.put("boardTitle", boardInfo.getTitle());
		obj.put("boardContent", boardInfo.getContent());
		obj.put("boardNo", boardInfo.getGallary_no());
		//System.out.println(boardInfo.getPostDate().toString());
		//Date date = new Date();
		obj.put("myLike", myLike);
		
		obj.put("boardDate", boardInfo.getPostDate().toString());
		
		
		String test ="sfs";
		
		
		userID = (String)req.getSession().getAttribute("UserID");
		map.put("userID", userID);//호출전 아이디 맵에 저장
		
		//scrap 정보 넘기기
		List<GallaryScrapDTO> scrap_ = scrapservice.getScrapCount(map);
		System.out.println(scrap_);
		for(int k=0;k<scrap_.size();k++) {
			String scrapUser = scrap_.get(k).getUserID();
			System.out.println(scrapUser);
			if(userID.equals(scrapUser)) {
				obj.put("myScrap", 1);
				System.out.println("스크립했어");
				break;
			}
			else if(!userID.equals(scrapUser)){
				obj.put("myScrap", 0);
				System.out.println("스크립안했어");
			}
			else if(userID==null) {
				obj.put("myScrap", 0);
				System.out.println("스크립안했어");
			}
				
			
		}
	
		
		
		return obj.toJSONString();
	}/////////////
    
    @ResponseBody
    @RequestMapping(value = "/Gallary/Like/deleteheart.do", method = RequestMethod.POST, produces = "application/json")
    public String deleteheart(@RequestParam Map map,HttpServletRequest req){
		String userID = (String)req.getSession().getAttribute("UserID");
		map.put("userID", userID);
		
		int addcheck = likeservice.deleteLike(map);
		System.out.println("좋아요 추가 확인"+addcheck);
		return "none";
    }

	@ResponseBody
    @RequestMapping(value = "/Gallary/Like/addheart.do", method = RequestMethod.POST, produces = "application/json")
    public String addheart(@RequestParam Map map,HttpServletRequest req){
		String userID = (String)req.getSession().getAttribute("UserID");
		map.put("userID", userID);
		likeservice.insertLike(map);

		return "none";
    }
	////////////스크랩
	@ResponseBody
    @RequestMapping(value = "/Gallary/Scrap/addscrap.do", method = RequestMethod.POST, produces = "application/json")
    public String addscrap(@RequestParam Map map,HttpServletRequest req){
		String userID = (String)req.getSession().getAttribute("UserID");
		map.put("userID", userID);
		
		System.out.println("스크랩 여부:"+scrapservice.insertScrap(map));
	

		return "none";
    }
	
	@ResponseBody
    @RequestMapping(value = "/Gallary/Scrap/deletescrap.do", method = RequestMethod.POST, produces = "application/json")
    public String deletescrap(@RequestParam Map map,HttpServletRequest req){
		String userID = (String)req.getSession().getAttribute("UserID");
		map.put("userID", userID);
		System.out.println("스크랩 여부:"+scrapservice.deleteScrap(map));

		return "none";
    }
	///신고
	@ResponseBody
    @RequestMapping(value = "/Gallary/Dec/insertdec.do", method = RequestMethod.POST, produces = "application/json")
    public String insertdec(@RequestParam Map map,HttpServletRequest req){
		String userID = (String)req.getSession().getAttribute("UserID");
		map.put("userID", userID);
		int dec = decService.insertDec(map);
		System.out.println("신고 접수 여부:"+dec);

		return "none";
    }
	
	
	
	
	

}