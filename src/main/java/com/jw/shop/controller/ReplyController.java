package com.jw.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jw.shop.domain.ReplyVO;
import com.jw.shop.service.ReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	private final ReplyService replyService;
	
	public ReplyController(ReplyService replyService) {
		this.replyService = replyService;
	}

	
	@GetMapping("/insert")
	public void replyInser(HttpSession session, ReplyVO vo, @PathVariable(required = false) Integer bno) {
		replyService.replyInsert(session, vo, bno);
	}
	
	public void replyUpdate(HttpSession session, ReplyVO vo) {
		
	}
	
	public void replyDelete(HttpSession session, ReplyVO vo) {
		
	}
	
	@GetMapping("/read")
	public List<ReplyVO> replyRead(ReplyVO vo) {
		return replyService.replyRead(vo);
		
	}
	
	
}
