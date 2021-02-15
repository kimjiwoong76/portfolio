package com.jw.shop.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jw.shop.domain.BoardVO;
import com.jw.shop.domain.UserVO;
import com.jw.shop.mapper.BoardMapper;
import com.jw.shop.service.BoardService;


@RestController
@RequestMapping("/board")
public class BoardController {

	private final BoardService boardService;
	private final BoardMapper boardMapper;
	
	public BoardController(BoardService boardService, BoardMapper boardMapper) {
		this.boardService = boardService;
		this.boardMapper = boardMapper;
	}
	
	// 리스트 가져오기
	@GetMapping(value = {"/list", "/list/{page}"})
	public ModelAndView b_select(BoardVO vo, Model model, @PathVariable(required = false) Integer page) {
		System.out.println("1");
		return boardService.b_select(vo, model, page);
//		return "hello world";
	}
	
	// 리스트 제이슨 보내기
	@GetMapping(value = "/list-json")
	public List<Map<String, Object>> b_json(BoardVO vo, Model model, @PathVariable(required = false) Integer page) {
		return boardService.b_json(vo, model, page);
//		return "hello world";
	}
	
	// 상세페이지 보기
	@GetMapping(value = "/view/{bno}")
	public ModelAndView boardView(BoardVO vo, Model model, @PathVariable(required = false) Integer bno, HttpSession session) {
		return boardService.boardView(vo, model, bno, session);
//		return "hello world";
	}
	
	// 새로운 글 등록 페이지
	@GetMapping(value = "/write")
	public ModelAndView boardWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/write");
		return mav;
	}
	
	// 새로운 글 등록 프로세스
	@GetMapping(value = "/insert")
	public ModelAndView b_insert(BoardVO vo, HttpSession session) {
		return boardService.b_insert(vo, session);
	}
	
	// 글 수정
	@GetMapping(value = "/update/{bno}")
	public ModelAndView boardUpdate(@PathVariable(required = false) Integer bno, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("shopMember") != null) {
			UserVO uvo = (UserVO) session.getAttribute("shopMember");
			BoardVO result = boardMapper.boardView(bno);
			if(result.getUser_id().equals(uvo.getShop_id())) {
				mav.setViewName("/board/update");
				mav.addObject("board", result);
			} else {
				mav.setViewName("/board/error");
			}
		} else {
			mav.setViewName("/board/error");
		}
		return mav;
	}
	
	@GetMapping(value = "/update/process/{bno}")
	public ModelAndView boardUpdateProcess(BoardVO vo, @PathVariable(required = false) Integer bno) {
		return boardService.b_update(vo, bno);
		
	}
	
	
}
