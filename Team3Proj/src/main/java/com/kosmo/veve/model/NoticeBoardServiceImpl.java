package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.veve.model.service.NoticeBoardService;

@Service("noticeService")
public class NoticeBoardServiceImpl implements NoticeBoardService {
	
	@Resource(name="noticeBoardDAO")
	private NoticeBoardDAO dao;

	@Override
	public List<NoticeBoardDTO> selectList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList(map);
	}

	@Override
	public int getTotalRecord() {
		// TODO Auto-generated method stub
		return dao.getTotalRecord();
	}

	@Override
	public NoticeBoardDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return dao.selectOne(map);
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return dao.insert(map);
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return dao.delete(map);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return dao.update(map);
	}

	@Override
	public int insertFile(Map map) {
		// TODO Auto-generated method stub
		return dao.insertFile(map);
	}

	@Override
	public int deleteFile(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteFile(map);
	}

	@Override
	public int updateFile(Map map) {
		// TODO Auto-generated method stub
		return dao.updateFile(map);
	}

	@Override
	public List<NoticeFileDTO> selectListFile(Map map) {
		// TODO Auto-generated method stub
		return dao.selectListFile(map);
	}

	@Override
	public List<NoticeFileDTO> selectOneFile(Map map) {
		// TODO Auto-generated method stub
		return dao.selectOneFile(map);
	}

}
