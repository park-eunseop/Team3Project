package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.veve.model.service.GallaryBoardService;

@Repository
public class GallaryBoardDAO implements GallaryBoardService{

	@Resource(name ="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public int insert(Map map) {
		return sqlMapper.insert("gallaryInsert", map);
	}

	
	@Override 
	public int insertFile(Map map) { 
		return sqlMapper.insert("gallaryFileInsert",map); 
	}


	@Override
	public List<GallaryBoardDTO> selectBoardList(Map map) {
		return sqlMapper.selectList("gallaryBoardSelectList",map);
	}


	@Override
	public List<GallaryFileDTO> selectFileList(Map map) {
		return sqlMapper.selectList("gallaryFileSelectList",map);
	}

	@Override
	public GallaryBoardDTO selectBoardOne(Map map) {
		return sqlMapper.selectOne("gallaryBoardSelectOne",map);
	}

	@Override
	public int deleteBoard(Map map) {
		sqlMapper.delete("commentDeleteByNo",map);
		return sqlMapper.delete("gallaryDelete", map);
	}


	@Override
	public int update(Map map) {
		return sqlMapper.update("gallaryUpdate", map);
	}


	@Override 
	public int updateFile(Map map) { 
		return sqlMapper.update("gallaryFileUpdate", map); 
	}


}
