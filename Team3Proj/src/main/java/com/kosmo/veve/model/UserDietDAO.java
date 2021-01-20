package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.veve.model.service.NoticeCommentService;
import com.kosmo.veve.model.service.UserDietService;


@Repository("userDietDAO")
public class UserDietDAO implements UserDietService {
	
	
	@Resource(name ="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public NutrientDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("getStandardDiet", map);
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("insertUserDiet",map);
	}

	@Override
	public List<UserDietDTO> getTodayNutrientInfo(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("getTodayDiet", map);
	}

	@Override
	public List<UserDietDTO> getWeekNutrientInfo(String today) {
		// TODO Auto-generated method stub
		return null;
	}
	


	
}
