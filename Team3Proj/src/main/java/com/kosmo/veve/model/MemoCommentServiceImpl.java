package com.kosmo.veve.model;

import java.util.List; 
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.veve.model.service.MemoCommentService;


@Service("commentService")
public class MemoCommentServiceImpl implements  MemoCommentService{

	//MemoCommentDAO주입]
	@Resource(name="commentDao")
	private MemoCommentDAO dao;
	
	@Override
	public List<Map> selectList(Map map) {		
		return dao.selectList(map);
	}

	@Override
	public int insert(Map map) {		
		return dao.insert(map);
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
