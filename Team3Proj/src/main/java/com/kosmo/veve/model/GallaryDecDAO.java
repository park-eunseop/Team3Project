package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.veve.model.service.GallaryDecService;
import com.kosmo.veve.model.service.NoticeCommentService;
import com.kosmo.veve.model.service.UserDietService;


@Repository("gallaryDecDAO")
public class GallaryDecDAO implements GallaryDecService {
	
	
	@Resource(name ="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public int insertDec(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("gallaryDecInsert", map);
	}

	@Override
	public int deleteDec(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("gallaryDecDelete", map);
	}

	


	
}
