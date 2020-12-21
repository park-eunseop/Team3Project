package com.kosmo.veve.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	

	

	
	@RequestMapping("/Admin/Notification.do")
	public String admin_Notification() {

		return "admin/Notification.adminTiles";
	}//////////admin_Notification
	
	
}
