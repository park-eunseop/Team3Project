package com.kosmo.veve.board.gallary;

import java.util.List; 
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosmo.veve.model.service.GallaryCommentService;

@SessionAttributes({"userID"})
@Controller
@RequestMapping("/Gallary/Comment/")
public class GallaryCommentController {
	
   @Resource(name="galcommentService")
   private GallaryCommentService commentService;
   
   @RequestMapping(value="write.do",produces = "text/html; charset=UTF-8")
   @ResponseBody
   public String write(
         @RequestParam Map map) {
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      map.put("userID", auth.getName());
      commentService.insert(map);
      return map.get("notice_no").toString();
   }/////////////////
   
   @ResponseBody
   @RequestMapping(value="list.do",produces = "text/html; charset=UTF-8")
   public String list(@RequestParam Map map) {
      List<Map> list=commentService.selectList(map);
      System.out.println(JSONArray.toJSONString(list));
      for(Map comment:list)
         comment.put("POSTDATE", comment.get("POSTDATE").toString().substring(0,10));
      return JSONArray.toJSONString(list);
   }////////////
   
   @ResponseBody
   @RequestMapping(value="edit.do",produces = "text/html; charset=UTF-8")
   public String update(@RequestParam Map map) {
      commentService.update(map);
      return String.format("%s : %s",map.get("res_no").toString(),map.get("notice_com_no").toString());
      
   }
   @ResponseBody
   @RequestMapping(value="delete.do",produces = "text/html; charset=UTF-8")
   public String delete(@RequestParam Map map) {
      commentService.delete(map);
      return String.format("%s",map.get("notice_com_no").toString());
   }
   
}///////////////
