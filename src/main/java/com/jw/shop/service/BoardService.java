package com.jw.shop.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.jw.shop.domain.BoardVO;

public interface BoardService {

	
	//게시판 리스트 가져오기
	ModelAndView b_select(BoardVO vo, Model model, Integer page);

	//게시글 작성하기
	String b_insert(BoardVO vo);
	
	//게시글 상세보기
	ModelAndView boardView(BoardVO vo, Model model, Integer bno);
	
	//게시글 삭제하기
	String b_delete(BoardVO vo);
	
	List<Map<String, Object>> b_json(BoardVO vo, Model model, Integer page);

	
	
}
