package com.jw.shop.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.jw.shop.domain.UserVO;

public interface UserService {

	// 로그인페이지
	String login(Model model, HttpSession session);

	// 로그인
	String loginProc(UserVO vo, Model model, HttpSession session, HttpServletRequest request) throws Exception;

	// 로그아웃
	String logout(HttpSession session);

	// 회원정보수정 페이지 정보 가져오기
	String userUpdate(UserVO vo, Model model, HttpSession session);

	// 회원정보 수정
	String userUpdateProc(UserVO vo, Model model, HttpSession session, HttpServletResponse res) throws IOException;

	// 회원탈퇴 페이지
	String userDelete();

	// 회원탈퇴
	String userDeleteProc(UserVO vo, HttpSession session);

	// 회원가입페이지
	String userJoin(Model model, HttpSession session);

	// 회원가입
	String userJoinProc(UserVO vo, String command, Model model, HttpSession session) throws Exception;
	
	// 아이디 중복검사
	String userSelect(Model model, UserVO vo, HttpServletRequest req);

	String userRegister(Model model, HttpSession session);
	
	//아이디 찾기
	String userFindId(UserVO vo, Model model) throws Exception;
	
	String userFindIdProc(UserVO vo, Model model) throws Exception;
}
