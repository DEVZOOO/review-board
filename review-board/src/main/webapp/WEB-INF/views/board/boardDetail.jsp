<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../inc/header.jsp"%>

<div class="container panel panel-info" id="wrapper">
	<h3 class="panel-heading">DETAIL</h3>
	<div class="panel-body">
		<div class="panel-group">
			<span class="glyphicon glyphicon-ok"></span><label>조회수</label>
			<input disabled type="text" value="${vo.bhit}" class="form-control" />
		</div>
		<!-- 이름 -->
		<div class="panel-group">
			<span class="glyphicon glyphicon-ok"></span><label>이름</label>
			<input disabled type="text" value="${vo.bname}" class="form-control" />
		</div>
		<!-- 제목 -->
		<div class="panel-group">
			<span class="glyphicon glyphicon-ok"></span><label>제목</label>
			<input disabled type="text" value="${vo.btitle}" class="form-control" />
		</div>
		<!-- 내용 -->
		<div class="panel-group">
			<span class="glyphicon glyphicon-ok"></span><label>내용</label>
			<textarea disabled rows="5" class="form-control" style="resize: none;">${vo.bcontent}</textarea>
		</div>
		<!-- BUTTON 수정,삭제,목록보기 -->
		<p class="pull-right panel-body">
			<a href="<%=request.getContextPath()%>/boardModify?bno=${vo.bno}" class="btn btn-success">수정</a>
			<a href="<%=request.getContextPath()%>/boardDelete?bno=${vo.bno}" class="btn btn-danger">삭제</a>
			<a href="<%=request.getContextPath()%>/" class="btn btn-warning">목록보기</a> </p>
	</div>
</div>	<!-- END container -->
<div class="container panel panel-info">
	<h3 class="panel-heading">REPLY</h3>
	<!-- 댓글 목록 -->
	<div class="panel-body" id="comlist"></div>
	<!-- 댓글달기 -->
	<form action="#" method="post" id="replyForm" class="form-group">
		<fieldset>
		<legend>COMMENT</legend>
		<div class="row form-group">
			<!-- 작성자 -->
			<div class="col-sm-4">
				<input type="text" id="writer" name="writer" class="form-control" placeholder="작성자"/>
			</div>
			<!-- 암호 -->
			<div class="col-sm-4">
				<input type="password" id="pass" name="pass" class="form-control" placeholder="암호"/>
			</div>
			<!-- secret -->
			<div class="col-sm-4">
				<input type="checkbox" id="secret" name="secret"/>
				<label for="secret">SECRET</label>
			</div>
		</div>
		<div class="form-group">
			<textarea class="form-control" rows="5" id="comment" style="resize: none;"
					placeholder="여러분의 소중한 댓글을 달아주세용"></textarea>
		</div>
		<input type="button" title="댓글달기" id="create" value="댓글달기" class="btn btn-default"/>
		</fieldset>
	</form>
</div>	<!-- END container reply -->

