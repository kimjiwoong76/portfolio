<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<%@ include file="/WEB-INF/views/inc/visual.jsp"%>
<div class="sub-content">
	<div class="form">
		<div class="form_head">
			<p>비밀번호찾기</p>
		</div>
		<div class="login_inner">
			<div class="form_inner">
				<div class="login_form clearfix">
					<form action="/mailSender2.do" method="POST">
						<div class="find_input_area">
							<input type="text" name="shop_id" placeholder="아이디를 입력해 주세요." />
							<input type="text" name="shop_email" placeholder="이메일을 입력해주세요" />
							<p>
								<button type="button" class="login_form_submit find_id_btn">비밀번호 찾기</button>
							</p>
							<p>
								<a href="#!">아이디 찾기</a>
							</p>
						</div>
					</form>
				</div>
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

<script>
	$(function(){
		$(".find_id_btn").click(function(){
			if($("input[name='shop_email']").val() == null){
				alert("이메일을 입력해 주세요");
				$(this).focus();
				return false;
			} else {
				$("form").submit();
			}
		});
	});
</script>

<%@ include file="/WEB-INF/views/inc/footer.jsp"%>