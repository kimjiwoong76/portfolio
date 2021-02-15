<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>

<script>
	$(function(){
		alert("접근 권한이 없습니다");
		history.back();
	});
</script>


<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
