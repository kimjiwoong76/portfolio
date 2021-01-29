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
               <div class="board-view">
             		<div class="view-header">
             			<h2 class="view-title">${board.b_subject}</h2>
             			<div class="view-info">
             				<span class="writer">${board.user_id}</span>
             				<span class="date">${board.b_date}</span>
             				<span class="hit">${board.b_count}</span>
             			</div>	
             		</div>
             		<div class="view-body">
             			${board.b_content}
             		</div>
               </div>
            </div>
        </div>
    </div>
</div>


<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
