<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<!-- 
<script>
	var cate = '<c:out value="${cate}" />';
	function fn_paging(curPage) {
		location.href = "/product/list.do?cateCode="+ cate +"&curPage=" + curPage;
	}
</script> -->

<div class="sub-layout">
    <div class="sub-visual">
        <div class="sub-visual-txt">
            <h2>My Life Style</h2>
        </div>
    </div>
    <div class="sub-content">
        <div class="container">
            <div class="row">
                <div class="sub-tit">
                    <p>COMMUNITY</p>
                    <h3>고객센터</h3>
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
                <c:if test="${shopMember.grade >= 1}">
				 <div class="board-opt">
				 		<a href="/board/write">글쓰기</a>
				 </div>
				 </c:if> 
                <ul class="board board-list-default">
               <c:forEach var="result" items="${list}">
			        <li class="board-items">
			            <div class="title">
			                <a href="/board/view/${result.B_NO}">${result.B_SUBJECT}</a>
			                <c:if test="${result.REPLY_COUNT >= 1}">
			                <div class="count">
				                <span class="count-comment">
				                	<em>[${result.REPLY_COUNT}]</em>
				                </span>
			                </div>
			                </c:if>
<!-- 			                <div class="count"> -->
<!-- 			                    <span class="count-like">1</span> -->
<!-- 			                    <span class="count-comment">3</span> -->
<!-- 			                </div> -->
			            </div>
			            <div class="info">
			                <span class="writer">${result.USER_ID }</span>
			                <span class="date">
			                	<fmt:formatDate value="${result.B_DATE}" pattern="yy.MM.dd"/>
			                </span>
			                <span class="hit">${result.B_COUNT }</span>
			            </div>
			        </li>
               </c:forEach>
               </ul>
               
               <%@ include file="/WEB-INF/views/inc/paging.jsp"%>
            </div>
        </div>
    </div>
</div>


<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
