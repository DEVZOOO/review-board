<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage = "true" %>
<% response.setStatus(200); %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<title>MJ 404 ERROR</title>
	</head>
	<body>
		<div class="container" style="margin-top:5%">
			<h3 class="panel-group">404 Error Page</h3>
			<p class="panel-group">관리자에게 문의해주세요.</p>
			<p class="panel-group">관리자 : kimmj9611@naver.com</p>
			<p> <a href="javascript:history.go(-1);" class="btn btn-success">뒤로가기</a> </p>
		</div>
	</body>
</html>

<!-- 190429
	작업내용 : 404error 페이지
 -->