package com.kosmo.veve.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class RecipeDTO {
	
	private String res_no;	
	private String title;
	private java.sql.Date postDate;
	private String content;
	private String visitcount;
	private String userID;
	public String getRes_no() {
		return res_no;
	}
	public void setRes_no(String res_no) {
		this.res_no = res_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public java.sql.Date getPostDate() {
		return postDate;
	}
	public void setPostdate(java.sql.Date postDate) {
		this.postDate = postDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
}
