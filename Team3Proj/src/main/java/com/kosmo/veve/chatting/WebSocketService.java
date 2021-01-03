package com.kosmo.veve.chatting;

import java.util.List;
import java.util.Map;

import com.kosmo.veve.model.MemberDTO;

public interface WebSocketService {
	//member nickname 가져오기용
	MemberDTO getNickname(Map map);
	
}
