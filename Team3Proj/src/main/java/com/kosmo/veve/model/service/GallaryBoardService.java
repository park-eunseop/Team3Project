package com.kosmo.veve.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.veve.model.GallaryBoardDTO;
import com.kosmo.veve.model.GallaryFileDTO;
import com.kosmo.veve.model.MemberFileDTO;

public interface GallaryBoardService {

	int insert(Map map);
	int insertFile(Map map);
	int deleteBoard(Map map);
	int update(Map map);
	int updateFile(Map map);
	
	List<GallaryBoardDTO> selectBoardList(Map map);
	
	List<GallaryBoardDTO> selectMyBoardList(Map map);
	
	List<GallaryBoardDTO> selectBoardListInfinit(Map map);
	List<GallaryFileDTO> selectFileList(Map map);
	List<GallaryFileDTO> selectFileListOne(Map map);
	
	GallaryBoardDTO selectBoardOne(Map map);
	GallaryBoardDTO selectBoardOneByNo(Map map);
	
	//안드로이드
	   List<GallaryBoardDTO> selectAllList(Map map);
	   
	   List<GallaryFileDTO> selectFileLists(Map map);
	   
	   int getPostCount(Map map);
	   int getFollowCount(Map map);
	   int getFollowingCount(Map map);
	   MemberFileDTO getProfileImage(Map map);
	   
	   List<GallaryBoardDTO> selectMyList(Map map);
	   List<GallaryFileDTO> selectMyFileLists(Map map);
	   List<GallaryBoardDTO> selectMyScrapList(Map map);
	   List<GallaryFileDTO> selectMyScrapLists(Map map);
	

}
