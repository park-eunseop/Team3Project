package com.kosmo.veve.model.service;

import java.util.List;  
import java.util.Map;

import com.kosmo.veve.model.RecipeDTO;
import com.kosmo.veve.model.RecipeFileDTO;

public interface RecipeService {
	
	List<RecipeDTO> selectList(Map map);
	List<RecipeFileDTO> selectListFile(Map map);
	
	RecipeDTO selectOne(Map map);
	List<RecipeFileDTO> selectOneFile(Map map);
	int insert(Map map);
	int insertFile(Map map);
	int delete(Map map);
	int deleteFile(Map map);
	int update(Map map);
	int updateFile(Map map);
}
