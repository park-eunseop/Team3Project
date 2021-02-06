package com.kosmo.veve.board.recipe;

import java.io.File; 
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.MemberFileDTO;
import com.kosmo.veve.model.RecipeDTO;
import com.kosmo.veve.model.RecipeFileDTO;
import com.kosmo.veve.model.service.MemberService;
import com.kosmo.veve.model.service.RecipeService;


@Controller
public class RecipeController {

   @Resource(name="recipeService")
   private RecipeService recipeService;
   
   //멤버정보 주입 및 가져오기용
   @Resource(name = "memberService")
   private MemberService service;
   
    private static final int RESULT_EXCEED_SIZE = -2;
       private static final int RESULT_UNACCEPTED_EXTENSION = -1;
       private static final int RESULT_SUCCESS = 1;
       private static final long LIMIT_SIZE = 10 * 1024 * 1024;
   
   
   @RequestMapping(value = "/RecipeBBS/write.do", method = RequestMethod.GET)
   public String recipeWrite(Locale locale, Model model) {
   
      return "recipe/RecipeWrite.tiles";
   }
   
   @RequestMapping("/RecipeBBS/view.do")
   public String view(@RequestParam Map map,Model model, HttpServletRequest req) {
      //서비스 호출]
       RecipeDTO recipe= recipeService.selectOne(map);
        List<RecipeFileDTO> recipeFile = recipeService.selectListFile(map);
        
        String userID = recipe.getUserID();
        
        map.put("userID", userID);
        
        //memberDAO메소드 사용) 게시물작성한 유저 정보 &프사 가져올 것
        MemberDTO member = service.selectOne(map);
        MemberFileDTO file= service.selectFile(userID);
        
        //모델에 추가
          model.addAttribute("recipe", recipe);
          model.addAttribute("recipeFile",recipeFile);
          model.addAttribute("member", member);
          model.addAttribute("file", file);
          
      //뷰정보 반환]
      return "recipe/RecipeView.tiles";
   }/////////////
   
      @RequestMapping(value = "/RecipeBBS/write.do", method = RequestMethod.POST)
      public String writeOk(
            @RequestParam("upload") List<MultipartFile> files,
            @RequestParam Map map,
            HttpServletRequest req
            ) throws IllegalStateException, IOException {

         Authentication auth = SecurityContextHolder.getContext().getAuthentication();
         
         map.put("userID",auth.getName());
         
         System.out.println("category:"+map.get("category"));
         
         
         
         
         
         recipeService.insert(map);
         
         
         
         writeFile(files, map, req);
         return "forward:/recipe.do";
      }//////////////
      
      @RequestMapping(value = "/RecipeBBS/writeFile.do", method = RequestMethod.POST)
      public void writeFile(
            @RequestParam("upload") List<MultipartFile> files,
            @RequestParam Map map,
            HttpServletRequest req
            ) throws IllegalStateException, IOException {
         
         Authentication auth = SecurityContextHolder.getContext().getAuthentication();
         
         String path = req.getServletContext().getRealPath("/upload");  //             
         
         for(MultipartFile mf : files) {
            File file = new File(path+"/"+mf.getOriginalFilename()); //   ϻ   

            mf.transferTo(file); 
            map.put("f_path", path);  
            map.put("f_name", mf.getOriginalFilename());
            map.put("userID",auth.getName()); 
            //gallaryService.insert(map);
            recipeService.insertFile(map);
         }
      
       
         //return "gallaryBoard/List";
         //return "forward:/GallaryBoard/BBS/List.do";
      }//////////////
      
      @ResponseBody
       @RequestMapping(value="/upload", method=RequestMethod.POST)
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
       //list
       @RequestMapping("recipe.do") 
       public String list(@RequestParam Map map,
                      HttpServletRequest req,//컨텍스트 루트 얻기용
                      Model model) {
          List<RecipeDTO> boardList= recipeService.selectList(map);
          List<RecipeFileDTO> fileList = recipeService.selectListFile(map);
          //데이타 저장]
          String path=req.getContextPath();
          model.addAttribute("boardList", boardList);
          model.addAttribute("fileList",fileList);
          
          return "recipe/RecipeBBS.tiles"; 
       }
       
       @RequestMapping("/RecipeBBS/edit.do")
      public String edit(HttpServletRequest req,@RequestParam Map map) {
         if(req.getMethod().equals("GET")) {//수정폼으로 이동
            //서비스 호출]
            RecipeDTO recipe =recipeService.selectOne(map);
            List<RecipeFileDTO> recipeFile = recipeService.selectListFile(map);
            //데이타 저장]
             req.setAttribute("recipe", recipe);
              req.setAttribute("recipeFile",recipeFile);
            //수정 폼으로 이동]
            return "recipe/RecipeEdit.tiles";
         }
         //수정처리후 상세보기로 이동
         //서비스 호출
         recipeService.update(map);
         //뷰로 포워드
         return "forward:/RecipeBBS/view.do";
      }////////////////
      //삭제처리]
      @RequestMapping("/RecipeBBS/delete.do")
      public String delete(@RequestParam Map map) {
         //서비스 호출
         recipeService.delete(map);
         //뷰정보 반환]
         return "forward:/recipe.do";
      }////////////
      
      @RequestMapping("/RecipeBBS/deleteFile.do")
      public String deleteFile(@RequestParam Map map) {
         //서비스 호출
         recipeService.deleteFile(map);
         //뷰정보 반환]
         return "forward:/RecipeBBS/write.do";
      }////////////
}