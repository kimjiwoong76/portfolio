package com.jw.shop.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.PathVariable;

import com.jw.shop.domain.ReplyVO;

public interface ReplyMapper {

	void replyInsert(ReplyVO vo);
	void replyDelete(Integer bno);
	void replyUpdate(ReplyVO vo);
	List<Map<String, Object>> replyRead(Integer b_no);
	List<Map<String, Object>> replyRead2(Integer b_no);
	
}
