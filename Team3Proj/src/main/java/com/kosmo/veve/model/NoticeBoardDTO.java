package com.kosmo.veve.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class NoticeBoardDTO {
	
	private String notice_no;
	private String title;
	private String content;
	private String postDate;
	private String visitCount;
	
	private String userID;
	
}
