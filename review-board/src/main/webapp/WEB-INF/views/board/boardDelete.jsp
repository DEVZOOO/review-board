<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- HEADER -->
<%@include file="../../../inc/header.jsp"%>
<!-- HEADER -->

<div class="container pane panel-danger" id="wrapper">
	<h3 class="panel-heading">글 삭제</h3>
	<form action="${pageContext.request.contextPath}/boardDelete" method="post" id="inputForm" class="panel-body">
		<fieldset>
			<legend>비밀번호</legend>
			<label for="password">비밀번호</label>
			<input type="password" id="password" name="bpass" class="form-control" />
			<p>(*) 수정, 삭제시 필수입니다.</p>
			<input type="hidden" value="${bno}" name="bno"/>
			<!-- BUTTON -->
			<p> <input type="submit" value="확인" class="btn btn-danger"/>
				<a href="javascript:history.go(-1);" class="btn btn-warning">취소</a> </p>
		</fieldset>
	</form>
</div>	<!-- END container -->
<!-- 빈칸검사 -->
<script>
	jQuery(document).ready(function() {
		jQuery("#inputForm").submit(function() {
			if(jQuery("#password").val() == "") {
				alert("비밀번호를 입력하세요!");
				jQuery("#password").focus();
				return false;
			}
		});
	});
</script>

<!-- FOOTER -->
<%@ include file="../../../inc/footer.jsp" %>
<!-- FOOTER -->