package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.veve.model.service.GallaryScrapService;

@Service("gallaryscrapService")
public class GallaryScrapServiceImpl implements GallaryScrapService{
	
	@Resource(name="gallaryScrapDAO")
	private GallaryScrapDAO dao;

	@Override
	public int insertScrap(Map map) {
		return dao.insertScrap(map);
	}

	@Override
	public int deleteScrap(Map map) {
		return dao.deleteScrap(map);
	}

//	@Override
//	public List<GallaryBoardDTO> selectBoardList(Map map) {
//		return dao.selectBoardList(map);
//	}
//
//	@Override
//	public List<GallaryFileDTO> selectFileList(Map map) {
//		return dao.selectFileList(map);
//	}

	@Override
	public GallaryBoardDTO selectBoardOne(Map map) {
		return dao.selectBoardOne(map);
	}

	@Override
	public List<GallaryScrapDTO> selectScrapList(Map map) {
		return dao.selectScrapList(map);
	}

	@Override
	public List<GallaryScrapDTO> getScrapCount(Map map) {
		return dao.getScrapCount(map);
	}
	//Android
	   
	   @Override
	   public int insertScrapAR(GallaryScrapDTO gsDTO) {
	      return dao.insertScrapAR(gsDTO);
	   }

	   @Override
	   public int deleteScrapAR(GallaryScrapDTO gsDTO) {
	      return dao.deleteScrapAR(gsDTO);
	   }
	   
	   @Override
	   public int updateScrapAR(GallaryScrapDTO gsDTO) {
	      return dao.updateScrapAR(gsDTO);
	   }
	
}
