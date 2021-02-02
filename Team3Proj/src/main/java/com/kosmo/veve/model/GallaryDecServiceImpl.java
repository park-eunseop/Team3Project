package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.veve.model.service.GallaryDecService;
import com.kosmo.veve.model.service.NoticeCommentService;
import com.kosmo.veve.model.service.UserDietService;


@Service("gallaryDecService")
public class GallaryDecServiceImpl implements GallaryDecService {
	
	@Resource(name="gallaryDecDAO")
	private GallaryDecDAO dao;

	@Override
	public int insertDec(Map map) {
		// TODO Auto-generated method stub
		return dao.insertDec(map);
	}

	@Override
	public int deleteDec(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteDec(map);
	}





	


}
