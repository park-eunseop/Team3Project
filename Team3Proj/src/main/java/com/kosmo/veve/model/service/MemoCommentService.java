package com.kosmo.veve.model.service;

import java.util.List;
import java.util.Map;

public interface MemoCommentService {
	//紐⑸줉�슜]
	//�젅肄붾뱶瑜� DTO媛� �븘�땶 留듭뿉 �떞�븘蹂댁옄.
	List<Map> selectList(Map map);
	//�엯�젰/�닔�젙/�궘�젣]
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
}
