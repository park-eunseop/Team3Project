package com.kosmo.veve.member;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kosmo.veve.model.GallaryBoardDAO;
import com.kosmo.veve.model.GallaryBoardDTO;
import com.kosmo.veve.model.GallaryCommentDAO;
import com.kosmo.veve.model.GallaryCommentDTO;
import com.kosmo.veve.model.GallaryFileDTO;
import com.kosmo.veve.model.GallaryLikeDAO;
import com.kosmo.veve.model.GallaryLikeDTO;
import com.kosmo.veve.model.GallaryScrapDAO;
import com.kosmo.veve.model.GallaryScrapDTO;
import com.kosmo.veve.model.MemberDAO;
import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.MemberFileDTO;
import com.kosmo.veve.model.MemberFollowDTO;
import com.kosmo.veve.model.service.GallaryBoardService;
import com.kosmo.veve.model.service.GallaryCommentService;
import com.kosmo.veve.model.service.MemberService;


@org.springframework.web.bind.annotation.RestController
public class RestController {
   
   @Resource(name = "memberService")
   private MemberService service;
   
   @Resource(name = "gallaryService")
   private GallaryBoardService gallaryService;
   
   @Resource(name = "galcommentService")
   private GallaryCommentService commentService;
   
   //[안드로이드 앱에 데이타 제공용 추가]
   @Resource(name = "memberDAO")
   private MemberDAO memberDao;
   
   @Resource(name = "gallaryBoardDAO")
   private GallaryBoardDAO gallaryDao;
   
   @Resource(name = "gallaryLikeDAO")
   private GallaryLikeDAO gallaryLikeDao;
   
   @Resource(name = "gallaryScrapDAO")
   private GallaryScrapDAO gallaryScrapDao;
         
   
   @Resource(name = "gallaryCommentDAO")
   private GallaryCommentDAO commentDao;
   
   @CrossOrigin
   @GetMapping(value = "/member/json")
   public MemberDTO ismemberJsonByGet(MemberDTO member)  {
      return memberDao.isLogin(member);
   }
   
   @CrossOrigin
   @PostMapping(value = "/member/json")
   public MemberDTO ismemberJsonByPost(MemberDTO member) {
      return memberDao.isLogin(member);
   }
   
   private String url = "http://192.168.0.141:8080/veve/upload/";
   //private String url = "http://192.168.45.139:8080/veve/upload/";
   //private String url = "http://172.20.10.2:8080/veve/upload/";
   
   @CrossOrigin
   @GetMapping(value = "/member/idcheck")
   public boolean idCheckJsonByGet(String userID)  {
      return memberDao.idCheck(userID);
   }
   
   @CrossOrigin
   @PostMapping(value = "/member/idcheck")
   public boolean idCheckJsonByPost(String userID) {
      return memberDao.idCheck(userID);
   }
   
   
   @PostMapping(value = "/fcm")
   public String fcmToken() {
      return "fcm/PushToPhone.jsp";
   }
   
   /*
    * @SuppressWarnings("unchecked")
    * 
    * @ResponseBody
    * 
    * @RequestMapping("/member/idcheck") public JSONObject idCheck(@RequestParam
    * Map map,HttpServletRequest req) { JSONObject jsonMain = new JSONObject();
    * 
    * String userId = req.getParameter("userID");
    * 
    * String result = String.valueOf(memberDao.idCheck(userId));
    * 
    * JSONArray jArray = new JSONArray(); for (int i = 0; i < 1; i++) { JSONObject
    * row = new JSONObject();
    * 
    * row.put("result", result);
    * 
    * jArray.add(i, row); }
    * 
    * jsonMain.put("sendData", jArray); return jsonMain; }
    */
   
