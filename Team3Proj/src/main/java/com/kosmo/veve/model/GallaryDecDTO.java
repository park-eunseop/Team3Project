package com.kosmo.veve.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class GallaryDecDTO {

	private String content;
	private String userID;
	private String gallary_no;
	private Date postDate;
	
	

}
