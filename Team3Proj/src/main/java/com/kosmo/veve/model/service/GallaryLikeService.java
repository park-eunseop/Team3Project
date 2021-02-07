package com.kosmo.veve.model.service;

import java.util.List;
import java.util.Map;

import com.kosmo.veve.model.GallaryLikeDTO;

public interface GallaryLikeService {
	int insertLike(Map map);
	int deleteLike(Map map);
	int updateLike(Map map);
	
	//전체 수 가져오기
	int getLikeCount(Map map);
	int getMyLike(Map map);
	List<GallaryLikeDTO> selectLikeList(Map map);
	
	//안드로이드
	   int insertLikeAR(GallaryLikeDTO glDTO);
	   int deleteLikeAR(GallaryLikeDTO glDTO);
	   int updateLikeAR(GallaryLikeDTO glDTO);
	
}
