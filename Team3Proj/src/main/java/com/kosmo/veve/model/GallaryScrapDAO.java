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
		sqlMapper.insert("gallaryScrapInsert", map);
		return sqlMapper.update("gallaryScrapUpdate", map);
	}

	@Override
	public int deleteScrap(Map map) {
		sqlMapper.delete("gallaryScrapDelete", map);
		return sqlMapper.update("gallaryScrapUpdate", map);
	}

	@Override
	public int updateScrap(Map map) {
		return sqlMapper.update("gallaryScrapUpdate", map);
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
	public int getScrapCount(Map map) {
		return sqlMapper.selectOne("gallaryScrapCount", map);
	}
	
	@Override
	public List<GallaryScrapDTO> selectScrapList(Map map) {
		return sqlMapper.selectList("gallaryScrapList", map);
	}

}
