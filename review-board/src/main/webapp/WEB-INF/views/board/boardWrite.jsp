<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../inc/header.jsp"%>

<div class="container panel-group panel panel-primary" id="wrapper">
	<h3 class="panel-heading">글쓰기</h3>
	<!-- 등록폼 -->
	<form action="${pageContext.request.contextPath}/boardWrite" method="post" id="inputForm" class="form-group">
		<fieldset>
			<legend>글쓰기 폼</legend>
			<!-- 이름 -->
			<div class="form-group">
				<label for="name">이름</label>
				<input type="text" id="name" name="bname" class="form-control" />
			</div>
			<!-- 비밀번호 -->
			<div class="form-group">
				<label for="password">비밀번호</label>
				<input type="password" id="password" name="bpass" class="form-control" />
			<p>(*) 수정, 삭제시 필수</p>
			</div>
			<!-- 제목 -->
			<div class="form-group">
				<label for="title">제목</label>
				<input type="text" id="title" name="btitle" class="form-control" />
			</div>
			<!-- 내용 -->
			<div class="form-group">
				<label for="content">내용</label>
				<textarea rows="5" id="content" name="bcontent" class="form-control" style="resize: none;"></textarea>
			</div>
			<!-- BUTTON -->
			<div class="form-group">
				<p class="pull-right">
					<input type="submit" value="입력" class="btn btn-primary" />
					<a href="javascript:history.go(-1);" class="btn btn-default">취소</a>
					<a href="${pageContext.request.contextPath}/" class="btn btn-warning">목록보기</a> </p>
			</div>
		</fieldset>
	</form>
</div>	<!-- END container -->
<!-- 빈칸검사 -->
<script>
	jQuery(document).ready(function() {
		jQuery("#inputForm").submit(function() {
			if(jQuery("#name").val() == "") {
				alert("이름을 입력하세요!");
				jQuery("#name").focus();
				return false;
			}
			else if(jQuery("#email").val() == "") {
				alert("이메일을 입력하세요!");
				jQuery("#email").focus();
				return false;
			}
			else if(jQuery("#title").val() == "") {
				alert("빈칸을 채워주세요!");
				jQuery("#title").focus();
				return false;
			}
			else if(jQuery("#password").val() == "") {
				alert("비밀번호를 입력하세요!");
				jQuery("#password").focus();
				return false;
			}
			else if(jQuery("#content").val() == "") {
				alert("내용을 입력하세요!");
				jQuery("#content").focus();
				return false;
			}
		})
	});
</script>


<%@include file="../../../inc/footer.jsp"%>
