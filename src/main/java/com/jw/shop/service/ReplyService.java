package com.jw.shop.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import com.jw.shop.domain.ReplyVO;

public interface ReplyService {

	
	void replyInsert(HttpSession session, ReplyVO vo, @PathVariable(required = false) Integer bno);
	void replyDelete(HttpSession session, ReplyVO vo, @PathVariable(required = false) Integer re_no);
	void replyUpdate(HttpSession session, ReplyVO vo, @PathVariable(required = false) Integer re_no);
	List<Map<String, Object>> replyRead(Integer b_no, Model model);
	
}
