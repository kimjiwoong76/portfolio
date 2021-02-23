package com.jw.shop.service.impl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jw.shop.domain.UserVO;
import com.jw.shop.mapper.UserMapper;
import com.jw.shop.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	private final UserMapper userMapper;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	public UserServiceImpl(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	
	// 회원가입
	@Override
	public String userJoin(Model model, HttpSession session) {
		if (session.getAttribute("shopMember") == null) {
			model.addAttribute("test", "test23");
			return "/user/join";
//			return "/user/register";
		} else {
			return "redirect:/index.do";
		}
	}
	
	//회원가입 process
	
	@Override
	public String userJoinProc(UserVO vo, String command, Model model, HttpSession session) throws Exception {
		if (command == null) {
			return "redirect:index.do";
		} else {
			/*
			  System.out.println("회원가입 처리"); 
			  String encPassword = passwordEncoder.encode(vo.getShop_pwd()); 
			  vo.setShop_pwd(encPassword);
			  userMapper.userJoinProc(vo); 
			  return "/user/welcome";
			 */
			String encPassword = passwordEncoder.encode(vo.getShop_pwd());
			vo.setShop_pwd(encPassword);
			try {
				userMapper.userJoinProc(vo); // 디비 연결해서 값을 저장해줌
				System.out.println("회원가입 처리");
				UserVO login = userMapper.userLoginProc(vo);
				
				session.setAttribute("shopMember", login);
				return "redirect:/user/welcome";
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("회원가입 처리 실패");
				return "redirect:/user/fail";
			}
			//login 처리
			
//			System.out.println(rawPassword);
		}
	}
	//회원정보 수정
	@Override
	public String userUpdate(UserVO vo, Model model, HttpSession session) {
		UserVO ss = (UserVO) session.getAttribute("shopMember");
//		String encPassword = passwordEncoder.encode(vo.getShop_pwd());
//		vo.setShop_pwd(encPassword);
		UserVO userUpdate = userMapper.userUpdate(ss);
		model.addAttribute("userUpdate", userUpdate);
		return "/user/reg_update";
	}
	// 회원정보 수정 process
	@Override
	public String userUpdateProc(UserVO vo, Model model, HttpSession session, HttpServletResponse res) throws IOException {
		String encPassword = passwordEncoder.encode(vo.getShop_pwd());
		vo.setShop_pwd(encPassword);
//		UserVO ss = (UserVO) session.getAttribute("shopMember");
//		vo.setShop_id(ss.getShop_id());
		userMapper.userUpdateProc(vo);
//		res.setContentType("text/html; charset=UTF-8");
//		PrintWriter writer = res.getWriter();
//		writer.println("<script>");
//		writer.println("alert('정보 수정이 완료 되었습니다');");
//		writer.println("location.href= = /index.do");
//		writer.println("</script>");
//		writer.flush();
//		writer.close();
		return "redirect:/index.do";
	}
	
	//로그인
	@Override
	public String login(Model model, HttpSession session) {
		if (session.getAttribute("shopMember") == null) {
			model.addAttribute("page_name", "로그인");
			return "/user/login";
		} else {
			System.out.println(session.getAttribute("shopMember"));
			return "redirect:/index.do";
		}
	}
	
	
	// 로그인 process
	@Override
	public String loginProc(UserVO vo, Model model, HttpSession session, HttpServletRequest request) throws Exception {
		if(vo.getShop_id() == null) {
			return "/user/login";
		} else {
			String rawPassword;
			UserVO rawPassword2 = userMapper.userLoginProc2(vo);
			if(rawPassword2 != null) {
				rawPassword = rawPassword2.getShop_pwd();
				String raw = vo.getShop_pwd();
				if(passwordEncoder.matches(raw, rawPassword)) {
					// 로그인 성공 (실제 암호와 담긴 암호 디코딩하여 비교)
					String referer = request.getHeader("referer");
					request.getSession().setAttribute("redirectURI", referer);
					UserVO login = userMapper.userLoginProc(vo);
					session.setAttribute("shopMember", login);
					
					if(login.getShop_id().equals("admin")) {
						System.out.println("관리자님 환영합니다");
						return "redirect:/adm.do";
					} else {
						System.out.println("아이디 비번 틀림");
						model.addAttribute("loginNull", "아이디 또는 비밀번호가 틀렸습니다.");
						return "/user/login";
					}
				} else {
					System.out.println("아이디 비번 틀림");
					model.addAttribute("loginNull", "아이디 또는 비밀번호가 틀렸습니다.");
					return "/user/login";
				}
			} 
		}
		return "/index";
		
	}

	@Override
	public String logout(HttpSession session) {
		session.setAttribute("shopMember", null);
		return "redirect:/index.do";
	}

	
	//회원탈퇴

	@Override
	public String userDelete() {
		return "/user/delete";
	}

	@Override
	public String userDeleteProc(UserVO vo, HttpSession session) {
		UserVO ss = (UserVO) session.getAttribute("shopMember");
		vo.setShop_id(ss.getShop_id());
		userMapper.userDeleteProc(vo);
		session.removeAttribute("shopMember");
		return "redirect:/index.do";
	}


	@Override
	public String userSelect(Model model, UserVO vo, HttpServletRequest req) {
		String check = req.getParameter("shop_id");
		vo.setShop_id(check);
		UserVO userId = userMapper.userUpdate(vo);
		int val = 0;
		if(userId != null) {
			val = 1;
			model.addAttribute("check", val);
			return "중복되는 아이디가 있습니다.";
		} else {
			model.addAttribute("check", val);
			return "사용 가능한 아이디 입니다.";
		}		
	}


	@Override
	public String userRegister(Model model, HttpSession session) {
		return "/user/register";
	}


	
	
	@Override
	public String userFindId(UserVO vo, Model model) throws Exception {
		return "/user/find";
	}


	@Override
	public String userFindIdProc(UserVO vo, Model model) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("asdf");
		System.out.println(vo);
		UserVO result = userMapper.userFindId(vo);
		int check;
		if(result != null) {
			System.out.println("1");
			model.addAttribute("userFindId", result.getShop_id());
			model.addAttribute("check", check = 1);
		} else {
			System.out.println("asdf2");
			model.addAttribute("check", check = 2);
		}
		return "/user/find_result";
	}

	

}
