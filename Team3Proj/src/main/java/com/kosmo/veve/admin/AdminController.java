package com.kosmo.veve.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	

	@RequestMapping("/Admin/TableList.do")
	public String admin_TableList() {
		//뷰정보 반환
		return "admin/TableList.adminTiles";
	}//////////admin_TableList
	
	
	@RequestMapping("/Admin/Notification.do")
	public String admin_Notification() {
		//뷰정보 반환
		return "admin/Notification.adminTiles";
	}//////////admin_Notification
	
	
}
