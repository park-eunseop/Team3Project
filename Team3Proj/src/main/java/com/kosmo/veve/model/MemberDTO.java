package com.kosmo.veve.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MemberDTO {
	
	private String userID;
	private String password;
	private String nickname;
	private String gender;
	private String name;
	private String age;
	private String addr;
	private String vg_level;
	private String selfintro;

}
