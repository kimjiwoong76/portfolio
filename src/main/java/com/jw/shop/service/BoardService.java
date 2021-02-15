package com.jw.shop.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.jw.shop.domain.BoardVO;

public interface BoardService {

	
	//게시판 리스트 가져오기
	ModelAndView b_select(BoardVO vo, Model model, Integer page);

	//게시글 작성하기
	ModelAndView b_insert(BoardVO vo, HttpSession session);
	
	//게시글 수정하기
	ModelAndView b_update(BoardVO vo, Integer bno);
	//게시글 상세보기
	ModelAndView boardView(BoardVO vo, Model model, Integer bno, HttpSession session);
	
	//게시글 삭제하기
	String b_delete(BoardVO vo);
	
	List<Map<String, Object>> b_json(BoardVO vo, Model model, Integer page);

	
	
}