   @CrossOrigin
   @RequestMapping(value = "/member/signUp",method=RequestMethod.POST)
   public int SignUpJson(
                    HttpServletRequest req,
                    @RequestPart MultipartFile upload) throws IllegalStateException, IOException {
      String userID = req.getParameter("userID");
      String password = req.getParameter("password");
      String name = req.getParameter("name");
      String gender = req.getParameter("gender");
      String nickname = req.getParameter("name");
      String vg_level = req.getParameter("vg_level");
      String age = req.getParameter("age");
      String addr = req.getParameter("addr");
      String selfIntro = req.getParameter("selfintro");
      String k1n0 = req.getParameter("k1n0");
      
      //1]서버의 물리적 경로 얻기
      String path = req.getSession().getServletContext().getRealPath("/upload");
      //2]File객체 생성   
      File file = new File(path+File.separator+upload.getOriginalFilename());
      
      upload.transferTo(file);  //업로드
      
      MemberFileDTO memberFileDto = new MemberFileDTO();
      memberFileDto.setUserID(userID);
      memberFileDto.setF_path(path);
      memberFileDto.setF_name(upload.getOriginalFilename());
      
      MemberDTO memberdto = new MemberDTO();
      memberdto.setUserID(userID);
      memberdto.setPassword(password);
      memberdto.setName(name);
      memberdto.setGender(gender);
      memberdto.setNickname(nickname);
      memberdto.setVg_level(vg_level);
      memberdto.setAge(age);
      memberdto.setAddr(addr);
      memberdto.setSelfintro(selfIntro);
      memberdto.setK1n0(k1n0);
      
      memberDao.signUp(memberdto);
      
      return memberDao.signUpFile(memberFileDto);
   }
   
   @CrossOrigin
   @RequestMapping(value = "/member/update",method=RequestMethod.POST)
   public int UpdateToJson(
                    HttpServletRequest req,
                    @RequestPart MultipartFile upload) throws IllegalStateException, IOException {
      String userID = req.getParameter("userID");
      String password = req.getParameter("password");
      String name = req.getParameter("nickname");
      //1]서버의 물리적 경로 얻기
      String path = req.getSession().getServletContext().getRealPath("/upload");
      //2]File객체 생성   
      File file = new File(path+File.separator+upload.getOriginalFilename());
      
      upload.transferTo(file);  //업로드
      
      MemberFileDTO memberFileDto = new MemberFileDTO();
      memberFileDto.setUserID(userID);
      memberFileDto.setF_path(path);
      memberFileDto.setF_name(upload.getOriginalFilename());
      
      MemberDTO memberdto = new MemberDTO();
      memberdto.setUserID(userID);
      memberdto.setPassword(password);
      memberdto.setName(name);
      
      memberDao.memberFileUpdate(memberFileDto);
      return memberDao.memberInfoupdate(memberdto);
   }
   
   @CrossOrigin
   @RequestMapping(value = "/member/signUpKakao",method=RequestMethod.POST)
   public int SignUpJsonKakao(
                    HttpServletRequest req,Map map
                    ) throws IllegalStateException, IOException {
      String userID = req.getParameter("userID");
      String password = req.getParameter("password");
      String name = req.getParameter("name");
      String gender = req.getParameter("gender");
      String nickname = req.getParameter("name");
      String vg_level = req.getParameter("vg_level");
      String age = req.getParameter("age");
      String addr = req.getParameter("addr");
      String selfIntro = req.getParameter("selfintro");
      String k1n0 = req.getParameter("k1n0");
      
      String path = req.getSession().getServletContext().getRealPath("/upload");
      String f_name = req.getParameter("f_name");
      
      //File file = new File(f_path+File.separator+f_name); //파일생성
      //upload.transferTo(file);  //업로드
      
      map.put("userID", userID);
      map.put("password", password);
      map.put("name", name);
      map.put("gender", gender);
      map.put("nickname", nickname);
      map.put("vg_level", vg_level);
      map.put("age", age);
      map.put("addr", addr);
      map.put("editordata",selfIntro);
      map.put("k1n0", k1n0);
      map.put("f_path", "http");
      map.put("f_name",f_name);
      
      return service.kakoinsert(map);
   }
   
