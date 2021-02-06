package com.kosmo.veve.board.restaurant;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.veve.model.service.GallaryBoardService;

@Service
public class RestaurantServiceImpl{
	
	@Resource(name="restaurantDAO")
	private RestaurantDAO dao;

	
	public List<Map> selectRestaurantList(Map map) {
		return dao.selectRestaurantList(map);
	}



}
