package com.kosmo.veve.model.service;

import java.util.List;
import java.util.Map;


public interface NoticeCommentService {
	
	//목록용]
	List<Map> selectList(Map map);
	//입력/수정/삭제용]
	int insert(Map map);
	int delete(Map map);
	int update(Map map);

}
