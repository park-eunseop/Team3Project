package com.kosmo.veve.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GallaryLikeDTO {
	
	private String gallary_no;
	private String userID;
	
	public String getGallary_no() {
		return gallary_no;
	}
	public void setGallary_no(String gallary_no) {
		this.gallary_no = gallary_no;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	
}
