package com.jw.shop.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;

import com.jw.shop.domain.ReplyVO;

public interface ReplyService {

	
	void replyInsert(HttpSession session, ReplyVO vo, @PathVariable(required = false) Integer bno);
	void replyDelete(HttpSession session, ReplyVO vo);
	void replyUpdate(HttpSession session, ReplyVO vo);
	List<ReplyVO> replyRead(ReplyVO vo);
	
}
