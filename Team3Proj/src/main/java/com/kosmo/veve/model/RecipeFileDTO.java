package com.kosmo.veve.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class RecipeFileDTO {
	
	private String notice_file_no;	
	private String f_path;
	private String f_name;
	private String userID;
	private String res_no;
	public String getNotice_file_no() {
		return notice_file_no;
	}
	public void setNotice_file_no(String notice_file_no) {
		this.notice_file_no = notice_file_no;
	}
	public String getF_path() {
		return f_path;
	}
	public void setF_path(String f_path) {
		this.f_path = f_path;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getRes_no() {
		return res_no;
	}
	public void setRes_no(String res_no) {
		this.res_no = res_no;
	}
	
}
