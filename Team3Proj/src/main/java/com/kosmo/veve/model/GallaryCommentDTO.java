package com.kosmo.veve.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GallaryCommentDTO {
	
	private String gallary_com_no;   
	private String content;
	private String parent;
	private java.sql.Date postDate;
	private String userID;
	private String gallary_no;

}
