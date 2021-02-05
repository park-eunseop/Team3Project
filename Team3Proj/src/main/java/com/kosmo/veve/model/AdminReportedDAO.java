package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.veve.model.service.AdminReportedService;
import com.kosmo.veve.model.service.GallaryDecService;
import com.kosmo.veve.model.service.NoticeCommentService;
import com.kosmo.veve.model.service.UserDietService;


@Repository("adminReportedDAO")
public class AdminReportedDAO implements AdminReportedService {
	
	
	@Resource(name ="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public int getMonthReported(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("getCountGalDec", map);
	}

	@Override
	public List<GallaryDecDTO> getGalReList() {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("gallaryreportedSelectAll");
	}

	@Override
	public int deleteReported(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}



	


	
}
