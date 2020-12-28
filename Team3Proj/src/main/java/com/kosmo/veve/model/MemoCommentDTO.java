package com.kosmo.veve.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MemoCommentDTO {
	
	private String rec_com_no;	
	private String content;
	private String parent;
	private java.sql.Date postDate;
	private String userID;
	private String rec_no;
	
}