   @CrossOrigin
   @RequestMapping(value = "/gallary/post",method=RequestMethod.POST)
   public int gallaryPostJson(GallaryBoardDTO board,
                    HttpServletRequest req,
                    @RequestPart MultipartFile upload) throws IllegalStateException, IOException {
      String userID = req.getParameter("userID");
      String title = req.getParameter("title");
      String content = req.getParameter("content");
      //String postdate = req.getParameter("postdate");
      //java.util.Date postdate = new java.util.Date();
      
      //1]서버의 물리적 경로 얻기
      String path = req.getSession().getServletContext().getRealPath("/upload");
      //2]File객체 생성   
      File file = new File(path+File.separator+upload.getOriginalFilename());
      upload.transferTo(file);  
      
      GallaryFileDTO fileDTO = new GallaryFileDTO();
      fileDTO.setF_path(path);
      fileDTO.setF_name(upload.getOriginalFilename());
      fileDTO.setUserID(userID);
      
      GallaryBoardDTO boardDTO = new GallaryBoardDTO();
      boardDTO.setUserID(userID);
      boardDTO.setTitle(title);
      boardDTO.setContent(content);
      //boardDTO.setPostDate(postdate);
      
      gallaryDao.post(board);
      return gallaryDao.postFile(fileDTO);
   }
   
   @SuppressWarnings("unchecked")
      @ResponseBody
      @RequestMapping("/myfeed") 
      public JSONObject myFeed(@RequestParam Map map,HttpServletRequest req) {
         JSONObject jsonMain = new JSONObject();

         String userId = req.getParameter("userID");
         
         MemberFileDTO profileImage = gallaryService.getProfileImage(map);
         
         JSONArray jArray = new JSONArray();
         for (int i = 0; i < 1; i++) {
            String file;
            if(userId.contains("@")) {
               file =profileImage.getF_name();
            }else {
               file =url+profileImage.getF_name();
            }
            JSONObject row = new JSONObject();
            
            row.put("f_name", file);   
            
            jArray.add(i, row);
         }

         jsonMain.put("sendData", jArray);
         return jsonMain;
      }

   
   @SuppressWarnings("unchecked")
   @ResponseBody
   @RequestMapping("/gallary/androidList") 
   public JSONObject androidlist(@RequestParam Map map) {
      JSONObject jsonMain = new JSONObject();

      List<GallaryBoardDTO> gallaryDTO= gallaryService.selectAllList(map);
      List<GallaryFileDTO> gallaryFileDTO = gallaryService.selectFileLists(map);
      
      JSONArray jArray = new JSONArray();
      for (int i = 0; i < gallaryDTO.size(); i++) {
         String file =url+gallaryFileDTO.get(i).getF_name();
         JSONObject row = new JSONObject();
         row.put("gallary_no",gallaryDTO.get(i).getGallary_no());
         row.put("userId", gallaryDTO.get(i).getUserID());
         row.put("f_name", file);
         row.put("visitCount",gallaryDTO.get(i).getVisitCount());
         row.put("scrapCount", gallaryDTO.get(i).getScrapCount());
         row.put("title", gallaryDTO.get(i).getTitle());
         row.put("content", gallaryDTO.get(i).getContent());
         row.put("postDate", gallaryDTO.get(i).getPostDate());

         
         jArray.add(i, row);
      }

      jsonMain.put("sendData", jArray);
      return jsonMain;
   }
   
