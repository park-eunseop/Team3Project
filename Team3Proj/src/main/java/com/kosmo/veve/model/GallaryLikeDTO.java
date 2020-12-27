package com.kosmo.veve.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GallaryLikeDTO {
	
	private String notice_no;
	private String userID;
	
	public String getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(String notice_no) {
		this.notice_no = notice_no;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	
}
