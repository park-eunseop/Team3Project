package com.kosmo.veve.model.service;

import java.util.List;
import java.util.Map;

import com.kosmo.veve.model.GallaryLikeDTO;

public interface GallaryLikeService {
	int insertLike(Map map);
	int deleteLike(Map map);
	int updateLike(Map map);
	
	int getLikeCount(Map map);
	List<GallaryLikeDTO> selectLikeList(Map map);
}
