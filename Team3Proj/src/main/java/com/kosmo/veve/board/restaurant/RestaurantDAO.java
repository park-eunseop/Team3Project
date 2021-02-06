package com.kosmo.veve.board.restaurant;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.veve.model.service.GallaryBoardService;

@Repository
public class RestaurantDAO {

	@Resource(name ="template")
	private SqlSessionTemplate sqlMapper;

	public List<Map> selectRestaurantList(Map map) {
		return sqlMapper.selectList("selectRestaurantList",map);
	}

	/*
	public List<GallaryBoardDTO> selectBoardList(Map map) {
		return sqlMapper.selectList("gallaryBoardSelectList",map);
	}
	
	public List<GallaryFileDTO> selectFileList(Map map) {
		return sqlMapper.selectList("gallaryFileSelectList",map);
	}
	
	public List<GallaryFileDTO> selectFileListOne(Map map) {
		return sqlMapper.selectList("gallaryFileSelectListOne",map);
	}

	public GallaryBoardDTO selectBoardOne(Map map) {
		return sqlMapper.selectOne("gallaryBoardSelectOne",map);
	}*/


}
