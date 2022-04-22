<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../../inc/header.jsp" %>

<div class="container">
	<h3>ERROR_PAGE</h3>
	<p>관리자에게 문의바랍니다.</p>
	<p><a href="javascript:history.go(-1);" class="btn btn-default">HOME</a></p>
	<h4><c:out value="${exception.getMessage()}"></c:out></h4>
	<ul>
		<c:forEach var="i" items="${exception.getStackTrace()}" varStatus="status">
			<li><c:out value="${i}"></c:out></li>
		</c:forEach>
	</ul>
</div>	<!-- END container -->

<%@include file="../../inc/footer.jsp" %>