package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.veve.model.service.GallaryBoardService;

@Repository
public class GallaryBoardDAO implements GallaryBoardService{

	@Resource(name ="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public int insert(Map map) {
		return sqlMapper.insert("gallaryInsert", map);
	}

	
	@Override 
	public int insertFile(Map map) { 
		return sqlMapper.insert("gallaryFileInsert",map); 
	}


	@Override
	public List<GallaryBoardDTO> selectBoardList(Map map) {
		return sqlMapper.selectList("gallaryBoardSelectList",map);
	}


	@Override
	public List<GallaryFileDTO> selectFileList(Map map) {
		return sqlMapper.selectList("gallaryFileSelectList",map);
	}
	@Override
	public List<GallaryFileDTO> selectFileListOne(Map map) {
		return sqlMapper.selectList("gallaryFileSelectListOne",map);
	}

	@Override
	public GallaryBoardDTO selectBoardOne(Map map) {
		return sqlMapper.selectOne("gallaryBoardSelectOne",map);
	}

	@Override
	public int deleteBoard(Map map) {
		sqlMapper.delete("galcommentDeleteByNo",map);
		return sqlMapper.delete("gallaryDelete", map);
	}


	@Override
	public int update(Map map) {
		sqlMapper.update("gallaryFileUpdate", map);
		return sqlMapper.update("gallaryUpdate", map);
	}


	@Override 
	public int updateFile(Map map) { 
		return sqlMapper.update("gallaryFileUpdate", map); 
	}


	@Override
	public List<GallaryBoardDTO> selectBoardListInfinit(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("gallaryBoardSelectListInfinit",map);
	}


	@Override
	public List<GallaryBoardDTO> selectMyBoardList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("gallaryMyBoardSelectList",map);
	}


	@Override
	public GallaryBoardDTO selectBoardOneByNo(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("gallaryBoardSelectOneNo", map);
	}
	
	
	//안드로이드
	   public int post(GallaryBoardDTO g_board) {
	      return sqlMapper.insert("galleryPost",g_board);
	   }
	   
	   public int postFile(GallaryFileDTO fileDTO) {
	      return sqlMapper.insert("galleryFilePost", fileDTO);
	   }
	   
	   public int delete(String gallary_no) {
	      return sqlMapper.delete("galleryDelete", gallary_no);
	   }
	   
	   public int update(GallaryBoardDTO g_board) {
	      return sqlMapper.update("galleryUpdate",g_board);
	   }
	   
	   public int updateFile(GallaryFileDTO g_file) {
	      return sqlMapper.update("galleryFileUpdate",g_file);
	   }
	   
	   //public List<GallaryBoardDTO> boardList(Map map) {
	      //return sqlMapper.selectList("androidGallaryList",map);
	   //}
	   
	   @Override
	   public List<GallaryBoardDTO> selectAllList(Map map) {
	      return sqlMapper.selectList("androidGallaryList",map);
	   }
	   
	   @Override
	   public List<GallaryBoardDTO> selectMyList(Map map) {
	      return sqlMapper.selectList("androidMyList", map);
	   }
	   
	   @Override
	   public List<GallaryFileDTO> selectMyFileLists(Map map) {
	      return sqlMapper.selectList("androidMyFileList", map);
	   }
	   
	   @Override
	   public List<GallaryBoardDTO> selectMyScrapList(Map map) {
	      return sqlMapper.selectList("androidMyScrapList", map);
	   }
	   
	   @Override
	   public List<GallaryFileDTO> selectMyScrapLists(Map map) {
	      return sqlMapper.selectList("androidMyScrapLists", map);
	   }

	   @Override
	   public int getPostCount(Map map) {
	      return sqlMapper.selectOne("getPostCount", map);
	   }

	   @Override
	   public int getFollowCount(Map map) {
	      return sqlMapper.selectOne("getFollowCount", map);
	   }

	   @Override
	   public int getFollowingCount(Map map) {
	      return sqlMapper.selectOne("getFollowingCount", map);
	   }

	   @Override
	   public MemberFileDTO getProfileImage(Map map) {
	      return sqlMapper.selectOne("getProfileImage", map);
	   }
	   
	   @Override
	   public List<GallaryFileDTO> selectFileLists(Map map) {
	      return sqlMapper.selectList("gallaryFileSelectLists",map);
	   }


}
