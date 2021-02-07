package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.veve.model.service.GallaryScrapService;

@Repository
public class GallaryScrapDAO implements GallaryScrapService{
	
	@Resource(name ="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public int insertScrap(Map map) {
		
		return sqlMapper.update("gallaryScrapInsert", map);
	}

	@Override
	public int deleteScrap(Map map) {
	
		return sqlMapper.update("gallaryScrapDelete", map);
	}

//	@Override
//	public List<GallaryBoardDTO> selectBoardList(Map map) {
//		return sqlMapper.selectList("gallaryBoardScrapList",map);
//	}
//
//	@Override
//	public List<GallaryFileDTO> selectFileList(Map map) {
//		return sqlMapper.selectList("gallaryFileScrapList",map);
//	}

	@Override
	public GallaryBoardDTO selectBoardOne(Map map) {
		return sqlMapper.selectOne("gallaryBoardSelectOne",map);
	}

	@Override
	public List<GallaryScrapDTO> getScrapCount(Map map) {
		return sqlMapper.selectList("gallaryScrapCount", map);
	}
	
	@Override
	public List<GallaryScrapDTO> selectScrapList(Map map) {
		return sqlMapper.selectList("gallaryScrapList", map);
	}
	//android
	   @Override
	   public int insertScrapAR(GallaryScrapDTO gsDTO) {
	      sqlMapper.insert("gallaryScrapInsertAR", gsDTO);
	      return sqlMapper.update("gallaryScrapUpdateAR", gsDTO);
	   }

	   @Override
	   public int deleteScrapAR(GallaryScrapDTO gsDTO) {
	      sqlMapper.delete("gallaryScrapDeleteAR", gsDTO);
	      return sqlMapper.update("gallaryScrapUpdateAR", gsDTO);
	   }

	   @Override
	   public int updateScrapAR(GallaryScrapDTO gsDTO) {
	      return sqlMapper.update("gallaryScrapUpdateAR", gsDTO);
	   }
	   
	   
	

}
