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