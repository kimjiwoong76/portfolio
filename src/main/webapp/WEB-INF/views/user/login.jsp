<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<%@ include file="/WEB-INF/views/inc/visual.jsp"%>
<div class="sub-content">
<div class="form">
        <div class="form_head">
            <p>LOGIN</p>
        </div>
        <div class="login_inner">
            <div class="form_inner">
                <form action="/loginProc.do" method="POST">
                    <div class="login_form clearfix">
                        <div class="login_input_area">
                            <div class="id_area input_area">
                                <input type="text" name="shop_id" placeholder="아이디">
                            </div>
                            <div class="pw_area input_area">
                                <input type="password" name="shop_pwd" placeholder="비밀번호">
                            </div>
                        </div>
                        <div class="login_form_btn">
                            <button class="login_form_submit">로그인</button>
                        </div>
                    </div>
                    <div class="check_area clearfix">
                        <div class="find_info">
                            <a href="/find_id.do">아이디찾기</a>
                            <a href="/find_pw.do">비밀번호찾기</a>
                        </div>
                        <!-- <div class="login_check">
                            <input type="checkbox" id="auto_login" class="form_chk_btn">
                            <label for="auto_login">자동로그인</label>
                        </div> -->
                    </div>
                    <c:if test="${not empty loginNull}">
							<p class="no_id_pw"><em>${loginNull}</em></p>
						</c:if>
                </form>
            </div>
            <div class="form_inner">
                <div class="login_member clearfix">
                    <p class="login_inner_info">처음 이용하시거나 아직 회원이 아니신가요?</p>
                    <a href="/userJoin.do" class="member_page">회원가입</a>
                </div>
            </div>
        </div>
    </div>
    </div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>