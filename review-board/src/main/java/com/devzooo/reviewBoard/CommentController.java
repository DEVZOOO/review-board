package com.devzooo.reviewBoard;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devzooo.domain.CommentVO;
import com.devzooo.service.CommentService;

@Controller
@RequestMapping("/comment/*")
public class CommentController {
	@Inject
	CommentService service;

	// =============================== comment ===============================
	// =============== 
	public List<Object> getComment(int bno) {
		return service.selectComment(bno);
	}	
	// c
		@RequestMapping(value="/commentInsert",method= {RequestMethod.GET,RequestMethod.POST})
		@ResponseBody
		public List<Object> commentInsert(CommentVO vo) {
			service.insertComment(vo);
			return getComment(vo.getBno());
		}
		// r
		@RequestMapping(value="/commentSearch",method= {RequestMethod.GET,RequestMethod.POST})
		@ResponseBody
		public List<Object> commentSearch(@RequestParam int bno) {
			return getComment(bno);
		}
		
		// u
		@RequestMapping(value="/commentUpdate",method= {RequestMethod.GET,RequestMethod.POST})
		@ResponseBody
		public List<Object> commentUpdate(CommentVO vo) throws IOException {
			service.updateComment(vo);
			return getComment(vo.getBno());
		}
		// d
		@RequestMapping(value="/commentDelete",method={RequestMethod.GET,RequestMethod.POST})
		@ResponseBody
		public List<Object> commentDelete(CommentVO vo) throws IOException {
			service.deleteComment(vo.getCno());
			return getComment(vo.getBno());
		}
		// 비밀번호 체크
		@RequestMapping(value="/passck",method={RequestMethod.GET,RequestMethod.POST})
		@ResponseBody
		public String passck(CommentVO vo) {
			int result = service.passck(vo);
			// 비번 맞을경우
			if(result == 1)
				return "ok";
			else
				return "no";
		}
		
		
}
