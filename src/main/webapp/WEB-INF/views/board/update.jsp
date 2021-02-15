<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<script src="/resources/ckeditor/ckeditor.js"></script>
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
                    <h3>고객센터 글쓰기</h3>
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
               	<div class="board-write">
               		<form action="/board/update/process" class="write-form">
               			<div class="write-subject">
               				<input type="text" name="b_subject" class="b_subject" value="${board.b_subject}" />
               			</div>
               			<div class="write-content">
               				<textearea name=b_content class="write-des" id="write-des">${board.b_content}</textearea>
               			</div>
               			<div class="write-btn">
               				<button type="button" onclick="history.back(-1)" class="cancel">취소</button>
               				<button type="submit" class="submit">수정</button>
               			</div>
               		</form>
               	</div>
               
            </div>
        </div>
    </div>
</div>
<script>
	var ckeditor_config = {
			resize_enaleb : false,
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode : CKEDITOR.ENTER_P,
			filebrowserUploadUrl : "/editorUpload.do"
	};
	CKEDITOR.replace("b_content", ckeditor_config);
	CKEDITOR.instances.b_content.setData(' ${board.b_content} ');
	
	$(function(){
		$(".write-form").submit(function(){
			if($(".b_subject").val() == ""){
				alert("제목을 입력하세요");
				return false;
			}
		});
	});
	
</script>

<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
