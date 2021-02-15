<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script>
	function fn_paging(page) {
		location.href = "/board/list/"+page;
	}
</script>

<div class="paging">
                	<div>
	                    <c:if test="${paging.curRange ne 1 }">
	                        <a href="#" onClick="fn_paging(1)">[처음]</a> 
	                    </c:if>
	                    <c:if test="${paging.curPage ne 1}">
	                        <a href="#" onClick="fn_paging('${paging.prevPage }')">[이전]</a> 
	                    </c:if>
	                    <c:forEach var="pageNum" begin="${paging.startPage }" end="${paging.endPage }">
	                        <c:choose>
	                            <c:when test="${pageNum eq  paging.curPage}">
	                                <a href="#" class="on" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
	                            </c:when>
	                            <c:otherwise>
	                                <a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
	                            </c:otherwise>
	                        </c:choose>
	                    </c:forEach>
	                    <c:if test="${paging.curPage ne paging.pageCnt && paging.pageCnt > 0}">
	                        <a href="#" onClick="fn_paging('${paging.nextPage }')">[다음]</a> 
	                    </c:if>
	                    <c:if test="${paging.curRange ne paging.rangeCnt && paging.rangeCnt > 0}">
	                        <a href="#" onClick="fn_paging('${paging.pageCnt }')">[끝]</a> 
	                    </c:if>
	                </div>