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

	//admin에서 총 게시글, 댓글 수를 위한 변수
	private String writtenPostCount;
	private String writtenCommentCount;
	
}
