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
							<span class="writer">${board.user_id}</span> <span class="date">${board.b_date}</span>
							<span class="hit">${board.b_count}</span>
						</div>
					</div>
					<div class="view-body">${board.b_content}</div>
					<div class="board-opt">
						<div class="board-btn">
							<c:if test="${shopMember.shop_id == board.user_id}">
								<a href="/board/delete/${board.b_no}">삭제</a>
								<a href="/board/update/${board.b_no}">수정</a>
							</c:if>
							<a href="/board/list/">목록</a>
						</div>
					</div>
					<div class="board-comment">
						<div id="ncCommunityComment"
							class="nc-community-comment uikit-nccommunity-node">
							<div class="ncCommunityLoader nc-community-loader">
								<div class="loader-circle"></div>
							</div>
							<section class="wrap-comment ncCommentCommonWrap">
								<div class="comment-header">
									<h3 class="comment-title">
										<a href="#comment" name="comment">댓글</a> <span
											class="commentTotalCount">${reply_count} </span>
									</h3>
								</div>
								<div class="comment-form comment-form-contentWrite">
									<i class="fe-icon-reply"></i>
									<div class="comment-form-textarea">
										<c:choose>
											<c:when test="${shopMember.grade >= 1}">
												<c:set var="login" value="댓글..." />
											</c:when>
											<c:otherwise>
												<c:set var="login" value="로그인 후 댓글을 입력하실 수 있습니다." />
											</c:otherwise>
										</c:choose>
										<textarea class="contentWrite" name="re_content"
											placeholder="<c:out value="${login}" />"></textarea>
									</div>
									<c:if test="${shopMember.grade >= 1}">
									<div class="comment-toolbar">
										<div class="right">
											<span class="count-word"><em>0</em>/300</span>
											<button type="button"
												class="co-btn btn-confirm btn-contentWrite" aria-label="등록">등록</button>
										</div>
									</div>
									</c:if>
								</div>
								<div class="comment-body">
									<div class="commentThread comment-thread">
										<c:forEach var="reply" items="${reply}">
										<div class="comment-article" data-commentid="31924343">
											<div class="comment-info">
												<span>${reply.user_id}</span> 
												<span class="date">${reply.re_date}</span>
												<c:if test="${shopMember.shop_id eq reply.user_id}">
													<button class="co-btn btn-modify" data-con="${reply.re_no}" aria-label="수정">수정</button>
											        <button class="co-btn btn-cancel"  aria-label="취소" style="display:none;">취소</button>
											        <button class="co-btn btn-delete"  aria-label="삭제">삭제</button>
										        </c:if>
											</div>
											<div class="comment-contents ${reply.re_no}">${reply.re_content}</div>
										</div>
										</c:forEach>
									</div>
								</div>
								<button class="nc-comment-more" style="display: none;">
									<span class="txt">더보기</span>
								</button>
							</section>
							<div class="comment-form comment-form-contentUpdate " style="display:none">
								<i class="fe-icon-reply"></i>
								<div class="comment-form-textarea">
									<textarea class="contentUpdate" name="re_content"
										placeholder="댓글은 300자까지 작성 가능합니다."></textarea>
									<textarea class="contentUpdate"
										placeholder="댓글은 300자까지 작성 가능합니다."
										style="position: absolute; top: 0px; left: -99999px;"></textarea>
								</div>
								<div class="comment-toolbar">
									<div class="left"></div>
									<div class="right">
										<span class="count-word"><em>0</em>/300</span>
										<button type="button"
											class="co-btn btn-confirm btn-contentUpdate" aria-label="수정">수정</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(function(){
		$('.contentWrite').keyup(function (e){
		    var content = $(this).val();
		    $('.count-word em').text(content.length);    //글자수 실시간 카운팅

		    if (content.length > 300){
		        alert("최대 300자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 300));
		        $('.count-word em').text("300");
		    }
		});
			$(".btn-confirm").click(function(){
				var input = $("textarea[name=re_content]").val();
				var input2 = ${board.b_no}
				if(input.length > 0){
					$.ajax({
					 	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					    url: "/reply/insert.do",
					    type: "GET",
					    data: {"re_content" : input, "bo_no" : input2},
					    success: function(data){
					    	alert("댓글이 등록 되었습니다.");
					    	$("[name=re_content]").val("");
					          
					    },
					    error: function(data){
					    	alert("에러 입니다.");
					    }
					  });
				}
			});
			var clone = $(".comment-form-contentUpdate").clone();
			$(".btn-modify").click(function(){
				var parents = $(this).parents(".comment-article");
				$(this).css("display","none");
				$(this).siblings(".btn-cancel").css("display","inline-block");
				parents.append(clone); 
				parents.children(".comment-form-contentUpdate").css("display","block");
				var text = parents.children(".comment-contents").text();
				$(".comment-form-contentUpdate [name=re_content]").val(text);
			});
			$(".btn-cancel").click(function(){
				var parents = $(this).parents(".comment-article");
				$(this).css("display","none");
				$(this).siblings(".btn-modify").css("display","inline-block");
				parents.children(".comment-form-contentUpdate").remove();
			});
			
			$(".contentWrite").focus(function(){
				if(${shopMember.grade == null}){
					var result = confirm("로그인 후 댓글을 이용 할 수 있습니다.");
					if(result){
						location.href="/login.do";
					}
					
				}
			});
			
			function getReplyList(){
				$.ajax({
			        type:'GET',
			        url : "<c:url value='/reply/read'/>",
			        dataType : "json",
			        success : function(data){
			            console.log(data);
			            var html = "";
			            var cCnt = data.length;
			            
			            if(data.length > 0){
			                
			                for(i=0; i<data.length; i++){
			                    html += "<div>";
			                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
			                    html += data[i].comment + "<tr><td></td></tr>";
			                    html += "</table></div>";
			                    html += "</div>";
			                }
			                
			            } else {
			                
			                html += "<div>";
			                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
			                html += "</table></div>";
			                html += "</div>";
			                
			            }
			            
			            $("#cCnt").html(cCnt);
			            $("#commentList").html(html);
			            
			        },
			        error:function(request,status,error){
			            
			       }
			        
			    });
			}
			
	});
</script>

<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
