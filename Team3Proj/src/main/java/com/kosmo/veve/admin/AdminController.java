package com.kosmo.veve.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.veve.model.GallaryBoardDTO;
import com.kosmo.veve.model.GallaryDecDTO;
import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.MemberServiceImpl;
import com.kosmo.veve.model.service.AdminReportedService;
import com.kosmo.veve.model.service.GallaryBoardService;

@Controller
public class AdminController {
   
   @Resource(name="memberService")
   private MemberServiceImpl memberService;
   
   @Resource(name="adminReportedDAO") 
   private AdminReportedService reportedService;   
   
   @Resource(name="gallaryService") 
   private GallaryBoardService gallaryService;
   
   
   @RequestMapping("/Admin/PostManagement.do")
   public String admin_PostManagement() {
      return "admin/PostManagement.adminTiles";
   }//////////admin_PostManagement
   
   
   
   @RequestMapping("/Admin/ReportedPost.do")
   public String admin_ReportedPost(Model model) {
 //신고 정보 넘기기
	   
	   List<GallaryDecDTO> grlist =  reportedService.getGalReList();
	   System.out.println(grlist);
	   Map map = new HashMap();
	   

	   List<Map> list = new ArrayList<Map>();
	   //map에 담을 정보 //1.게시글 제목 2.글쓴이3.신고자4.신고일자신고내용
	  ////1.리스트를 돌면서 갤러리 번호를 통해 게시물 정보를 가져와
	   for(int i=0;i<grlist.size();i++) {
		   Map map2 = new HashMap();
		   String gallary_no = grlist.get(i).getGallary_no();
		   System.out.println("gal_no:"+gallary_no);
		   map.put("gallary_no",gallary_no);
		   GallaryBoardDTO dto =  gallaryService.selectBoardOneByNo(map);
		   System.out.println(dto);
		   map2.put("board_title",dto.getTitle());
		   map2.put("board_writer",dto.getUserID());
		   map2.put("board_reporter",grlist.get(i).getUserID());
		   map2.put("board_date",grlist.get(i).getPostDate());
		   System.out.println(grlist.get(i).getPostDate());
		   map2.put("board_content",grlist.get(i).getContent());
		   System.out.println(map2);
		   list.add(map2);
		   
	   }
	   
	   System.out.println("list:"+list);
	   model.addAttribute("list",list); 
	   
	   
	   
	   Date nowDate = new Date();
	   System.out.println("포맷 지정 전 : " + nowDate);
	   SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy/MM"); // 원하는 데이터 포맷 지정
	   String strNowDate = simpleDateFormat.format(nowDate);
	   System.out.println("포맷 지정 후 : " + strNowDate);
	   map.put("postDate", strNowDate);
	   int month5 = reportedService.getMonthReported(map);
	   System.out.println("2월신고:"+month5);
	   model.addAttribute("month5", month5);
	   
	   Calendar mon = Calendar.getInstance();
	   String beforeMonth ="";
	   int num =4;
	   for(int k=0;k<4;k++){
		   mon.add(Calendar.MONTH , -1);
		   beforeMonth = new java.text.SimpleDateFormat("yy/MM").format(mon.getTime());
		   System.out.println(beforeMonth);
		   map.put("postDate", beforeMonth);
		   month5 = reportedService.getMonthReported(map);
		   model.addAttribute("month"+num, month5);		   
		   num--;
	   }
	   

	   
      return "admin/ReportedPost.adminTiles";
   }//////////admin_ReportedPost
   
   
   @RequestMapping("/Admin/ReportedPostList.do")
   public String admin_ReportedPostList(Model model) {
	  
	   
	   
	   
      return "admin/ReportedPostList";
   }//////////admin_ReportedPostList

   
   
   @RequestMapping("/Admin/Notification.do")
   public String admin_Notification() {
      return "admin/Notification.adminTiles";
   }//////////admin_Notification
   
   
   
}