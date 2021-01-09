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
		return sqlMapper.selectList("memberSelectAll", map);
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
	@Override
	public boolean isKakao(String userID) {
		// TODO Auto-generated method stub
		return (Integer)sqlMapper.selectOne("memberKaKaocheck",userID)==1?true:false;
	}
	
	@Override
	public String getid(String nickname) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("getmemberID",nickname);
	}

	@Override
	public MemberFileDTO selectFile(String userID) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("memberFile",userID);
	}

	@Override
	public int getFollowing(String userID) {
		// TODO Auto-generated method stub
		return (Integer)sqlMapper.selectOne("memberFollowing",userID);
	}

	@Override
	public int getFollower(String userID) {
		// TODO Auto-generated method stub
		return (Integer)sqlMapper.selectOne("memberFollower",userID);
	}

	@Override
	public List<MemberFollowDTO> getFollowingInfo(String userID) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("memberFollowingInfo", userID);
	}

	@Override
	public List<MemberFollowDTO> getFollowerInfo(String userID) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("memberFollowerInfo", userID);
	}
	

	@Override
	public boolean isfollowing(Map map) {
		// TODO Auto-generated method stub
		return (Integer)sqlMapper.selectOne("isfollowing",map)==1?true:false;
	}

	@Override
	public int insertfollow(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("insertFollow", map);
	}

	@Override
	public int deletefollow(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteFollow",map);
	}
	
	
	@Override
	public int kakoinsert(Map map) {
		// TODO Auto-generated method stub
				System.out.println("here! insert");
				int user = sqlMapper.insert("memberInsert",map); //member insert
				System.out.println("kako user: "+user);
				int auth =0;
				if(user == 1) {		
					int file = sqlMapper.insert("userFileInsert", map);
					System.out.println("file: "+file);//파일 insert
					auth = sqlMapper.insert("authInsert", map);
					System.out.println("auth: "+auth); //auth insert
				}
				return auth;
	}
	
	
	
	
	
	
	
	
	///////////////////////////////////////////////////////////admin
	//관리자 페이지 모든 맴버 출력용
	public List<MemberDTO> selectList_admin(Map map) {
		return sqlMapper.selectList("selectList_admin", map);
	}
	
	//페이징을 위한 
	//총 맴버수 확인
	public int getTotalMember(Map map) {
		return sqlMapper.selectOne("getTotalMember",map);
	}



}
