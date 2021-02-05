package com.kosmo.veve.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class RecipeDTO {
	
	   private String rec_no;   
	   private String title;
	   private java.sql.Date postDate;
	   private String content;
	   private String visitcount;
	   private String userID;
	   private String vg_level;
	   private String category;
	   private String difficulty;
	   private String cooktime;
	   private String ingredients;
	   private String tools;
}
