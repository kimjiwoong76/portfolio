package com.jw.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jw.shop.domain.UserVO;
import com.jw.shop.service.UserService;

@Controller
public class UserController {

	private final UserService userService;

	public UserController(UserService userService) {
		this.userService = userService;
	}

	// 로그인
	@RequestMapping("/login.do")
	public String login(Model model, HttpSession session) {
		return userService.login(model, session);
	}

	@RequestMapping(value="/loginProc.do")
	public String loginProc(UserVO vo, Model model, HttpSession session) throws Exception {
		return userService.loginProc(vo, model, session);
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		return userService.logout(session);
	}

	@RequestMapping("/userUpdate.do")
	public String userUpdate(UserVO vo, Model model, HttpSession session) {
		return userService.userUpdate(vo, model, session);
	}

	@RequestMapping("/userUpdateProc.do")
	public String userUpdateProc(UserVO vo, Model model, HttpSession session) {
		return userService.userUpdateProc(vo, model, session);
	}

	@RequestMapping("/userDelete.do")
	public String userDelete() {
		return userService.userDelete();
	}

	@RequestMapping("/userDeleteProc.do")
	public String userDeleteProc(UserVO vo, HttpSession session) {
		return userService.userDeleteProc(vo, session);
	}

	
	// 회원가입 아이디 중복검사
	@RequestMapping(value="/userSelect.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String userSelect(Model model, UserVO vo, HttpServletRequest req) {
		return userService.userSelect(model, vo, req);
	}
	
	// 회원가입 및 정보
	
	@RequestMapping("/join.do")
	public String userRegister(Model model, HttpSession session) {
		return userService.userRegister(model, session);
	}
	
	@RequestMapping("/userJoin.do")
	public String userJoin(Model model, HttpSession session) {
		return userService.userJoin(model, session);
	}

	@RequestMapping("/userJoinProc.do")
	public String userJoinProc(UserVO vo, String command) throws Exception{
		return userService.userJoinProc(vo, command);
	}
}
