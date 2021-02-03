package com.kosmo.veve.model;

import java.util.List;

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
	private String visitCount;//방문자수
	
	private String userID;//아이디
	//private String commentCount;//각 글에 따른 댓글 총수 출력용
	private List<NoticeCommentDTO> comments;
	
}
