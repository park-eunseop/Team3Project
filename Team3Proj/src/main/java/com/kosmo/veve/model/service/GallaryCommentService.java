package com.kosmo.veve.model.service;

import java.util.List;
import java.util.Map;

import com.kosmo.veve.model.GallaryCommentDTO;

public interface GallaryCommentService {
	//목록용]
	//레코드를 DTO가 아닌 맵에 담아보자.
	List<Map> selectList(Map map);
	//입력/수정/삭제]
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
	
	//게시물에 따른 총 댓글 수 가져오기
	int getCommentCount(String gallary_no);
	
	
	////
	List<GallaryCommentDTO> selectCommentList(Map map);
	   
	   int insertAR(GallaryCommentDTO commentDTO);
}
