<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header -->
<%@include file="../../../inc/header.jsp"%>
<!-- header -->

<div class="container panel panel-default" id="wrapper">
	<h3 class="panel-heading">검색 결과</h3>
	<div class="panel-body">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th scope="col">BNO</th>
					<th scope="col">TITLE</th>
					<th scope="col">WRITER</th>
					<th scope="col">DATE</th>
					<th scope="col">HIT</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="vo" varStatus="status">
					<tr>
						<td>${vo.bno}</td>
						<td>
							<a href="${pageContext.request.contextPath}/boardDetail?bno=${vo.bno}">${vo.btitle}</a>
						</td>
						<td>${vo.bname}</td>
						<td>${vo.bdate}</td>
						<td>${vo.bhit}</td>
					</tr>
				</c:forEach>
				<!-- button -->
				<tr>
					<td colspan="5">
						<a href="javascript:history.go(-1);" class="pull-right btn btn-warning">BACK</a>
					</td>
				</tr>
			</tbody>
		</table>	<!-- END table -->	
	</div>	<!-- END panel body -->
</div>	<!-- END container -->

<!-- footer -->
<%@include file="../../../inc/footer.jsp"%>
<!-- footer -->