package com.jw.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.jw.shop.domain.UserVO;
import com.jw.shop.mapper.UserMapper;

@Controller
public class CommonController {

	@Autowired
	private JavaMailSender mailSender;
	private final UserMapper userMapper;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	public CommonController(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	
	@RequestMapping("/test")
	public String test() {
		return "/test";
	}
	
	@RequestMapping("mailSender.do")
	public String mailSender(UserVO vo, HttpServletResponse response) throws IOException {
		
		UserVO result = userMapper.userFindId(vo);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(result == null) {
			out.println("<script>alert('입력한 아이디가 없습니다.'); history.go(-1);</script>");
			out.flush();
		} else {
			// 보내는사람 설정
			String setFrom = "kingjiwoong@naver.com";
			// 받는사람 이메일
			String tomail = result.getShop_email();
			// 제목
			String title = "마이스토리 " + result.getShop_name() +"님 아이디 찾기 결과 입니다.";
			// 내용
			String content = 
					"<html><body>" +
					"<div style='width:700px; padding:15px; text-align:center; border:1px solid #dedede; box-sizing:border-box; background:#FF3366; color:#fff;'>" +
					"<p>회원님의 아이디는 " + result.getShop_id() + " 입니다</p>" +
					"</div>" +
				    "</body></html>";
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				// 보내는 사람은 필수로 입력해야 함
				messageHelper.setFrom(setFrom);
				System.out.println("보내는사람" + setFrom);
				messageHelper.setTo(tomail);
				System.out.println("받는사람" + tomail);
				messageHelper.setSubject(title);
				System.out.println("제목" + title);
				messageHelper.setText(content, true);
				
				mailSender.send(message);
				out.println("<script>alert('가입 시 이메일로 전송 되었습니다.');</script>");
				out.flush();
				
			} catch (Exception e) {
				System.out.println(e);
				out.println("<script>alert('아이디 찾기 중 오류가 발생하였습니다 이메일을 확인하여 주세요.');</script>");
				out.flush();
			}
			
		}
		
		
		return "/user/login";
	}
	
	@RequestMapping("mailSender2.do")
	public String mailSender2(UserVO vo, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		UserVO result = userMapper.userFindId(vo);
		if(result == null) {
			
			out.println("<script>alert('입력한 정보가 잘못되었습니다.'); history.go(-1);</script>");
			
		} else {
			
			
			if(vo.getShop_email() != null && vo.getShop_id() != null) {
				
				// 인증번호 전송
				String key = "";
				for(int i = 0; i < 10; i++) {
					key += (char) ((Math.random() * 26) + 97);
				}
				
				// 보내는사람 설정
				String setFrom = "kingjiwoong@naver.com";
				// 받는사람 이메일
				String tomail = result.getShop_email();
				// 제목
				String title = "마이스토리" + result.getShop_name() +"님 임시비밀번호 입니다.";
				// 내용
				String content = 
						"<html><body>" +
						"<div style='width:700px; padding:15px; text-align:center; border:1px solid #dedede; box-sizing:border-box; background:#FF3366; color:#fff;'>" +
						"<p>회원님의  임시 비밀번호 입니다." + key +
						"</div>" +
					    "</body></html>";
				
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
					
					// 보내는 사람은 필수로 입력해야 함
					messageHelper.setFrom(setFrom);
					System.out.println("보내는사람" + setFrom);
					messageHelper.setTo(tomail);
					System.out.println("받는사람" + tomail);
					messageHelper.setSubject(title);
					System.out.println("제목" + title);
					messageHelper.setText(content, true);
					String encPassword = passwordEncoder.encode(key);
					vo.setShop_pwd(encPassword);
					System.out.println(vo.toString());
					userMapper.userPwUpdateProc(vo);
					
					mailSender.send(message);
					out.println("<script>alert('메일이 전송 되었습니다.');</script>");
					
					
				} catch (Exception e) {
					System.out.println(e);
				}
				
			}
			
			
		}
		out.flush();
		
		
		return "/user/login";
	}
	
	
}
