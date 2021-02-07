package com.kosmo.veve.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GallaryBoardDTO {
	
	private String gallary_no;	
	private String title;
	private String content;
	private java.sql.Date postDate;
	private String userID;	
	private String visitCount;
	private String scrapCount;
	
	public GallaryBoardDTO() {
		
	}
	
	public String getGallary_no() {
		return gallary_no;
	}
	public void setGallary_no(String gallary_no) {
		this.gallary_no = gallary_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public java.sql.Date getPostDate() {
		return postDate;
	}
	public void setPostDate(java.sql.Date postDate) {
		this.postDate = postDate;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getVisitCount() {
		return visitCount;
	}
	public void setVisitCount(String visitCount) {
		this.visitCount = visitCount;
	}

}
