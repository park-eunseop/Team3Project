package com.kosmo.veve.admin;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.MemberServiceImpl;

@Controller
public class AdminController {
   
   //서비스 주입]
   @Resource(name="memberService")
   private MemberServiceImpl memberService;

   
   @RequestMapping("/Admin/MemberInfo.do")
   public String admin_MemberInfo(Model model) {
      List<MemberDTO> list = memberService.selectList_admin();
      model.addAttribute("list", list);
      return "admin/MemberInfo.adminTiles";
   }//////////admin_MemberInfo
   
   
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