package com.jw.shop.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.jw.shop.domain.BoardVO;
import com.jw.shop.mapper.BoardMapper;
import com.jw.shop.mapper.UserMapper;
import com.jw.shop.service.BoardService;
import com.jw.shop.util.Paging;


@Service
public class BoardServiceImple implements BoardService {

	
	private final BoardMapper boardMapper;
	private final UserMapper userMapper;
	
	public BoardServiceImple(BoardMapper boardMapper, UserMapper userMapper) {
		this.boardMapper = boardMapper;
		this.userMapper = userMapper;
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
	public String b_insert(BoardVO vo) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public String b_delete(BoardVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView boardView(BoardVO vo, Model model, Integer bno) {
		ModelAndView mav = new ModelAndView();
		if(bno == null) {
			mav.setViewName("/board/list");
		} else {
			BoardVO result = boardMapper.boardView(bno);
			boardMapper.boardRead(bno);
			mav.setViewName("/board/view");
			mav.addObject("board", result);
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

}
