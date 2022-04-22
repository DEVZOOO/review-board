<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<title>MJ 500 Error</title>
	</head>
	<body>
		<div class="container" style="margin-top:5%">
			<h3 class="panel-group">500 Error Page</h3>
			<%-- <p><%= exception.getMessage() %></p>	<!-- 에러메시지 -->	 --%>
			<p>관리자에게 문의바랍니다.</p>
			<p>kimmj9611@naver.com</p>
			<p> <a href="javascript:history.go(-1);" class="btn btn-success">뒤로가기</a> </p>
		</div>
	</body>
</html>

<!-- 190429
	작업내용 : 500 error page
 -->