package com.kosmo.veve.model.service;

import java.util.List;
import java.util.Map;

import com.kosmo.veve.model.NoticeBoardDTO;
import com.kosmo.veve.model.NoticeFileDTO;


public interface NoticeBoardService {
	//목록용]
	List<NoticeBoardDTO> selectList(Map map);
	//전체 레코드 수]
	int getTotalRecord();
	//상세보기용]
	NoticeBoardDTO selectOne(Map map);
	//입력/수정/삭제용]
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
	//첨부파일용]
	int insertFile(Map map);
	int deleteFile(Map map);
	int updateFile(Map map);
	List<NoticeFileDTO> selectListFile(Map map);
	List<NoticeFileDTO> selectOneFile(Map map);

}
