package com.devzooo.reviewBoard;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devzooo.domain.BoardVO;
import com.devzooo.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller

public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Inject
	BoardService service;
	
	/*
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	*/
	
	// index
	@RequestMapping("/list")
	public String list() {
		return "/board/list";
	}
	// write form
	@RequestMapping(value="/boardWrite",method=RequestMethod.GET)
	public String boardWriteForm() {
		return "/board/boardWrite";
	}
	// write
		@RequestMapping(value="/boardWrite",method=RequestMethod.POST)
		public void boardWrite(BoardVO vo, HttpServletResponse response) throws IOException {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			String script = "";
			service.create(vo);
			script = "alert('異붽� �꽦怨�!'); location.href='index.jsp'";
			out.print("<script>"+script+"</script>");
		}
		// detail form
		@RequestMapping(value="/boardDetail",method=RequestMethod.GET)
		public String boardDetailForm(@RequestParam int bno,Model model) {
			// 議고쉶�닔 利앷�
			service.incrementHit(bno);
			// �뜲�씠�꽣 諛쏄린
			BoardVO vo = service.read(bno);
			model.addAttribute("vo", vo);
			return "/board/boardDetail";
		}
		// modify form
		@RequestMapping(value="/boardModify",method=RequestMethod.GET)
		public String boardModifyForm(@RequestParam int bno, Model model) {
			BoardVO vo = service.read(bno);
			model.addAttribute("vo", vo);
			return "/board/boardModify";
		}
		// modify
		@RequestMapping(value="/boardModify",method=RequestMethod.POST)
		public void boardModify(BoardVO vo, RedirectAttributes rttr, HttpServletResponse response) throws IOException {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			String script = "";
			// 鍮꾨�踰덊샇 留욎쑝硫�
			if(service.passck(vo) == 1) {
				service.update(vo);
				script = "alert('�닔�젙�꽦怨�!'); location.href='index.jsp'";
			}	
			else {
				script = "alert('鍮꾨�踰덊샇媛� ��由쎈땲�떎.'); history.go(-1);";
			}
			out.print("<script>"+script+"</script>");
		}	// end boardModify
		// delete form
		@RequestMapping(value="/boardDelete",method=RequestMethod.GET)
		public String boardDeleteForm(@RequestParam int bno,Model model) {
			model.addAttribute("bno", bno);
			return "/board/boardDelete";
		}
		// delete
		@RequestMapping(value="/boardDelete",method=RequestMethod.POST)
		public void boardDelete(BoardVO vo, HttpServletResponse response) throws IOException {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			String script = "";
			// 鍮꾨�踰덊샇 留욎쑝硫�
			if(service.passck(vo) == 1) {
				service.delete(vo.getBno());
				script = "alert('�궘�젣�꽦怨�!'); location.href='index.jsp'";
			}	// end if
			else {
				script = "alert('鍮꾨�踰덊샇媛� ��由쎈땲�떎.'); history.go(-1);";
			}
			out.print("<script>"+script+"</script>");	
		}	// end boardDelete
		// 湲� 寃��깋 list
		@RequestMapping("/boardSearch")
		public String boardSearch(@RequestParam String btitle, Model model) {
			List<Object> list = service.selectKeyword(btitle);
			model.addAttribute("list", list);
			return "/board/boardSearch";
		}
		
		// error
		@RequestMapping("/error500.do")
		public String error500(Model model) {
			logger.info(".................. error500");
			double e1 = 1/0;
			model.addAttribute("e1", e1);
			return "error_page";
		}
		
		
	
}
