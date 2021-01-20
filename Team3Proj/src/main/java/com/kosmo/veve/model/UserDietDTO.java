package com.kosmo.veve.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class UserDietDTO {
	
	private String diet_no;
	private String eatDate;
	private String userID;
	private String protein;
	private String vitB12;
	private String vitD;
	private String zinc;
	private String calcium;
	
	
}
