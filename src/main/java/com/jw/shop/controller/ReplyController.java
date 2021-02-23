package com.jw.shop.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
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
	
	@GetMapping("/delete/{re_no}")
	public void replyDelete(HttpSession session, ReplyVO vo, @PathVariable(required = false) Integer re_no) {
		replyService.replyDelete(session, vo, re_no);
	}
	
	@GetMapping("/update/{re_no}")
	public void replyUpdate(HttpSession session, ReplyVO vo, @PathVariable(required = false) Integer re_no) {
		System.out.println(re_no);
		System.out.println(vo);
		replyService.replyUpdate(session, vo, re_no);
	}
	
	@GetMapping("/read/{b_no}")
	public List<Map<String, Object>> replyRead(@PathVariable(required = false) Integer b_no, Model model) {
		return replyService.replyRead(b_no, model);
		
	}
	
	
}
