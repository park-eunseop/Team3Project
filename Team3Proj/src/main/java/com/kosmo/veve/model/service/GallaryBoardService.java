package com.kosmo.veve.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.veve.model.GallaryBoardDTO;
import com.kosmo.veve.model.GallaryFileDTO;

public interface GallaryBoardService {

	int insert(Map map);
	int insertFile(Map map);
	int deleteBoard(Map map);
	int update(Map map);
	int updateFile(Map map);
	
	List<GallaryBoardDTO> selectBoardList(Map map);
	List<GallaryFileDTO> selectFileList(Map map);
	
	GallaryBoardDTO selectBoardOne(Map map);
	

}
