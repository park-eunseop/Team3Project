package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.veve.model.service.NoticeBoardService;

@Repository("noticeBoardDAO")
public class NoticeBoardDAO implements NoticeBoardService {
	
	@Resource(name ="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<NoticeBoardDTO> selectList(Map map) {
		return sqlMapper.selectList("noticeSelectList",map);
	}

	@Override
	public int getTotalRecord() {
		return sqlMapper.selectOne("noticeGetTotalRecord");
	}

	@Override
	public NoticeBoardDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("noticeSelectOne", map);
	}

	@Override
	public int insert(Map map) {
		return sqlMapper.insert("noticeInsert", map);
	}

	@Override
	public int delete(Map map) {
		//자식삭제]
		sqlMapper.delete("commentNoDeleteByNo",map);
		//부모삭제]		
		return sqlMapper.delete("noticeDelete", map);
	}

	@Override
	public int update(Map map) {
		return sqlMapper.update("noticeUpdate", map);
	}

	@Override
	public int insertFile(Map map) {
		return sqlMapper.insert("noticeInsertFile",map);
	}

	@Override
	public int deleteFile(Map map) {
		   return sqlMapper.delete("noticeDeleteFile", map);
	}

	@Override
	public int updateFile(Map map) {
		return sqlMapper.update("noticeUpdateFile",map);
	}

	@Override
	public List<NoticeFileDTO> selectListFile(Map map) {
		return sqlMapper.selectList("noticeSelectListFile",map);
	}

	@Override
	public List<NoticeFileDTO> selectOneFile(Map map) {
		return sqlMapper.selectOne("noticeSelectOneFile", map);
	}

}
