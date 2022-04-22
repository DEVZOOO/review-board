/**
 * use in review list
 */

function getBoard(pstartno) {
	$.ajax({
		url : "${pageContext.request.contextPath}/board/boardPaging",
		type : "get",
		dataType : "json",
		data : {
			"pstartno" : pstartno
		},
		success : function(data) {
			// console.log(data);
			showBoard(data);
		},
		error : function(xhr, textStatus, errroThrown) {
			console.log("error");
		}
	}) // end ajax
} // end getList

function showBoard(data) {
	$("#list tbody").empty();

	// data 없을 경우
	if (!data) {
		var td = $("<td colspan='5'>").html('데이터가 없습니다.');
		var tr = $("<tr>").html(td);
		$("#list tbody").append(tr);
		return;
	}

	// 사용할 변수
	var CSS_CLASS = {
		PAGE : 'page',
		PAGE_BTN : 'page-btn',
		ACTIVE : 'active',
	};

	var list = data.list;
	var listCount = data.listcount;
	var cnt = 0;

	// 게시글 셋팅
	var listLen = list.length;
	for (var i = 0; i < listLen; i += 1) {
		var bno = $("<td>").html(listCount - cnt++);
		var bname = $("<td>").html(list[i].bname);
		var btitle = $("<td>").html(
				"<a href='${pageContext.request.contextPath}/boardDetail?bno="
						+ list[i].bno + "'>" + list[i].btitle + "</a>");
		var bcontent = $("<td>").html(list[i].bcontent);
		var bdate = $("<td>").html(list[i].bdate);
		var bhit = $("<td>").html(list[i].bhit);

		var tr = $("<tr>").html(bno).append(btitle).append(bname).append(bdate)
				.append(bhit);
		$("#list tbody").append(tr);
	} // end for

	var td = $("<td colspan='5'>")

	var startPageNum = data.startpage;
	var endPageNum = data.endpage;
	var currentPageNum = data.currentpage;
	var totalPageNum = data.pagetotal;

	// 이전버튼
	if (startPageNum != 1) {
		// td.html("<a href='" + (startPageNum - 2) * 10 + "' class='btn btn-default' id='prev'>이전</a>");
		td.html("<a href='" + (startPageNum - 2) * 10
				+ "' class='page-btn' id='prev'>이전</a>");
	} // end if

	// 페이지번호
	for (var i = startPageNum; i <= endPageNum; i += 1) {
		var color = "";
		/*
		if(i == currentPageNum) {
			color = "style='color: red; font-weight: bold;'";
		}
		var num = $("<a href='#' id='" + (i - 1) * 10 + "' class='btn btn-default page'" + color + ">").html(i);
		 */

		var classes = CSS_CLASS.PAGE_BTN + ' ' + CSS_CLASS.PAGE
				+ (i == currentPageNum ? ' ' + CSS_CLASS.ACTIVE : '');
		var num = $(
				"<a href='#' id='" + (i - 1) * 10 + "' class='" + classes
						+ "'>").html(i);

		td.append(num);
	} // end for

	// 다음버튼
	if (endPageNum != totalPageNum) {
		// td.append("<a href='" + (endPageNum * 10) + "' class='btn btn-default' id='next'>다음</a>");
		td.append("<a href='" + (endPageNum * 10) + "' class='"
				+ CSS_CLASS.PAGE_BTN + "' id='next'>다음</a>");
	} // end if

	var tr = $("<tr>").html(td);
	$("#list tbody").append(tr);
} // end showList