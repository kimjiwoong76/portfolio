package com.jw.shop.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import com.jw.shop.domain.ReplyVO;
import com.jw.shop.domain.UserVO;
import com.jw.shop.mapper.ReplyMapper;
import com.jw.shop.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService {

	private final ReplyMapper replyMapper;
	
	public ReplyServiceImpl(ReplyMapper replyMapper) {
		this.replyMapper = replyMapper;
	}
	
	
	@Override
	public void replyInsert(HttpSession session, ReplyVO vo, @PathVariable(required = false) Integer bno) {
		UserVO uvo = (UserVO) session.getAttribute("shopMember");
		String user_id = uvo.getShop_id();
		vo.setUser_id(user_id);
		System.out.println(vo.toString());
		replyMapper.replyInsert(vo);
		replyMapper.replyRead(bno);
	}

	@Override
	public void replyDelete(HttpSession session, ReplyVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void replyUpdate(HttpSession session, ReplyVO vo) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<ReplyVO> replyRead(ReplyVO vo) {
		// 
		
		return null;

	}

}
