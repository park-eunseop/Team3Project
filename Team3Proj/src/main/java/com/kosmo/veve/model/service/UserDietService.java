package com.kosmo.veve.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.MemberFileDTO;
import com.kosmo.veve.model.MemberFollowDTO;
import com.kosmo.veve.model.NutrientDTO;
import com.kosmo.veve.model.UserDietDTO;


public interface UserDietService {
	
		//회원 정보에 맞는 표준치 가져오기
		NutrientDTO selectOne(Map map);
		//회원 하루 영양 정보 입력
		int insert(Map map);
		//회원 하루 영양정보 가져오기
		List<UserDietDTO> getTodayNutrientInfo(Map map);
		//회원 일주일 영양정보 가져오기
		List<UserDietDTO> getWeekNutrientInfo(String today);
		
			
		
}
