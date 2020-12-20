package com.kosmo.veve.model;

import java.util.ArrayList;
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
		return dao.selectOne(map);
	}

	@Override
	public int insert(Map map) {
		return dao.insert(map);
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
		return dao.idCheck(userID);
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

}
