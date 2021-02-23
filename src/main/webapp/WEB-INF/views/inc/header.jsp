<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	
	
	
	
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>마이스토리</title>
<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/resources/css/reset.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/common.css" />">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/sub-style.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/board.css" />">
	<link rel="stylesheet"
	href="<c:url value="/resources/css/community.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/board-theme.css" />">
<link rel="stylesheet" href="<c:url value="/resources/css/slick.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/slick-theme.css" />">
<link rel="stylesheet" href="/resources/css/form.css" />
<%-- <script type="text/javascript"
	src="<c:url value="/resources/js/jquery-1.8.3.min.js"/>"></script> --%>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/slick.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/custom.js" />"></script>
</head>

<body>
	<!-- <div class="banner">
		<a href="#!" class="banner-btn"> <img
			src="/resources/img/cart-btn.png" alt="" />
		</a>
		<div class="banner-box">
			<p>최근 본 상품</p>
			<ul>
				<li><a href="#!"> <span class="prd-pic"> <img
							src="/resources/img/cart-btn.png" alt="" />
					</span>
				</a></li>
			</ul>
		</div>
	</div> -->
	<div class="m-menu">
		<div class="m-menu-top clearfix">
			<div class="m-menu-lm-box">
				<c:choose>
					<c:when test="${shopMember eq null}">
						<ul>
							<li><a href="/userJoin.do">Join</a></li>
							<li><a href="/login.do">Login</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul>
							<li><a href="#!">${shopMember.shop_id} 님 환영합니다</a></li>
							<li><a href="/userUpdate.do">정보수정</a></li>
							<li><a href="/userDelete.do">회원탈퇴</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="m-menu-close">
				<a href="#!"> <i class="close-btn icon"></i>
				</a>
			</div>
		</div>
		<div class="m-menu-body">
			<div class="m-menu-box">
				<div class="m-menu-shop">
					<ul class="clearfix">
						<li><a href=""> <i class="mypage-icon"></i> <span>TOP 메뉴1</span>
						</a></li>
						<li><a href="/cart/cart.do"> <i class="m-cart-icon"></i> <span>장바구니</span>
						</a></li>
						<li><a href="#!"> <i class="delivery-icon"></i> <span>TOP 메뉴2</span>
						</a></li>
					</ul>
				</div>
			</div>
			<div class="m-menu-box">
				<div class="m-menu-popul">
					<ul class="clearfix">
						<li><a href="/product/list.do?cateCode=남자 의류">Man</a></li>
						<li><a href="/product/list.do?cateCode=여자 의류">Woman</a></li>
						<li><a href="/board/list">Board</a></li>
					</ul>
				</div>
			</div>
			<div class="m-menu-box">
				<div class="m-menu-box-tit">
					<p>카테고리</p>
				</div>
				<div class="m-menu-cate">
					<ul class="clearfix">
						<li><a href="#!">메뉴1(미구현)</a></li>
						<li><a href="#!">메뉴2(미구현)</a></li>
						<li><a href="#!">메뉴3(미구현)</a></li>
						<li><a href="#!">메뉴4(미구현)</a></li>
						<li><a href="#!">메뉴5(미구현)</a></li>
						<li><a href="#!">메뉴6(미구현)</a></li>
						<li><a href="#!">메뉴7(미구현)</a></li>
						<li><a href="#!">메뉴8(미구현)</a></li>
					</ul>
				</div>

			</div>
			<div class="m-menu-box">
				<div class="m-menu-list">
					<ul class="clearfix">
						<li><a href="#!"> <span class="m-notice-icon"></span>
								공지사항
						</a></li>
						<li><a href="#!"> <span class="m-quest-icon"></span>
								자주묻는질문
						</a></li>
						<li><a href="#!"> <span class="m-review-icon"></span>
								상품리뷰
						</a></li>
						<c:choose>
							<c:when test="${shopMember eq null}">
								<li class="m-login-area"><a href="/login.do"> <span
									class="m-login-icon"></span> 로그인
							</a></li>
							</c:when>
							<c:otherwise>
								<li class="m-login-area"><a href="/logout.do"> <span
									class="m-login-icon"></span> 로그아웃
							</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<header>
		<div class="container">
			<div class="row">
				<div class="top_header clearfix">
					<div class="member clearfix">
						<c:choose>
							<c:when test="${shopMember eq null}">
								<ul>
									<li><a href="/userJoin.do">Join</a></li>
									<li><a href="/login.do">Login</a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul>
									<li><a href="/logout.do">logout</a></li>
									<li><a href="#!">${shopMember.shop_id} 님 환영합니다</a></li>
									<li><a href="/userUpdate.do">정보수정</a></li>
									<li><a href="/userDelete.do">회원탈퇴</a></li>
								</ul>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="search_cart">
						<ul>
							<li><span>
									<form action="/search.do">
										<input type="text" name="prdName" />
										<button type="submit">검색</button>
									</form>
							</span> <a href="#!" class="search-btn"> <img
									src="/resources/img/search.png" alt=""></a></li>
							<li><a href="/cart/cart.do"> <img
									src="/resources/img/cart.png" alt="">
							</a></li>
						</ul>
					</div>
					<script type="text/javascript">
						$(function(){
							$(".search-btn").click(function(){
								$(".search_cart li span").toggleClass("on");
							});
						});
					</script>
				</div>
				<div class="header_wrap">
					<div class="logo">
						<h1>
							<a href="/"> JW</a>
						</h1>
					</div>
					<div class="pc-menu">
						<ul class="clearfix">
							<li><a href="/product/list.do?cateCode=남자 의류">Man</a></li>
							<li><a href="/product/list.do?cateCode=여자 의류">Woman</a></li>
							
							<li><a href="/board/list">Board</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</header>
	<script>
		$(function(){
			$(window).scroll(function(){
				if($(this).scrollTop() > 150){
					$(".top_header").addClass("scr-header");
				} else {
					$(".top_header").removeClass("scr-header");
				}
			});
		});
	</script>
	<div class="hamburger" id="hamburger-6">
		<span class="line"></span> <span class="line"></span> <span
			class="line"></span>
	</div>
	<div id="content">