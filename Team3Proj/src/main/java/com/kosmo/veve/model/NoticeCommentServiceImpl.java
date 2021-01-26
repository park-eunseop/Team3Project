package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.veve.model.service.NoticeCommentService;


@Service("noticeCommentService")
public class NoticeCommentServiceImpl implements NoticeCommentService {
	
	@Resource(name="noticeCommentDAO")
	private NoticeCommentDAO dao;
	

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
