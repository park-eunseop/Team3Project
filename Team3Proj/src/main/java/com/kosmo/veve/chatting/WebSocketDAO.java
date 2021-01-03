package com.kosmo.veve.chatting;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.veve.model.MemberDTO;

@Repository
public class WebSocketDAO {
	
	@Resource(name ="template")
	private SqlSessionTemplate sqlMapper;
	
	public MemberDTO getNickname(Map map) {
		return sqlMapper.selectOne("getNickname", map);
	}

}
