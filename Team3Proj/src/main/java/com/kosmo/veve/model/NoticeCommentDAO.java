package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.veve.model.service.NoticeCommentService;


@Repository("noticeCommentDAO")
public class NoticeCommentDAO implements NoticeCommentService {
	
	@Resource(name ="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<Map> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("commentNoSelectList",map);
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("commentNoInsert",map);
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("commentNoDelete",map);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("commentNoUpdate",map);
	}

	
}
