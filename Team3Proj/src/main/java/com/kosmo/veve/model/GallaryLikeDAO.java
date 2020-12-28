package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.veve.model.service.GallaryLikeService;

@Repository
public class GallaryLikeDAO implements GallaryLikeService {
	
	@Resource(name ="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public int insertLike(Map map) {
		sqlMapper.insert("gallaryLikeInsert", map);
		return sqlMapper.update("gallaryLikeUpdate", map);
	}

	@Override
	public int deleteLike(Map map) {
		sqlMapper.delete("gallaryLikeDelete", map);
		return sqlMapper.update("gallaryLikeUpdate", map);
	}

	@Override
	public int updateLike(Map map) {
		return sqlMapper.update("gallaryLikeUpdate", map);
	}

	@Override
	public int getLikeCount(Map map) {
		return sqlMapper.selectOne("gallaryLikeCount", map);
	}

	@Override
	public List<GallaryLikeDTO> selectLikeList(Map map) {
		return sqlMapper.selectList("selectLikeList", map);
	}

	
	
}