   @CrossOrigin
   @RequestMapping(value = "/Gallary/heart",method=RequestMethod.POST)
   public String GallaryLikeJson(
                    HttpServletRequest req) throws IllegalStateException, IOException {
     
      String heartcheck = req.getParameter("heartcheck");
      String userID = req.getParameter("userID");
      String gallary_no = req.getParameter("gallary_no");
      
      GallaryLikeDTO glDTO = new GallaryLikeDTO();
      
      glDTO.setUserID(userID);
      glDTO.setGallary_no(gallary_no);
      
      if(heartcheck.equalsIgnoreCase("true")) {
         gallaryLikeDao.insertLikeAR(glDTO);
         heartcheck="false";
      }   
      else {
         gallaryLikeDao.deleteLikeAR(glDTO);
         heartcheck="true";
      }
      
      return heartcheck;   
   
   }

   
   @CrossOrigin
   @RequestMapping(value = "/Gallary/Scrap",method=RequestMethod.POST)
   public String scrap(
                    HttpServletRequest req) throws IllegalStateException, IOException {
     
      String scrapcheck = req.getParameter("scrapCheck");
      String userID = req.getParameter("userID");
      String gallary_no = req.getParameter("gallary_no");
      
      GallaryScrapDTO gsDTO = new GallaryScrapDTO();
      
      gsDTO.setUserID(userID);
      gsDTO.setGallary_no(gallary_no);
      
      if(scrapcheck.equalsIgnoreCase("true")) {
         gallaryScrapDao.insertScrapAR(gsDTO);
         scrapcheck="false";
      }   
      else {
         gallaryScrapDao.deleteScrapAR(gsDTO);
         scrapcheck="true";
      }
      
      return scrapcheck;   
   
   }
   
   @SuppressWarnings("unchecked")
   @ResponseBody
   @RequestMapping("/mypage") 
   public JSONObject myPage(@RequestParam Map map,HttpServletRequest req) {
      JSONObject jsonMain = new JSONObject();

      String userId = req.getParameter("userID");
      
      int postCount= gallaryService.getPostCount(map);
      int followCount = gallaryService.getFollowCount(map);
      int followingCount = gallaryService.getFollowingCount(map);
      MemberFileDTO profileImage = gallaryService.getProfileImage(map);
      
      JSONArray jArray = new JSONArray();
      for (int i = 0; i < 1; i++) {
         String file;
         if(userId.contains("@")) {
            file =profileImage.getF_name();
         }else {
            file =url+profileImage.getF_name();
         }
         JSONObject row = new JSONObject();
         
         row.put("postCount", postCount);
         row.put("followCount", followCount);
         row.put("followingCount", followingCount);
         row.put("f_name", file);   
         
         jArray.add(i, row);
      }

      jsonMain.put("sendData", jArray);
      return jsonMain;
   }
   
   @SuppressWarnings("unchecked")
   @ResponseBody
   @RequestMapping("/mypage/followList") 
   public JSONObject myPageFollowList(@RequestParam Map map,HttpServletRequest req) {
      JSONObject jsonMain = new JSONObject();

      String userId = req.getParameter("userID");
      
      List<MemberFollowDTO> memberFollowDTO= memberDao.androidFollowInfo(map);
      List<MemberFileDTO> memberFileDTO = memberDao.androidFollowFile(map);
      
      JSONArray jArray = new JSONArray();
      for (int i = 0; i < memberFollowDTO.size(); i++) {
         String file;
         if(memberFollowDTO.get(i).getUserID().contains("@")) {
            file =memberFileDTO.get(i).getF_name();
         }else {
            file =url+memberFileDTO.get(i).getF_name();
         }
         JSONObject row = new JSONObject();
         
         row.put("userID", memberFollowDTO.get(i).getUserID());
         row.put("f_name", file);   
         
         jArray.add(i, row);
      }

      jsonMain.put("sendData", jArray);
      return jsonMain;
   }
   
