package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.veve.model.service.GallaryLikeService;

@Service("gallaryLikeService")
public class GallaryLikeServiceImpl implements GallaryLikeService{

	@Resource(name="gallaryLikeDAO")
	private GallaryLikeDAO dao;

	@Override
	public int insertLike(Map map) {
		return dao.insertLike(map);
	}

	@Override
	public int deleteLike(Map map) {
		return dao.deleteLike(map);
	}

	@Override
	public int updateLike(Map map) {
		return dao.updateLike(map);
	}

	@Override
	public int getLikeCount(Map map) {
		return dao.getLikeCount(map);
	}

	@Override
	public List<GallaryLikeDTO> selectLikeList(Map map) {
		return dao.selectLikeList(map);
	}

	@Override
	public int getMyLike(Map map) {
		// TODO Auto-generated method stub
		return dao.getMyLike(map);
	}
	
	//안드로이드
	   public int insertLikeAR(GallaryLikeDTO glDTO) {
	      return dao.insertLikeAR(glDTO);
	   }
	   
	   public int deleteLikeAR(GallaryLikeDTO glDTO) {
	      return dao.deleteLikeAR(glDTO);
	   }
	   @Override
	   public int updateLikeAR(GallaryLikeDTO glDTO) {
	      return dao.updateLikeAR(glDTO);
	   }
	
	
}
