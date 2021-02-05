package com.kosmo.veve.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kosmo.veve.model.GallaryDecDTO;
import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.MemberFileDTO;
import com.kosmo.veve.model.MemberFollowDTO;
import com.kosmo.veve.model.NutrientDTO;
import com.kosmo.veve.model.UserDietDTO;


public interface AdminReportedService {
	
		//월 신고 횟수 가져오기
		int getMonthReported(Map map);
		
		//신고 리스트 가져오기
		List<GallaryDecDTO> getGalReList();
		
		
		
		
		
		//신고 삭제
		int deleteReported(Map map);
		
		
		
		
			
		
}
