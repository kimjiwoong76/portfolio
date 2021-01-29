package com.jw.shop.mapper;

import java.util.List;
import java.util.Map;

import com.jw.shop.domain.BoardVO;

public interface BoardMapper {
	List<Map<String, Object>> b_select(BoardVO vo);
	int boardCnt(BoardVO vo);
	void boardInsert(BoardVO vo);
	BoardVO boardView(Integer bno);
	int boardRead(Integer bno);
}
