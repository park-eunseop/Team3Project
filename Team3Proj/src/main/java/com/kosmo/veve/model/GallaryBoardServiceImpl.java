package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.veve.model.service.GallaryBoardService;

@Service("gallaryService")
public class GallaryBoardServiceImpl implements GallaryBoardService{
	
	@Resource(name="gallaryBoardDAO")
	private GallaryBoardDAO dao;
	
	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}
	
	@Override 
	public int insertFile(Map map) { 
		return dao.insertFile(map); 
	}

	@Override
	public List<GallaryBoardDTO> selectBoardList(Map map) {
		return dao.selectBoardList(map);
	}

	@Override
	public List<GallaryFileDTO> selectFileList(Map map) {
		return dao.selectFileList(map);
	}
	@Override
	public List<GallaryFileDTO> selectFileListOne(Map map) {
		return dao.selectFileListOne(map);
	}

	@Override
	public GallaryBoardDTO selectBoardOne(Map map) {
		return dao.selectBoardOne(map);
	}

	@Override
	public int deleteBoard(Map map) {
		return dao.deleteBoard(map);
	}

	@Override
	public int update(Map map) {
		return dao.update(map);
	}

	@Override 
	public int updateFile(Map map) {
		return dao.updateFile(map); 
	}

	@Override
	public List<GallaryBoardDTO> selectBoardListInfinit(Map map) {
		// TODO Auto-generated method stub
		return dao.selectBoardListInfinit(map);
	}

	@Override
	public List<GallaryBoardDTO> selectMyBoardList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectMyBoardList(map);
	}

	@Override
	public GallaryBoardDTO selectBoardOneByNo(Map map) {
		// TODO Auto-generated method stub
		return dao.selectBoardOneByNo(map);
	}
	
	//안드로이드
	   @Override
	   public List<GallaryBoardDTO> selectAllList(Map map) {
	      return dao.selectAllList(map);
	   }

	   @Override
	   public List<GallaryBoardDTO> selectMyList(Map map) {
	      return dao.selectMyList(map);
	   }
	   
	   @Override
	   public List<GallaryFileDTO> selectMyFileLists(Map map) {
	      return dao.selectMyFileLists(map);
	   }

	   @Override
	   public List<GallaryFileDTO> selectMyScrapLists(Map map) {
	      return dao.selectMyScrapLists(map);
	   }

	   @Override
	   public int getPostCount(Map map) {
	      return dao.getPostCount(map);
	   }

	   @Override
	   public int getFollowCount(Map map) {
	      return dao.getFollowCount(map);
	   }

	   @Override
	   public int getFollowingCount(Map map) {
	      return dao.getFollowingCount(map);
	   }

	   @Override
	   public MemberFileDTO getProfileImage(Map map) {
	      return dao.getProfileImage(map);
	   }
	   
	   @Override
	   public List<GallaryBoardDTO> selectMyScrapList(Map map) {
	      return dao.selectMyScrapList(map);
	   }
	   
	   @Override
	   public List<GallaryFileDTO> selectFileLists(Map map) {
	      return dao.selectFileLists(map);
	   }

}
