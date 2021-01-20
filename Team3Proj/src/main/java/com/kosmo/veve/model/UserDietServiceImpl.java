package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.veve.model.service.NoticeCommentService;
import com.kosmo.veve.model.service.UserDietService;


@Service("userDietService")
public class UserDietServiceImpl implements UserDietService {
	
	@Resource(name="userDietDAO")
	private UserDietDAO dao;

	@Override
	public NutrientDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return dao.selectOne(map);
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return dao.insert(map);
	}

	@Override
	public List<UserDietDTO> getTodayNutrientInfo(Map map) {
		// TODO Auto-generated method stub
		return dao.getTodayNutrientInfo(map);
	}

	@Override
	public List<UserDietDTO> getWeekNutrientInfo(String today) {
		// TODO Auto-generated method stub
		return dao.getWeekNutrientInfo(today);
	}
	


}