<script>
	$(function() {
		var bno = ${vo.bno};
		var info = { "bno":bno };
		callAjax("${pageContext.request.contextPath}/comment/commentSearch",info);	// 댓글뿌려주기
		// 클릭이벤트
		$(document).on("click", ":button", function() {
			var id = $(this).attr("id");
			if(id == "create")
				return;
			var cno = id.substring(id.indexOf("b")+1, id.length);
			var url;
			var info;
			var msg;
			// cmodify
			if($(this).attr("class").indexOf("cmodify") != -1) {
				console.log("cmodify, id:"+id+", cno : "+cno);
				if($("#com"+cno).attr("readonly") == "readonly") {
					info = {"bno":bno, "cno":cno, "pass":$("#pass"+cno).val()};
					var pas = passck(info);
					// 비번맞을경우
					if(pas == "ok") {
						$("#com"+cno).html($("#realcomment"+cno).val());
						$("#com"+cno).removeAttr("readonly");
						$("#pass"+cno).removeAttr("readonly");
					}
					// 비번 틀릴경우
					else {
						alert('비밀번호가 틀립니다!');
					}
					return;
				}	// end if
				
				console.log($(":hidden#realpass"+cno).val());
				url = "${pageContext.request.contextPath}/comment/commentUpdate";
				info = {"bno":bno, "cno":cno,
						"comment":$("#com"+cno).val(),
						"pass":$("#pass"+cno).val()};
				
			}	// end cmodify
			// cdelete
			else if($(this).attr("class").indexOf("cdelete") != -1) {
				if($("#com"+cno).attr("readonly") == "readonly") {
					info = {"bno":bno, "cno":cno, "pass":$("#pass"+cno).val()};
					var pas = passck(info);
					// 비번맞을경우
					if(pas == "ok") {
						info = { "bno":bno,"cno":cno, "pass":$("#pass"+cno).val() };
						url = "${pageContext.request.contextPath}/comment/commentDelete";
					}
					else { 
						alert('비밀번호가 틀립니다!');
						return;
					}
				}	// end if
			}	// end cdelete
			callAjax(url,info);
		});	// end click
		// 댓글 추가
		$("#create").click(function() {
			var ids = [ "#writer", "#pass" ];
			// 빈칸검사
			for(var i=0; i<ids.length; i++) {
				if($(ids[i]).val() == "") {
					alert('빈칸을 채워주세요!');
					$(ids[i]).focus();
					return false;
				}	// end if
			}	// end for
			// ajax
			// 매개변수 셋팅
			var sec;
			if($('input[id="secret"]:checked').val())
				sec = "Y";
			else
				sec = "N";
			var info = { "bno":bno, 
					"writer":$("#writer").val(), "pass":$("#pass").val(),
					"secret":sec, "comment":$("#comment").val()
			};
			url = "${pageContext.request.contextPath}/comment/commentInsert";
			callAjax(url,info);
			// 초기화
			$("#writer").val("");
			$("#pass").val("");
			$("#comment").val("");
		});	// end create
	});	// end ready
	// ajax
	function callAjax(url, info) {
		$.ajax({
			url : url, type : "post", dataType : "json",
			data : info,
			success : function(data) {
				console.log(data);
				$("#comlist").empty();
				// ===== 댓글없으면 리턴 ===== 
				if(data.length == 0)
					return;
				// ===== 댓글있으면 ===== 
				// div 버전
				for(var i=0; i<data.length; i++) {
					var cno = data[i].cno;
					var div = $("<div class='panel panel-default'>");
					var comment = $("<textarea class='form-control' rows='2' style='resize: none' id='com"+cno+"' readonly='readonly'>");
					if(data[i].secret == "N") {
						comment.html(data[i].comment);
					}
					else {
						comment.html("비밀댓글입니다.");
					}
					var writer = $("<input type='text' readonly='readonly' id='writer"+cno+"'value='"+data[i].writer+"' class='form-control'>");
					var pass = $("<input type='password' id='pass"+cno+"' class='form-control' placeholder='비밀번호를 입력하세요'>");
					var realpass = $("<input type='hidden' id='realcomment"+cno+"' value='"+data[i].comment+"'>")
					var date = $("<input type='text' readonly='readonly' id='date"+cno+"'value='"+data[i].cdate+"' class='form-control'>");					
					var modifyb = $("<input type='button' id='modifyb"+cno+"'value='수정' class='btn btn-success cmodify'>");
					var deleteb = $("<input type='button' id='deleteb"+cno+"'value='삭제' class='btn btn-danger cdelete'>");
					
					var writerdiv = $("<div class='col-sm-4'>").html(writer);
					var passdiv = $("<div class='col-sm-4'>").html(pass);
					var datediv = $("<div class='col-sm-4'>").html(date);
					var comdiv = $("<div class='panel-group'>").html(comment);
					var btn = $("<div class='panel-group'>").append(modifyb).append(deleteb);
					var info = $("<div class='row panel-group'>").html(writerdiv).append(passdiv).append(datediv);
					div.html(info).append(comdiv).append(btn).append(realpass);
					$("#comlist").append(div);
				}	// end for
				// 테이블버전
				/**
				var table = $("<table class=\"table table-striped\">");
				var thead = $("<thead> <tr> <th>comment</th> <th>writer</th><th>date</th></thead>");
				var tbody = $("<tbody>");
				
				for(var i=0; i<data.length; i++) {
					var comment;
					if(data[i].secret == "N") {
						comment = $("<td>").html(data[i].comment);
					}
					else {
						comment = $("<td>").html("비밀댓글입니다.");
					}
					var writer = $("<td>").html(data[i].writer);
					var date = $("<td>").html(data[i].cdate);
					var modify = $("<input type='button' value='수정' class='btn btn-success cmodify'>");
					var deleteb = $("<input type='button' value='삭제' class='btn btn-danger cdelete'>");
					var btn = $("<td>").html(modify).append(deleteb);
					var tr = $("<tr>").html(comment).append(writer).append(date).append(btn);
					tbody.append(tr);
				}	// end for
				table.append(thead).append(tbody);
				$("#comlist").append(table);
				**/
			},
			error : function(xhr, textStatus, errorThrown) {
				console.log('ajax 실패');
				console.log('xhr : '+xhr+', status : '+textStatus+', error : '+errorThrown);
			}
		});	// end ajax
	}	// end callAjax
	// ajax 비밀번호 체크
	function passck(info) {
		var result;
		$.ajax({
			url : "${pageContext.request.contextPath}/comment/passck",
			type : "post", dataType : "text", data : info,
			async : false,	// 순차실행
			success : function(data) {
				result = data;
			},
			error : function(xhr, textStatus, errorThrown) {
				console.log("passck error");
			}
		})	// end ajax
		return result;
	}	// end passck
</script>

<%@include file="../../../inc/footer.jsp"%>