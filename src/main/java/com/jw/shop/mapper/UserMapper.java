package com.jw.shop.mapper;

import java.util.List;
import java.util.Map;

import com.jw.shop.domain.UserVO;

public interface UserMapper {
	
	void shopRegMember();
	
	// 로그인
	UserVO userLoginProc(UserVO vo) throws Exception;
	
	// 로그인을 위한 비밀번호 가져오기
	UserVO userLoginProc2(UserVO vo) throws Exception;
	
	// 회원가입
	void userJoinProc(UserVO vo);
	
	// 회원정보수정 페이지 정보 가져오기
	UserVO userUpdate(UserVO vo);
	//회원정보 수정
	void userUpdateProc(UserVO vo);
	// 임시비밀번호 발송
	void userPwUpdateProc(UserVO vo);
	
	// 회원탈퇴
	void userDeleteProc(UserVO vo);
	
	// 유저검색
	
	List<Map<String, Object>> userSelect(UserVO vo);

	UserVO userFindId(UserVO vo);

	UserVO userFindPw(String string);

}
