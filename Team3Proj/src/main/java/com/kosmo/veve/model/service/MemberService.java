package com.kosmo.veve.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.MemberFileDTO;
import com.kosmo.veve.model.MemberFollowDTO;


public interface MemberService {
	
	//로그인 용]
		boolean isLogin(Map map);
		boolean idCheck(String userID);
		String getid(String nickname);
		boolean isKakao(String userID);
		//목록용]
		List<MemberDTO> selectList(Map map);
		//전체 레코드 수]
		int getTotalRecord(Map map);
		//상세보기용]
		MemberDTO selectOne(Map map);
		//입력/수정/삭제용]
		int insert(Map map);
		int kakoinsert(Map map);
		int delete(String userID);
		//회원삭제를위한 follow삭제
		int deletefollowWithdraw(String userID);
		//패스워드 변경
		int updatePwd(Map map);
		
		int update(Map map);
		//회원 사진 가져오기용]
		MemberFileDTO selectFile(String userID);
		//팔로잉 레코드 수 가져오기
		int getFollowing(String userID);
		//팔로워 레코드 수 가져오기
		int getFollower(String userID);
		//팔로잉 회원리스트 가져오기
		List<MemberFollowDTO> getFollowingInfo(String userID);
		//팔로워 회원리스트 가져오기
		List<MemberFollowDTO> getFollowerInfo(String userID);
		//나의 팔로잉인지 확인
		boolean isfollowing(Map map);
		//팔로우하기
		int insertfollow(Map map);
		//팔로우해제하기
		int deletefollow(Map map);
		
		
		//auth 조회 및 업데이트
		Map showauth(String userID);
		int updateAuth(Map map);

}
