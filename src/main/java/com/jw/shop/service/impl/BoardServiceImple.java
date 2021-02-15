package com.jw.shop.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.jw.shop.domain.BoardVO;
import com.jw.shop.domain.ReplyVO;
import com.jw.shop.domain.UserVO;
import com.jw.shop.mapper.BoardMapper;
import com.jw.shop.mapper.ReplyMapper;
import com.jw.shop.mapper.UserMapper;
import com.jw.shop.service.BoardService;
import com.jw.shop.util.Paging;


@Service
public class BoardServiceImple implements BoardService {

	private final BoardMapper boardMapper;
	private final UserMapper userMapper;
	private final ReplyMapper replyMapper;
	
	public BoardServiceImple(BoardMapper boardMapper, UserMapper userMapper, ReplyMapper replyMapper) {
		this.boardMapper = boardMapper;
		this.userMapper = userMapper;
		this.replyMapper = replyMapper;
	}
	
	@Override
	public ModelAndView b_select(BoardVO vo, Model model, Integer page) {
		int boardCnt = boardMapper.boardCnt(vo);
		if(page == null) {
			page = 1;
		}
		System.out.println("page" + page);
		Paging paging = new Paging(boardCnt, page, 10);
		vo.setStartIndex(paging.getStartIndex());
        vo.setCntPerPage(paging.getPageIndex());
		List<Map<String, Object>> result = boardMapper.b_select(vo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", result);
		mav.addObject("paging", paging);
		mav.setViewName("/board/list");
		return mav;
	}

	@Override
	public ModelAndView b_insert(BoardVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/board/list");
		UserVO uvo = (UserVO) session.getAttribute("shopMember");
		System.out.println(uvo.getShop_id());
		vo.setUser_id(uvo.getShop_id());
		boardMapper.boardInsert(vo);
		return mav;
	}


	@Override
	public String b_delete(BoardVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView boardView(BoardVO vo, Model model, Integer bno, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bno == null) {
			mav.setViewName("/board/list");
		} else {
			BoardVO result = boardMapper.boardView(bno);
			List<Map<String, Object>> rvo = replyMapper.replyRead(bno);
			int reply_count = rvo.size();
			System.out.println(rvo);
			boardMapper.boardRead(bno);
			mav.setViewName("/board/view");
			mav.addObject("board", result);
			mav.addObject("reply", rvo);
			mav.addObject("reply_count", reply_count);
			
		}
		return mav;
	}

	@Override
	public List<Map<String, Object>> b_json(BoardVO vo, Model model, Integer page) {
		// Paging paging = new Paging(boardCnt, page);
		int boardCnt = boardMapper.boardCnt(vo);
		if(page == null) {
			page = 1;
		}
		Paging paging = new Paging(boardCnt, page, 10);
		vo.setStartIndex(paging.getStartIndex());
        vo.setCntPerPage(paging.getPageIndex());
		List<Map<String, Object>> result = boardMapper.b_select(vo);
		return result;
	}

	@Override
	public ModelAndView b_update(BoardVO vo, Integer bno) {
		// TODO Auto-generated method stub
		ModelAndView mav = new ModelAndView();
		BoardVO bvo = boardMapper.boardView(bno);
		bvo.setB_subject(vo.getB_subject());
		bvo.setB_content(vo.getB_content());
		mav.setViewName("/board/view");
		mav.addObject("board", boardMapper.boardUpdate(bvo));
		return mav;
	}

}
