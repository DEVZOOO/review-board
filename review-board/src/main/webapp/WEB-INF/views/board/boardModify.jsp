<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../inc/header.jsp"%>

<div class="container panel panel-info" id="wrapper">
	<h3 class="panel-heading">MODIFY</h3>
	<form action="${pageContext.request.contextPath}/boardModify" method="post" class="form-group">
		<input type="hidden" value="${vo.bno}" name="bno"/>
		<!-- 이름 -->
		<div class="panel-group">
			<span class="glyphicon glyphicon-ok"></span><label>이름</label>
			<input readonly="readonly" type="text" name="bname" value="${vo.bname}" class="form-control" />
		</div>
		<!-- 비밀번호 -->
		<div class="form-group">
			<label for="password">비밀번호</label>
			<input type="password" id="password" name="bpass" class="form-control" />
			<p>(*) 수정, 삭제시 필수</p>
		</div>
		<!-- 제목 -->
		<div class="panel-group">
			<span class="glyphicon glyphicon-ok"></span><label>제목</label>
			<input type="text" value="${vo.btitle}" name="btitle" class="form-control" />
		</div>
		<!-- 내용 -->
		<div class="panel-group">
			<span class="glyphicon glyphicon-ok"></span><label>내용</label>
			<textarea rows="5" name="bcontent" class="form-control" style="resize: none;">${vo.bcontent}</textarea>
		</div>
		<!-- ============== BUTTON ============== -->
		<p class="pull-right panel-group">
			<input type="submit" title="수정" value="수정" class="btn btn-success" />
			<input type="reset" title="취소" value="취소" class="btn btn-default">
			<a href="<%=request.getContextPath()%>/" class="btn btn-warning">목록보기</a> </p>
	</form>
</div>

<%@include file="../../../inc/footer.jsp"%>