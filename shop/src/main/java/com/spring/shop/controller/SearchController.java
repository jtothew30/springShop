package com.spring.shop.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.shop.service.ProBoard.ProBoardService;
import com.spring.shop.vo.ProBoard;

@Controller
public class SearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	@Inject
	private ProBoardService service;

	@RequestMapping("/search.do")
	public ModelAndView search(@RequestParam(value = "kwd", required = false) String kwd) {
		ModelAndView mav = new ModelAndView("search");
		logger.info(kwd);

		List<ProBoard> pbList = service.getpbList(kwd);

		mav.addObject("pbList", pbList);
		return mav;
	}
}
