package com.kosmo.veve.model;

import java.util.List;  
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.veve.model.service.RecipeService;


@Repository("recipeDao")
public class RecipeDAO  implements RecipeService{
   //SqlSessionTemplate객체 주입]
   @Resource(name="template")
   private SqlSessionTemplate sqlMapper;
   
   
   @Override
   public List<RecipeDTO> selectList(Map map) {
   
      return sqlMapper.selectList("recipeSelectList",map);
   }
   
   
   @Override
   public List<RecipeFileDTO> selectListFile(Map map) {
   
      return sqlMapper.selectList("recipeSelectListFile",map);
   }


   @Override
   public int insert(Map map) {
      
      return sqlMapper.insert("recipeInsert",map);
   }

   @Override
   public int insertFile(Map map) {
      return sqlMapper.insert("recipeInsertFile",map);
   }
   
   @Override
   public RecipeDTO selectOne(Map map) {      
      return sqlMapper.selectOne("recipeSelectOne", map);
   }

   @Override
   public List<RecipeFileDTO> selectOneFile(Map map) {      
      return sqlMapper.selectOne("recipeSelectOneFile", map);
   }
   
   @Override
   public int update(Map map) {
      
      return sqlMapper.update("recipeUpdate",map);
   }
   @Override
   public int updateFile(Map map) {
      
      return sqlMapper.update("recipeUpdateFile",map);
   }
   @Override
      public int delete(Map map) {
      
      sqlMapper.delete("recipeDeleteByNo",map);
      
         return sqlMapper.delete("recipeDelete", map);
      }
   
   @Override
      public int deleteFile(Map map) {
      
         return sqlMapper.delete("recipeDeleteFile", map);
      }




}