   @SuppressWarnings("unchecked")
   @ResponseBody
   @RequestMapping("/mypage/followingList") 
   public JSONObject myPageFollowingList(@RequestParam Map map,HttpServletRequest req) {
      JSONObject jsonMain = new JSONObject();

      String userId = req.getParameter("userID");
      
      List<MemberFollowDTO> memberFollowDTO= memberDao.androidFollowingInfo(map);
      List<MemberFileDTO> memberFileDTO = memberDao.androidFollowingFile(map);
      
      JSONArray jArray = new JSONArray();
      for (int i = 0; i < memberFollowDTO.size(); i++) {
         String file;
         if(memberFollowDTO.get(i).getOtherID().contains("@")) {
            file =memberFileDTO.get(i).getF_name();
         }else {
            file =url+memberFileDTO.get(i).getF_name();
         }
         JSONObject row = new JSONObject();
         
         row.put("userID", memberFollowDTO.get(i).getOtherID());
         row.put("f_name", file);   
         
         jArray.add(i, row);
      }

      jsonMain.put("sendData", jArray);
      return jsonMain;
   }
   
   
   
   @SuppressWarnings("unchecked")
   @ResponseBody
   @RequestMapping("/mypage/list") 
   public JSONObject myPageList(@RequestParam Map map,HttpServletRequest req) {
      JSONObject jsonMain = new JSONObject();

      String userId = req.getParameter("userID");
      
      List<GallaryBoardDTO> gallaryDTO= gallaryService.selectMyList(map);
      List<GallaryFileDTO> gallaryFileDTO = gallaryService.selectMyFileLists(map);
      
      JSONArray jArray = new JSONArray();
      for (int i = 0; i < gallaryDTO.size(); i++) {
        String file =url+gallaryFileDTO.get(i).getF_name();
        JSONObject row = new JSONObject();
         
        row.put("gallary_no",gallaryDTO.get(i).getGallary_no());
        row.put("userID", gallaryDTO.get(i).getUserID());
        row.put("title", gallaryDTO.get(i).getTitle());
        row.put("content", gallaryDTO.get(i).getContent());
        row.put("postDate", gallaryDTO.get(i).getPostDate());
        row.put("f_name", file);   
         
         jArray.add(i, row);
      }

      jsonMain.put("sendData", jArray);
      return jsonMain;
   }
   
   @SuppressWarnings("unchecked")
   @ResponseBody
   @RequestMapping("/mypage/scrapList") 
   public JSONObject myPageScrapList(@RequestParam Map map,HttpServletRequest req) {
      JSONObject jsonMain = new JSONObject();

      String userId = req.getParameter("userID");
      
      List<GallaryBoardDTO> gallaryDTO= gallaryService.selectMyScrapList(map);
      List<GallaryFileDTO> gallaryFileDTO = gallaryService.selectMyScrapLists(map);
      
      JSONArray jArray = new JSONArray();
      for (int i = 0; i < gallaryDTO.size(); i++) {
         String file =url+gallaryFileDTO.get(i).getF_name();
        JSONObject row = new JSONObject();
         
        row.put("gallary_no",gallaryDTO.get(i).getGallary_no());
         row.put("userID", gallaryDTO.get(i).getUserID());
         row.put("title", gallaryDTO.get(i).getTitle());
         row.put("content", gallaryDTO.get(i).getContent());
         row.put("postDate", gallaryDTO.get(i).getPostDate());
         row.put("f_name", file);  

         jArray.add(i, row);
      }

      jsonMain.put("sendData", jArray);
      return jsonMain;
   }
   
   @GetMapping(value = "/gallary/delete")
   public int gallaryDeleteJsonGet(HttpServletRequest req) {
      String gallary_no = req.getParameter("gallary_no");
      
      return gallaryDao.delete(gallary_no);
   }

   @PostMapping(value = "/gallary/delete")
   public int gallaryDeleteJsonPost(HttpServletRequest req) {
      String gallary_no = req.getParameter("gallary_no");
      
      return gallaryDao.delete(gallary_no);
   }
   
