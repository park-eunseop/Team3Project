
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
	public int delete(String userID) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteUser",userID);
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

	@Override
	public int deletefollowWithdraw(String userID) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteFollowforWithdraw",userID);
	}

	@Override
	public int updatePwd(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("updateUserPwd",map);
	}

	@Override
	public Map showauth(String userID) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("showauth", userID);
	}

	@Override
	public int updateAuth(Map map) {
		// TODO Auto-generated method stub
		int result =sqlMapper.update("updateauth", map);
		System.out.println("result:"+result);
		return result;
	}
	
	
	/////안드로이드
	public MemberDTO isLogin(MemberDTO member) {
	      return sqlMapper.selectOne("memberIsLogin",member);
	   }
	   
	   public int signUp(MemberDTO member) {
	      return sqlMapper.insert("memberSignUp", member);
	   }
	   
	   public int signUpFile(MemberFileDTO member) {
	      return sqlMapper.insert("memberSignUpFile", member);
	   }
	   
	   public int memberInfoupdate(MemberDTO member) {
	      return sqlMapper.update("memberInfoupdate",member);
	   }
	   
	   public int memberFileUpdate(MemberFileDTO member) {
	      return sqlMapper.update("memberFileUpdate", member);
	   }
	   
	   public MemberDTO userIDCheck(MemberDTO member) {
	      return sqlMapper.selectOne("userIDCheck", member);
	   }
	   
	   public int insertFollowAR(MemberFollowDTO followDTO) {
	      return sqlMapper.insert("insertFollowAR", followDTO);
	   }
	   
	   public List<MemberFollowDTO> androidFollowInfo(Map map){
	      return sqlMapper.selectList("androidFollowInfo", map);
	   }
	   
	   public List<MemberFileDTO> androidFollowFile(Map map){
	      return sqlMapper.selectList("androidFollowFile", map);
	   }
	   
	   public List<MemberFollowDTO> androidFollowingInfo(Map map){
	      return sqlMapper.selectList("androidFollowingInfo", map);
	   }
	   
	   public List<MemberFileDTO> androidFollowingFile(Map map){
	      return sqlMapper.selectList("androidFollowingFile", map);
	   }

	   public List<MemberFileDTO> androidCommentUserFile(Map map){
	      return sqlMapper.selectList("androidCommentUserFile", map);
	   }



}
