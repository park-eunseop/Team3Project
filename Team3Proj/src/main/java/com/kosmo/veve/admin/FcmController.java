package com.kosmo.veve.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FcmController {

   @GetMapping(value ="/Admin/fcm.do")
   public String getToken(HttpServletRequest req) {
      
      System.out.println(req.getParameter("token"));
      
      return "fcm/RegisterToken";
   }
   
   @PostMapping(value ="/Admin/fcm.do")
   public String postToken(HttpServletRequest req) {
      
      System.out.println(req.getParameter("token"));
      
      return "fcm/RegisterToken";
   }
   
   @GetMapping(value ="/Admin/Main.do")
   public String getMessage() {
      
      return "admin/AdminMain.adminTiles";
   }
   
   @PostMapping(value ="/Admin/Main.do")
   public String postMessage() {
      
      return "admin/AdminMain.adminTiles";
   }
   
   @RequestMapping(value = "/Admin/fcmPostToAndroid.do")
   public String postToAndroid() {
      return "fcm/PushToPhone";
   }
   
}