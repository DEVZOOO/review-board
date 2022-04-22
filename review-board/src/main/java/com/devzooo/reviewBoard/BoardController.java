package com.devzooo.reviewBoard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devzooo.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Inject
	BoardService service;

	@RequestMapping(value="/boardPaging",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> boardPaging(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		List<Object> list = new ArrayList<>(); 
		// 1.전체 글 갯수
		int listcount = service.readListCnt();
		// 2. 한 페이지에 보여줄 게시물 수
		int onepagelimit = 10;
		// 3.총 페이지 계산
		int pagetotal = (int)Math.ceil((float)listcount / onepagelimit);	// ##
		// 4. 하단 페이지 수
		int bottomlimit = 10;
		// 5.페이지 start번호 지정
		// 5-2. start번호(page index number)
		int pstartno = 0;
		if(request.getParameter("pstartno") != null) {
			pstartno = Integer.parseInt(request.getParameter("pstartno"));
			listcount = listcount - pstartno; 
		}
		// 5-1. 최신글 가져오기
		list = service.readTen(pstartno, onepagelimit);
		// 7. 현재페이지
		int currentpage = (int)(Math.ceil( (pstartno+1)/(float)onepagelimit ));
		// 6. 시작페이지
		int startpage = 0;
		// 8. 끝페이지
		int endpage = 0;
		if(currentpage < 10) {
			startpage = currentpage - (currentpage-1);
		}
		else {
			if(currentpage % 10 == 0) {
				startpage = currentpage - 9;
			}
			else {
				//startpage = currentpage - (currentpage-1 - ((currentpage/10)*10));
				startpage =	1 + ((currentpage/10)*10);
			}
		}
		endpage = startpage + 9;
		if(endpage > pagetotal)
			endpage = pagetotal;
				
		map.put("listcount", listcount);
		map.put("list", list);
		map.put("onepagelimit", onepagelimit);
		map.put("pagetotal", pagetotal);
		map.put("currentpage", currentpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("bottomlimit", bottomlimit);
		
		return map;
	}
	

}
