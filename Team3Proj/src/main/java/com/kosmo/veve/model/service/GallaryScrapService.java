package com.kosmo.veve.model.service;

import java.util.List;
import java.util.Map;

import com.kosmo.veve.model.GallaryBoardDTO;
import com.kosmo.veve.model.GallaryFileDTO;
import com.kosmo.veve.model.GallaryScrapDTO;

public interface GallaryScrapService {
	int insertScrap(Map map);
	int deleteScrap(Map map);
	
	List<GallaryScrapDTO> getScrapCount(Map map);
	GallaryBoardDTO selectBoardOne(Map map);
	
	List<GallaryScrapDTO> selectScrapList(Map map);
	
	//Android
	   int insertScrapAR(GallaryScrapDTO gsDTO);
	   int deleteScrapAR(GallaryScrapDTO gsDTO);
	   int updateScrapAR(GallaryScrapDTO gsDTO);
}