   @CrossOrigin
   @RequestMapping(value = "/gallary/update",method=RequestMethod.POST)
   public int gallaryUpdate(GallaryBoardDTO board,
                    HttpServletRequest req,
                    @RequestPart MultipartFile upload) throws IllegalStateException, IOException {
         String gallary_no = req.getParameter("gallary_no");
      String userID = req.getParameter("userID");
      String title = req.getParameter("title");
      String content = req.getParameter("content");
      //String postdate = req.getParameter("postdate");
      //java.util.Date postdate = new java.util.Date();
      
      //1]서버의 물리적 경로 얻기
      String path = req.getSession().getServletContext().getRealPath("/upload");
      //2]File객체 생성   
      File file = new File(path+File.separator+upload.getOriginalFilename());
      upload.transferTo(file);  
      
      GallaryFileDTO fileDTO = new GallaryFileDTO();
      fileDTO.setGallary_no(gallary_no);
      fileDTO.setF_path(path);
      fileDTO.setF_name(upload.getOriginalFilename());
      //fileDTO.setUserID(userID);
      
      GallaryBoardDTO boardDTO = new GallaryBoardDTO();
      //boardDTO.setUserID(userID);
      boardDTO.setGallary_no(gallary_no);
      boardDTO.setTitle(title);
      boardDTO.setContent(content);
      //boardDTO.setPostDate(postdate);
      
      gallaryDao.update(board);
      return gallaryDao.updateFile(fileDTO);
   }
   
   @SuppressWarnings("unchecked")
   @ResponseBody
    @RequestMapping("/gallary/comment") 
   public JSONObject androidComment(HttpServletRequest req,@RequestParam Map map) {
       JSONObject jsonMain = new JSONObject();
       JSONArray jArray = new JSONArray();
       //String userID = req.getParameter("userID");
       String gallary_no = req.getParameter("gallary_no");
       
      GallaryBoardDTO gallaryDTO= gallaryService.selectBoardOne(map);
      //List<GallaryFileDTO> gallaryFileDTO = gallaryService.selectFileLists(map);
      List<GallaryCommentDTO> gallaryCommentDTO = commentService.selectCommentList(map);
      List<MemberFileDTO> memberFileDTO = memberDao.androidCommentUserFile(map);
      //MemberFileDTO profileImage = gallaryService.getProfileImage(map);
          
      for (int i = 0; i < gallaryCommentDTO.size(); i++) {
         String file =url+memberFileDTO.get(i).getF_name();
         JSONObject row = new JSONObject();
         row.put("gallary_no",gallary_no);
         row.put("userID", gallaryCommentDTO.get(i).getUserID());
         row.put("f_name", file);   
         row.put("content", gallaryCommentDTO.get(i).getContent());
         row.put("postdate", gallaryCommentDTO.get(i).getPostDate());
        
         jArray.add(i,row);
      }
      
      jsonMain.put("sendData", jArray);
      return jsonMain;
   }
   
      @CrossOrigin
   @RequestMapping(value = "/gallary/commentPost",method=RequestMethod.POST)
   public int gallaryCommentPostJson(GallaryCommentDTO board,
                    HttpServletRequest req) throws IllegalStateException, IOException {
      String gallary_no = req.getParameter("gallary_no");
         String userID = req.getParameter("userID");
      String content = req.getParameter("content");
      //java.util.Date postdate = new java.util.Date();
      
      GallaryCommentDTO commentDTO = new GallaryCommentDTO();
      commentDTO.setGallary_no(gallary_no);
      commentDTO.setUserID(userID);
      commentDTO.setContent(content);
      //boardDTO.setPostDate(postdate);
      
      return commentDao.insertAR(commentDTO);
   }
      
      @CrossOrigin
   @RequestMapping(value = "/member/follow",method=RequestMethod.POST)
   public int followPostJson(HttpServletRequest req) throws IllegalStateException, IOException {
      
         String userID = req.getParameter("userID");
      String otherID = req.getParameter("otherID");
      
      MemberFollowDTO followDTO = new MemberFollowDTO();
      followDTO.setUserID(otherID);
      followDTO.setOtherID(userID);
      
      return memberDao.insertFollowAR(followDTO);
   }
   
}