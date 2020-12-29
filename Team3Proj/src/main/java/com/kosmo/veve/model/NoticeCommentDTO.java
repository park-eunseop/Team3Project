package com.kosmo.veve.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class NoticeCommentDTO {

	private String notice_com_no;
	private String content;
	private String patent;
	private java.sql.Date postDate;
	
}
