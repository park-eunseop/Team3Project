package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.veve.model.service.GallaryBoardService;

@Service("gallaryService")
public class GallaryBoardServiceImpl implements GallaryBoardService{
	
	@Resource(name="gallaryBoardDAO")
	private GallaryBoardDAO dao;
	
	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}
	
	@Override 
	public int insertFile(Map map) { 
		return dao.insertFile(map); 
	}

	@Override
	public List<GallaryBoardDTO> selectBoardList(Map map) {
		return dao.selectBoardList(map);
	}

	@Override
	public List<GallaryFileDTO> selectFileList(Map map) {
		return dao.selectFileList(map);
	}

	@Override
	public GallaryBoardDTO selectBoardOne(Map map) {
		return dao.selectBoardOne(map);
	}

	@Override
	public int deleteBoard(Map map) {
		return dao.deleteBoard(map);
	}

	@Override
	public int update(Map map) {
		return dao.update(map);
	}

	@Override 
	public int updateFile(Map map) {
		return dao.updateFile(map); 
	}

}
