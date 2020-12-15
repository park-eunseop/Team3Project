package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.veve.model.service.MemberService;



@Repository
public class MemberDAO implements MemberService {

	
	@Resource(name ="template")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public boolean isLogin(Map map) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<MemberDTO> selectList(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalRecord(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("memberSelectOne", map);
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		System.out.println("here! insert");
		int user = sqlMapper.insert("memberInsert",map); //member insert
		System.out.println("user: "+user);
		int auth =0;
		if(user == 1) {
			int file = sqlMapper.insert("userFileInsert", map);
			System.out.println("file: "+file);//파일 insert
			auth = sqlMapper.insert("authInsert", map);
			System.out.println("auth: "+auth); //auth insert
		}
		return auth;
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean idCheck(String userID) {
		// TODO Auto-generated method stub
		return (Integer)sqlMapper.selectOne("memberIDcheck",userID)==1?true:false;
	}

}
