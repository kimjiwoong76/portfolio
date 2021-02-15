package com.jw.shop.mapper;

import java.util.List;
import java.util.Map;

import com.jw.shop.domain.ReplyVO;

public interface ReplyMapper {

	void replyInsert(ReplyVO vo);
	void replyDelete(ReplyVO vo);
	void replyUpdate(ReplyVO vo);
	List<Map<String, Object>> replyRead(Integer bno);
	
}
