package com.spring.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.shop.service.ProBoard.ProBoardService;
import com.spring.shop.vo.Paging;
import com.spring.shop.vo.ProBoard;

@Controller
public class SearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	@Inject
	private ProBoardService service;

	@RequestMapping("/search.do")
	public ModelAndView search(@RequestParam(value = "kwd", required = false) String kwd, Paging paging) {
		ModelAndView mav = new ModelAndView("search");
		// 검색어 only
		List<ProBoard> pbList = service.getpbList(kwd);
		// 검색어 All counting --> ProBoard
		int allCount = service.getAllCount(kwd);
			
		// 페이징 사용
		paging.setDisplayRow(12);
		paging.setTotalCount(allCount);
		
		
		ArrayList<String> cate2List = new ArrayList<String>();
		ArrayList<String> cate3List = new ArrayList<String>();
		if(pbList !=null) {
			for (ProBoard proBoard : pbList) {
				if(!cate2List.contains(proBoard.getCategory2()))
					cate2List.add(proBoard.getCategory2());
				if(!cate3List.contains(proBoard.getCategory3()))
					cate3List.add(proBoard.getCategory3());
			}
		}		
		mav.addObject("paging",paging);
		mav.addObject("cate2List",cate2List);
		mav.addObject("cate3List",cate3List);
		mav.addObject("pbList", pbList);
		return mav;
	}
}
