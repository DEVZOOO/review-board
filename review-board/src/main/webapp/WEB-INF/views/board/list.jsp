<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../inc/header.jsp"%>

<link rel="stylesheet" href="./resources/css/list.css">

<div class="container panel panel-default" id="wrapper">
	<h3 class="panel-heading">REVIEW</h3>
	<div class="panel-body">
		<table class="main-table" id="list">
			<caption>SPRING + PAGING + COMMENT + SEARCH</caption>
            <colgroup>
                <col width="5%">
                <col width="40%">
                <col width="15%">
                <col width="15%">
                <col width="5%">
            </colgroup>
			<thead>
				<tr>
					<th scope="col">NO</th>
					<th scope="col">TITLE</th>
					<th scope="col">WRITER</th>
					<th scope="col">DATE</th>
					<th scope="col">HIT</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>	<!-- END table -->
		<!-- foot -->
		<div class="row">
			<div class="dis-inline">
				<form action="${pageContext.request.contextPath}/boardSearch" method="get">
					<fieldset>
					<input type="text" name="btitle"/>
					<input type="submit" title="검색" value=" " class="btn main-btn btn-img search-btn"/>
					</fieldset>
				</form>
			</div>
			<div class="dis-inline pull-right">
				<a href="${pageContext.request.contextPath}/boardWrite" class="pull-right btn main-btn btn-img edit-btn" title="글작성">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
			</div>
		</div>	<!-- END row -->
	</div>	<!-- END body -->
</div>	<!-- END container -->
<script>
$(function() {
	getBoard(0);	// 글 리스트
	
	// 이전버튼
	$(document).on("click", "#prev", function() {
		pstartnumber = $(this).attr("href");
		getBoard(pstartnumber);
		return false;
	});
	// 페이지 이동
	$(document).on("click", 'a', function() {
		if ( $(this).attr("class").indexOf("page") != -1 ) {
			pstartnumber = $(this).attr("id");
			getBoard(pstartnumber);
			return false;
		}
	});
	// 다음버튼
	$(document).on("click", "#next", function() {
		pstartnumber = $(this).attr("href");
		getBoard(pstartnumber);
		return false;
	});
})	// end ready

</script>
<%@include file="../../../inc/footer.jsp"%>