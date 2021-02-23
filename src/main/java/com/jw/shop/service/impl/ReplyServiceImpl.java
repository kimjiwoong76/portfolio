package com.jw.shop.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
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
	public void replyDelete(HttpSession session, ReplyVO vo, Integer re_no) {
		// TODO Auto-generated method stub
		replyMapper.replyDelete(re_no);
		
	}

	@Override
	public void replyUpdate(HttpSession session, ReplyVO vo, Integer re_no) {
		// TODO Auto-generated method stub
		replyMapper.replyUpdate(vo);
	}
	
	@Override
	public List<Map<String, Object>> replyRead(Integer b_no, Model model) {
		
		List<Map<String, Object>> result = replyMapper.replyRead2(b_no);
		return result;

	}

}
