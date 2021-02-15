<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<script type="text/javascript">
	$(function() {
		$('.sec1-slide-wrap').slick({
			slidesToShow : 1,
			autoplay : true,
			autoplaySpeed : 3000,
			arrows : true,
			dots : false,
			centerMode : false,
			focusOnSelect : false,
			fade : false,
			prevArrow : $('.sec1-slide-btn .left'),
			nextArrow : $('.sec1-slide-btn .right'),
			responsive : [ {
				breakpoint : 768,
				settings : {
					arrows : false,
					dots : false
				}
			} ]
		});
	});
</script>
<div id="section1" class="section">
	<div class="sec1-slide-btn">
		<a href="#!" class="left"> </a> <a href="#!" class="right"> </a>
	</div>
	<div class="sec1-slide-wrap">
		<div class="sec1-slide sec1-slide1">
			<div class="container">
				<div class="row rel">
					<div class="sec1-txt">
						<h2>
							안녕하세요<br> 포트폴리오 홈페이지 입니다.
						</h2>
						<p>
							Lorem Ipsum is simply dummy text of the printing and typesetting
							<br> industry. Lorem Ipsum has been the industry's standard
							dummy.
						</p>
						<div class="more-btn">
							<a href="/product/list.do?cateCode=남자 의류">SHOP NOW</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="sec1-slide sec1-slide1">
			<div class="container">
				<div class="row rel">
					<div class="sec1-txt">
						<h2>
							THIS IS <br> MY STORY
						</h2>
						<p>
							Lorem Ipsum is simply dummy text of the printing and typesetting
							<br> industry. Lorem Ipsum has been the industry's standard
							dummy.
						</p>
						<div class="more-btn">
							<a href="/product/list.do?cateCode=남자 의류"">SHOP NOW</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="sec1-slide sec1-slide1">
			<div class="container">
				<div class="row rel">
					<div class="sec1-txt">
						<h2>
							THIS IS <br> MY STORY
						</h2>
						<p>
							Lorem Ipsum is simply dummy text of the printing and typesetting
							<br> industry. Lorem Ipsum has been the industry's standard
							dummy.
						</p>
						<div class="more-btn">
							<a href="/product/list.do?cateCode=여자 의류"">SHOP NOW</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="section2" class="section white_space">
	<div class="container">
		<div class="row">
			<div class="sec-tit">
				<h2>NEW ARRIVAL</h2>
			</div>
			<div class="arrival-item clearfix">
				<div class="arrival-slide-btn">
					<a href="#!" class="left"> <img
						src="/resources/img/left-btn.png" alt="">
					</a> <a href="#!" class="right"> <img
						src="/resources/img/right-btn.png" alt="">
					</a>
				</div>
				<div class="arrival-slide-wrap">
					<c:forEach var="result" items="${newItem.newItem}">
						<div class="arrival-slide">
							<div class="arrival-slide-item">
								<a href="/product/view.do?prdNum=${result.PRDNUM}">
									<div class="arrival-img">
										<!--                                            <img src="/resources/img/arrival-img1.jpg" alt="">-->
										<img src="${result.PRDIMG}" alt="">
									</div>
									<div class="arrival-txt">
										<p class="item-subject">${result.PRDNAME}</p>
										<p class="item-price">$ ${result.PRDPRICE}</p>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(function() {
		$('.arrival-slide-wrap').slick({
			slidesToShow : 4,
			autoplay : true,
			autoplaySpeed : 3000,
			arrows : true,
			dots : false,
			centerMode : false,
			focusOnSelect : false,
			fade : false,
			prevArrow : $('.arrival-slide-btn .left'),
			nextArrow : $('.arrival-slide-btn .right'),
			responsive : [ {
				breakpoint : 1024,
				settings : {
					slidesToShow : 3,
					arrows : false,
				}
			}, {
				breakpoint : 768,
				settings : {
					slidesToShow : 2,
					slidesToScroll : 1
				}
			} ]
		});
	});
