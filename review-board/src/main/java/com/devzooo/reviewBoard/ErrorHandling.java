package com.devzooo.reviewBoard;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice		// 조언해주는 기능
public class ErrorHandling {
	private static final Logger logger = LoggerFactory.getLogger(ErrorHandling.class);
	
	@ExceptionHandler( Exception.class )
	public ModelAndView common(Exception e) {
		logger.info(e.toString());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/error_page");		// 넘길 파일 경로
		mav.addObject("exception", e);		// 처리결과물을 뷰에 던지기
		return mav;
	}
}	// end class
