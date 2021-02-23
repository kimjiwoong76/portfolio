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
									
<%-- 										<c:forEach var="reply" items="${reply}"> --%>
<%-- 										<div class="comment-article" data-commentid="${reply.re_no}"> --%>
<!-- 											<div class="comment-info"> -->
<%-- 												<span>${reply.user_id}</span>  --%>
<%-- 												<span class="date">${reply.re_date}</span> --%>
<%-- 												<c:if test="${shopMember.shop_id eq reply.user_id}"> --%>
<%-- 													<button class="co-btn btn-modify" data-con="${reply.re_no}" aria-label="수정">수정</button> --%>
<!-- 											        <button class="co-btn btn-cancel"  aria-label="취소" style="display:none;">취소</button> -->
<!-- 											        <button class="co-btn btn-delete"  aria-label="삭제">삭제</button> -->
<%-- 										        </c:if> --%>
<!-- 											</div> -->
<%-- 											<div class="comment-contents ${reply.re_no}">${reply.re_content}</div> --%>
<!-- 										</div> -->
<%-- 										</c:forEach> --%>
									
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
										<button type="button" id="btn-contentUpdate"
											class="co-btn btn-confirm btn-contentUpdate btn-contentUpdateClone" aria-label="수정">수정</button>
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

<c:choose>
	<c:when test="${shopMember.shop_id != null}">
		<c:set var="shopMemberID" value="${shopMember.shop_id}" />
	</c:when>
	<c:otherwise>
		<c:set var="shopMemberID" value="손님" />
	</c:otherwise>
</c:choose>



<script>
	$(function(){
		getReplyList();
		
		function getFormatDate(date){
			var year = date.getFullYear();                                 //yyyy
			var month = (1 + date.getMonth());                     //M
			month = month >= 10 ? month : '0' + month;     // month 두자리로 저장
			var day = date.getDate();                                        //d
			day = day >= 10 ? day : '0' + day;                            //day 두자리로 저장
			return  year + '' + month + '' + day;
		}
		
		function getReplyList(){
			var b_no;
			b_no = ${board.b_no};
			$.ajax({
		        type:'GET',
		        url : "/reply/read/"+b_no,
		        data : b_no,
		        success : function(data){
		            var html = "";
		            var replyCnt = data.length;
		            var replyId;
		            var shopId;
		            shopId = "${shopMemberID}";
		            if(data.length > 0){
		            	html += "<div class='commentThread comment-thread'>"
		                for(i=0; i<data.length; i++){
		                	replyId = data[i].USER_ID;
		                	var date = new Date(data[i].RE_DATE);
				            date = getFormatDate(date);
		                    html += "<div class='comment-article' data-commentid='"+data[i].RE_NO+"'>";
		                    	html += "<div class='comment-info'>";
		                    		html += "<span>"+data[i].USER_ID+"</span>";
		                    		html += "<span class='date'>"+date+"</span>"; 
		                    		
		                    		if(shopId == replyId){      
			                    		html += "<button class='co-btn btn-modify' data-con='"+data[i].RE_NO+"' aria-label='수정'>수정</button>";
			                    		html += "<button class='co-btn btn-cancel'  aria-label='취소' style='display:none;'>취소</button>";
			                    		html += "<button class='co-btn btn-delete'  aria-label='삭제'>삭제</button>";
		                    		}
		                    	html += "</div>";
		                    	html += "<div class='comment-contents " +data[i].RE_NO +"'>"+data[i].RE_CONTENT+"</div>";
		                    html += "</div>";
		                }
		            	html += "</div>";
		                
		            } else {
		                 
		               console.log("실패");
		                
		            }
		            
//			            $("#cCnt").html(cCnt);
		            $(".comment-body").html(html);
		            
		        },
		        error:function(request,status,error){
		            console.log("실패");
		            console.log(request);
		       }
		        
		    });
		}

		
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
					    	getReplyList();
					          
					    },
					    error: function(data){
					    	alert("에러 입니다.");
					    }
					  });
				}
			});
			var clone = $(".comment-form-contentUpdate");
			$(".board-comment").on("click", ".btn-modify", function(){ 
// 				$(".btn-modify").css("display", "none");
// 				clone.css("display", "none");
				var parents = $(this).parents(".comment-article");
				$(this).css("display","none");
				$(this).siblings(".btn-cancel").css("display","inline-block");
				parents.append(clone); 
				parents.children(".comment-form-contentUpdate").css("display","block");
				var text = parents.children(".comment-contents").text();
				$(".contentUpdate").val(text);
			});
			$(".board-comment").on("click", ".btn-cancel", function(){
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
			
			$(".board-comment").on("click", ".btn-delete", function(){
				var delete_confirm = confirm("정말 삭제 하시겠습니까?");
				var reply_no = $(this).parents(".comment-article").data("commentid");
				if(delete_confirm){
					$.ajax({
					 	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					    url: "/reply/delete/"+reply_no,
					    type: "GET",
					    success: function(data){
					    	alert("댓글이 삭제되었습니다.");
					    	getReplyList();
					    },
					    error: function(data){
					    	alert("에러 입니다.");
					    }
					  });
				}
			});
			
			
			$(".board-comment").on("click", "#btn-contentUpdate", function(){
				var reply_no = $(this).parents(".comment-article").data("commentid");
				var re_content = $(".contentUpdate").val();
				$.ajax({
				 	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				    url: "/reply/update/"+reply_no,
				    data : {"re_content" : re_content, "re_no" : reply_no},
				    type: "GET",
				    success: function(data){
				    	alert("댓글이 수정되었습니다.");
				    	getReplyList();
				          
				    },
				    error: function(data){
				    	alert("에러 입니다.");
				    }
				  });
			});
		
		
	});
</script>

<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
