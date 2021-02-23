<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<%@ include file="/WEB-INF/views/inc/visual.jsp"%>
<div class="sub-layout">
    <div class="sub-content">
        <div class="container">
            <div class="row">
                <!-- <div class="sub-category">
                    <ul>
                        <li>
                            <a href="#!">Hood<span>(5)</span></a>
                        </li>
                        <li>
                            <a href="#!">Tees<span>(80)</span></a>
                        </li>
                        <li>
                            <a href="#!">Shirts<span>(16)</span></a>
                        </li>
                        <li>
                            <a href="#!">Vest<span>(5)</span></a>
                        </li>
                        <li>
                            <a href="#!">Neat<span>(2)</span></a>
                        </li>
                    </ul>
                </div> -->
                <div class="view-content">
                    <div class="view-skin clearfix">
                        <div class="view-skin-left">
                            <div class="view-skin-img">
                                <img src="${view.prdImg}" alt="">
                            </div>
                            <div class="view-skin-img-btn">
                                <ul>
                                	<li>
                                        <a href="#!" class="skin-img-inner-btn">
                                            <img src="${view.prdImg}" alt="" />
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#!" class="skin-img-inner-btn">
                                            <img src="${view.prdImg2}" alt="" />
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#!" class="skin-img-inner-btn">
                                            <img src="${view.prdImg3}" alt="" />
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="view-skin-right">
                            <form action="/product/buy.do" id="viewForm">
                            <input type="hidden" name="prdNum" value="${view.prdNum}">
                            <h3>${view.prdName}</h3>
                            <%-- <div class="cost-price">
                                <p>${view.prdPrice}</p>
                            </div> --%>
                            <%--  
                            <div class="skin-tab">
                                <ul>
                                    <li>
                                        <a href="#!">
                                            ${view.prdDes}
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#!">Size</a>
                                    </li>
                                </ul>
                            </div>
                            --%>
                            <%-- <div class="skin-tab-content">
                                <div>
                                    <p>${view.prdDes}</p>
                                </div>
                            </div> --%>
                            <div class="skin-option">
                                <dl class="clearfix">
                                    <dt>COLOR</dt>
                                    <dd>
                                        <select name="itemColor" id="itemColor">
                                        	<c:forEach var="color" items="${color}"  varStatus="status">
                                            <option value="<c:out value='${color}'/>" ${status.first ? 'selected="selected"' : '' }>${color}</option>
                                            </c:forEach>
                                        </select>
                                    </dd>
                                </dl>
                                <script type="text/javascript">
                                	$(function(){                                	
                                		var itemColor = new Array();
                                		<c:forEach items="${color}" var="color">
                                			itemColor.push("${color}");
                                		</c:forEach>
                                	});
                                </script>
                                <dl class="clearfix">
                                    <dt>SIZE</dt>
                                    <dd>
                                        <select name="itemSize" id="">
                                            <c:forEach var="size" items="${size}">
                                            <option value="<c:out value='${size}' />">${size}</option>
                                            </c:forEach>
                                        </select>
                                    </dd>
                                </dl>
                            </div>
                            <div class="total-price">
                                <dl class="clearfix">
                                    <dt>TOTAL</dt>
                                    <dd>${view.prdPrice}</dd>
                                </dl>
                            </div>
                            <div class="item-shop-cart">
                                <button type="button" id="cart" data-toggle="modal" data-target="#myModal">ADD TO CART</button>
                                <button type="submit">BUY NOW</button>
                                <!--  
                                <a class="submit" href="/product/buy.do">BUY NOW</a>
                                -->
                            </div>
                            <div class="item-blank">
                         
                                <div class="item-list-page">
                                    <a href="#!" onClick="history.back();">
                                        LIST
                                    </a>
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                    <div class="view-detail">
                    	${view.prdDes}
                        <!-- <div class="view-detail-img">
                            <img src="/resources/img/view-detail-img.jpg" alt="">
                            <br>
                            <br>
                            <br>
                            <img src="/resources/img/view-detail-img.jpg" alt="">
                        </div>
                        <div class="view-detail-txt">
                            <h4>SHIPPING & RETURNS</h4>
                            <div class="dl-box clearfix">
                                <dl>
                                    <dt>Shipping information</dt>
                                    <dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit,</dd>
                                    <dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit,</dd>
                                    <dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit,</dd>
                                </dl>
                                <dl>
                                    <dt>Payment information</dt>
                                    <dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit,</dd>
                                    <dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit,</dd>
                                    <dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit,</dd>
                                </dl>
                                <dl>
                                    <dt>Exchange& Returns information</dt>
                                    <dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit,</dd>
                                    <dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit,</dd>
                                    <dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit,</dd>
                                </dl>
                            </div>
                        </div> -->
                    </div>
                    <!-- <div class="recommend">
                        <h4>REcommend Product</h4>
                         <div class="recommend-list">
                            <ul class="clearfix">
                                <li>
                                    <a href="#!">
                                        <div class="arrival-img">
                                            <img src="/resources/img/arrival-img1.jpg" alt="">
                                        </div>
                                        <div class="arrival-txt">
                                            <p class="item-subject">Black & Silver Jacket</p>
                                            <p class="item-price">$50.80</p>
                                        </div>
                                        <div class="arrival-icon">
                                            <span class="new_icon">NEW</span>
                                            <span class="best_icon">BEST</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#!">
                                        <div class="arrival-img">
                                            <img src="/resources/img/arrival-img2.jpg" alt="">
                                        </div>
                                        <div class="arrival-txt">
                                            <p class="item-subject">Black & Silver Jacket</p>
                                            <p class="item-price">$50.80</p>
                                        </div>
                                        <div class="arrival-icon">
                                            <span class="new_icon">NEW</span>
                                            <span class="best_icon">BEST</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#!">
                                        <div class="arrival-img">
                                            <img src="/resources/img/arrival-img3.jpg" alt="">
                                        </div>
                                        <div class="arrival-txt">
                                            <p class="item-subject">Black & Silver Jacket</p>
                                            <p class="item-price">$50.80</p>
                                        </div>
                                        <div class="arrival-icon">
                                            <span class="new_icon">NEW</span>
                                            <span class="best_icon">BEST</span>
                                        </div>
                                    </a>
                                </li>
                                   <li>
                                    <a href="#!">
                                        <div class="arrival-img">
                                            <img src="/resources/img/arrival-img1.jpg" alt="">
                                        </div>
                                        <div class="arrival-txt">
                                            <p class="item-subject">Black & Silver Jacket</p>
                                            <p class="item-price">$50.80</p>
                                        </div>
                                        <div class="arrival-icon">
                                            <span class="new_icon">NEW</span>
                                            <span class="best_icon">BEST</span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                         </div>
                    </div> -->
                </div>
            </div>
        </div>
    </div>
</div>


<script>

$(function() {
	$(".view-skin-img img").click(function() {
		window.open(this.href, "large_image", "location=yes,links=no,toolbar=no,top=10,left=10,width=600,height=600,resizable=yes,scrollbars=no,status=no");
		return false;
	});
	$(".skin-img-inner-btn").bind("click focus", function(){		
		var img_src = $(this).children('img').attr('src');
		var img_alt = $(this).children('img').attr('alt');
		$('.view-skin-img img').attr('src', img_src);
		$('.view-skin-img img').attr('alt', img_alt);
	});
	
	$("#cart").click(function(){
		var form = $("#viewForm").serialize();
		console.log(form);
		$.ajax({
		 	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		    url: "/cart/cartInsert.do",
		    type: "POST",
		    data: form,
		    success: function(data){
		          alert(data);
		    },
		    error: function(data){
		    	alert("중복된 상품이 카트에 있습니다");
		    }
		    /*
		    error: function (request, status, error){        
		        var msg = "ERROR : " + request.status + "<br>"
		      msg +=  + "내용 : " + request.responseText + "<br>" + error;
		      console.log(msg);              
		    }
		    */
		  });
	});
	
});




</script> 

<%@ include file="/WEB-INF/views/inc/footer.jsp"%>