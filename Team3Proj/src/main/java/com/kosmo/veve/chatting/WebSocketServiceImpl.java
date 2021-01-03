package com.kosmo.veve.chatting;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.veve.model.MemberDTO;

@Service
public class WebSocketServiceImpl implements WebSocketService {
	
	@Resource(name="webSocketDAO")
	private WebSocketDAO webSocketDAO;
	
	@Override
	public MemberDTO getNickname(Map map) {
		return webSocketDAO.getNickname(map);
	}
	

}
