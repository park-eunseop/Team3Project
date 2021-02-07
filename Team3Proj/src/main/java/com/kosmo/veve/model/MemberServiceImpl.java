package com.kosmo.veve.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.veve.model.service.MemberService;


@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource(name="memberDAO")
	private MemberDAO dao;
	
	@Override
	public boolean isLogin(Map map) {
		// TODO Auto-generated method stub
		return dao.isLogin(map);
	}

	@Override
	public List<MemberDTO> selectList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList(map);
	}

	@Override
	public int getTotalRecord(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return dao.selectOne(map);
	}

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}

	@Override
	public int delete(String userID) {
		// TODO Auto-generated method stub
		return dao.delete(userID);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean idCheck(String userID) {
		// TODO Auto-generated method stub
		return dao.idCheck(userID);
	}
	@Override
	public boolean isKakao(String userID) {
		// TODO Auto-generated method stub
		return dao.isKakao(userID);
	}
	@Override
	public String getid(String nickname) {
		// TODO Auto-generated method stub
		return dao.getid(nickname);
	}

	@Override
	public MemberFileDTO selectFile(String userID) {
		// TODO Auto-generated method stub
		return dao.selectFile(userID);
	}

	@Override
	public int getFollowing(String userID) {
		// TODO Auto-generated method stub
		return dao.getFollowing(userID);
	}

	@Override
	public int getFollower(String userID) {
		// TODO Auto-generated method stub
		return dao.getFollower(userID);
	}

	@Override
	public List<MemberFollowDTO> getFollowingInfo(String userID) {
		// TODO Auto-generated method stub
		return dao.getFollowingInfo(userID);
	}

	@Override
	public List<MemberFollowDTO> getFollowerInfo(String userID) {
		// TODO Auto-generated method stub
		return dao.getFollowerInfo(userID);
	}
	@Override
	public boolean isfollowing(Map map) {
		// TODO Auto-generated method stub
		return dao.isfollowing(map);
	}
	
	@Override
	public int insertfollow(Map map) {
		// TODO Auto-generated method stub
		return dao.insertfollow(map);
	}

	@Override
	public int deletefollow(Map map) {
		// TODO Auto-generated method stub
		return dao.deletefollow(map);
	}


	
	
	@Override
	public int kakoinsert(Map map) {
		// TODO Auto-generated method stub
		return dao.kakoinsert(map);
	}
	
	
	
	
	
	
	
	
	
	////////////////////////////////////admin
	//관리자 페이지 모든 맴버 출력용
	public List<MemberDTO> selectList_admin(Map map) {
		return dao.selectList_admin(map);
	}
	
	//페이징을 위한 
	//총 맴버수 확인
	public int getTotalMember(Map map) {
		return dao.getTotalMember(map);
	}

	@Override
	public int deletefollowWithdraw(String userID) {
		// TODO Auto-generated method stub
		return dao.deletefollowWithdraw(userID);
	}

	@Override
	public int updatePwd(Map map) {
		// TODO Auto-generated method stub
		return dao.updatePwd(map);
	}

	@Override
	public Map showauth(String userID) {
		// TODO Auto-generated method stub
		return dao.showauth(userID);
	}

	@Override
	public int updateAuth(Map map) {
		// TODO Auto-generated method stub
		return dao.updateAuth(map);
	}



	
	

}