</script>
<div id="section3" class="section">
	<div class="layer clearfix">
		<div class="main-best-item sec3-item">
			<a href="/product/list.do?cateCode=남자 의류">
				<div class="main-best-item-txt layer-item-txt">
					<h3>Man</h3>
					<p>
						Lorem ipsum dummy text is heavy <br> text lorem ipsum text is
						works.
					</p>
				</div>
			</a>
		</div>
		<div class="main-unique-item sec3-item">
			<a href="/product/list.do?cateCode=여자 의류">
				<div class="main-unique-item-txt layer-item-txt">
					<h3>Woman</h3>
					<p>
						Lorem ipsum dummy text is heavy <br> text lorem ipsum text is
						works.
					</p>
				</div>
			</a>
		</div>
		<div class="main-basic-item sec3-item">
			<a href="/product/list.do?cateCode=어린이">
				<div class="main-basic-item-txt layer-item-txt">
					<h3>BASIC</h3>
					<p>
						Lorem ipsum dummy text is heavy <br> text lorem ipsum text is
						works.
					</p>
				</div>
			</a>
		</div>
		<div class="main-sec3-banner sec3-item2">
			<img src="/resources/img/main-banner-txt.png" alt="">
		</div>
		<div class="sec3-item2">
			<div class="arrival-slide-btn">
				<a href="#!" class="left"> <img
					src="/resources/img/left-btn.png" alt="">
				</a> <a href="#!" class="right"> <img
					src="/resources/img/right-btn.png" alt="">
				</a>
			</div>
			<div class="sec3-slide-wrap">
				<c:forEach var="result" items="${newItem.girlItem}">
					<div class="arrival-slide">
						<div class="arrival-slide-item">
							<a href="/product/view.do?cateCode=여자 의류&prdNum=${result.PRDNUM}">
								<div class="arrival-img">
									<!--                                        <img src="/resources/img/arrival-img1.jpg" alt="">-->
									<img src="${result.PRDIMG}" alt="">
								</div>
								<div class="arrival-txt">
									<p class="item-subject">${result.PRDNAME}</p>
									<p class="item-price">$ ${result.PRDPRICE}</p>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<div id="section4" class="section white_space">
	<div class="container">
		<div class="row">
			<div class="sec-tit">
				<h2>Product</h2>
			</div>
			<!--  
                <div class="sub-category">
                    <ul>
                        <li>
                            <a href="/product/list.do">Hood<span>(5)</span></a>
                        </li>
                        <li>
                            <a href="/product/list.do">Tees<span>(80)</span></a>
                        </li>
                        <li>
                            <a href="/product/list.do">Shirts<span>(16)</span></a>
                        </li>
                        <li>
                            <a href="/product/list.do">Vest<span>(5)</span></a>
                        </li>
                        <li>
                            <a href="/product/list.do">Neat<span>(2)</span></a>
                        </li>
                    </ul>
                </div>
                -->
			<div class="list-item-box">
				<ul class="clearfix">
					<c:forEach var="result" items="${newItem.allItem}">
						<li><a href="/product/view.do?prdNum=${result.PRDNUM}">
								<div class="arrival-img">
									<img src='<c:out value="${result.PRDIMG}" />'>
								</div>
								<div class="arrival-txt">
									<p class="item-subject">
										<c:out value="${result.PRDNAME}" />
									</p>
									<p class="item-price">
										$
										<c:out value="${result.PRDPRICE}" />
									</p>
								</div> <!-- <div class="arrival-icon">
                                    <span class="new_icon">NEW</span>
                                    <span class="best_icon">BEST</span>
                                </div> -->
						</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>
<script>
	$(function() {
		$('.sec3-slide-wrap').slick({
			slidesToShow : 2,
			autoplay : true,
			autoplaySpeed : 3000,
			arrows : true,
			dots : true,
			centerMode : false,
			focusOnSelect : false,
			fade : false,
			prevArrow : $('.sec3-item2 .left'),
			nextArrow : $('.sec3-item2 .right'),
			responsive : [ {
				breakpoint : 1200,
				settings : {
					slidesToShow : 1,
					arrows : false,
					dots : true
				}
			}, {
				breakpoint : 500,
				settings : {
					slidesToShow : 2,
					slidesToScroll : 1,

				}
			} ]
		});
	});
</script>
<!-- <div id="section4" class="section white_space">
            <div class="sns-tit">
                <h2>INSTARGRAM</h2>
                <div class="sns-tag">
                    <p><span>#Mystory</span><span>#Modern</span><span>#Basic</span><span>#Simple</span><span>#Minimal</span></p>
                </div>
                <p>follow us on <em>#instargram</em></p>
            </div>
            <div class="sns-content">
                <div class="sns-slide-wrap clearfix">
                    <div>
                        <a href="#!">
                            <img src="/resources/img/instar-img1.jpg" alt="">
                        </a>
                    </div>
                    <div>
                        <a href="#!">
                            <img src="/resources/img/instar-img2.jpg" alt="">
                        </a>
                    </div>
                    <div>
                        <a href="#!">
                            <img src="/resources/img/instar-img3.jpg" alt="">
                        </a>
                    </div>
                    <div>
                        <a href="#!">
                            <img src="/resources/img/instar-img1.jpg" alt="">
                        </a>
                    </div>
                    <div>
                        <a href="#!">
                            <img src="/resources/img/instar-img2.jpg" alt="">
                        </a>
                    </div>
                    <div>
                        <a href="#!">
                            <img src="/resources/img/instar-img3.jpg" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </div> -->
<script>
	$(function() {
		$('.sns-slide-wrap').slick({
			slidesToShow : 6,
			autoplay : true,
			autoplaySpeed : 3000,
			arrows : true,
			dots : false,
			centerMode : false,
			focusOnSelect : false,
			fade : false,
			responsive : [ {
				breakpoint : 1200,
				settings : {
					slidesToShow : 5,
					arrows : false,
				}
			}, {
				breakpoint : 768,
				settings : {
					slidesToShow : 4,
					slidesToScroll : 1
				}
			}, {
				breakpoint : 500,
				settings : {
					slidesToShow : 3,
					slidesToScroll : 1
				}
			} ]
		});
	});
</script>

<%@ include file="/WEB-INF/views/inc/footer.jsp"%>