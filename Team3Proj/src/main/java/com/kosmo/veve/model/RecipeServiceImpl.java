package com.kosmo.veve.model;

import java.util.List; 

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kosmo.veve.model.service.RecipeService;

@Service("recipeService")
public class RecipeServiceImpl implements  RecipeService{

	//MemoCommentDAO주입]
	@Resource(name="recipeDao")
	private RecipeDAO dao;
	

	@Override
	public List<RecipeDTO> selectList(Map map) {
		
		return dao.selectList(map);
	}
	
	@Override
	public List<RecipeFileDTO> selectListFile(Map map) {
		
		return dao.selectListFile(map);
	}
		
	@Override
	public int insert(Map map) {		
		return dao.insert(map);
	}

	@Override
	public int insertFile(Map map) {
		return dao.insertFile(map);
	}
	
	@Override
	public RecipeDTO selectOne(Map map) {
		
		return dao.selectOne(map);
	}
	@Override
	public List<RecipeFileDTO> selectOneFile(Map map) {
		
		return dao.selectOneFile(map);
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
	public int delete(Map map) {
		
		return dao.delete(map);
	}
	
	@Override
	public int deleteFile(Map map) {
		
		return dao.deleteFile(map);
	}

	
}
