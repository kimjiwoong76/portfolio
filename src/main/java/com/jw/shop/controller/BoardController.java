package com.jw.shop.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jw.shop.domain.BoardVO;
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
	
	
	@GetMapping(value = {"/list", "/list/{page}"})
	public ModelAndView b_select(BoardVO vo, Model model, @PathVariable(required = false) Integer page) {
		System.out.println("1");
		return boardService.b_select(vo, model, page);
//		return "hello world";
	}
	@GetMapping(value = "/list-json")
	public List<Map<String, Object>> b_json(BoardVO vo, Model model, @PathVariable(required = false) Integer page) {
		return boardService.b_json(vo, model, page);
//		return "hello world";
	}
	
	@GetMapping(value = "/view/{bno}")
	public ModelAndView boardView(BoardVO vo, Model model, @PathVariable(required = false) Integer bno) {
		return boardService.boardView(vo, model, bno);
//		return "hello world";
	}
	
	@GetMapping(value = "/insert")
	public String b_insert(HttpSession session) {
		return "test";
	}
	
}
