package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.veve.model.service.GallaryBoardService;
import com.kosmo.veve.model.service.GallaryCommentService;

@Service("galcommentService")
public class GallaryCommentServiceImpl implements GallaryCommentService{
	
	@Resource(name="gallaryCommentDAO")
	private GallaryCommentDAO dao;
	
	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}

	@Override
	public List<Map> selectList(Map map) {
		return dao.selectList(map);
	}

	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}

	@Override
	public int update(Map map) {
		return dao.update(map);
	}
	
	

}
