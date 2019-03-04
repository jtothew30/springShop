package com.spring.shop.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.spring.shop.service.ProBoard.ProBoardService;
import com.spring.shop.vo.CategoryList;
import com.spring.shop.vo.Paging;
import com.spring.shop.vo.ProBoard;

@Controller
public class SearchController {

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	@Inject
	private ProBoardService service;

	@RequestMapping("/search.do")
	public ModelAndView search(Paging paging) {
		ModelAndView mav = new ModelAndView("search");
		
		logger.info("input"+paging.toString());
		
		//   items = {"listCate2":["",""], "listCate3":["","","",""]};
		if(paging.getOptionKwd()!= null) {			
			Gson gson = new Gson();
			String str = paging.getOptionKwd().toString();
			//logger.info("case A1:"+str);
			ArrayList<String> arr2 = new ArrayList<String>();
			ArrayList<String> arr3 = new ArrayList<String>();
			
			CategoryList cate = gson.fromJson(str, CategoryList.class);
			if(cate != null) {	
				//logger.info("case A2:"+cate.toString());
				String[] cate2 = cate.getListCate2();
				String[] cate3 = cate.getListCate3();				
				for (String string : cate2) {
					if(!arr2.contains(string))
					arr2.add(string);
				}
				for (String string : cate3) {
					if(!arr2.contains(string))
					arr3.add(string);
				}
			}
			paging.setListCate2(arr2);
			paging.setListCate3(arr3);
		}
		//logger.info(paging.toString());
		logger.info("검색조건:"+paging.getKwd()+","+paging.getListCate2()+","+paging.getListCate3());
		// 검색어 All counting --> for paging setting
		int allCount = service.getAllCount(paging);
		
		// 페이징 사용
		paging.setDisplayRow(12);
		paging.setTotalCount(allCount);
		
		//logger.info("AA:"+paging.toString());
		// 검색어 + category검색 + paging --> result
		List<ProBoard> pbList = service.selectProboardListPaging(paging);
			
		
		// 검색기반 카테고리 list
		ArrayList<String> cate2List = new ArrayList<String>();
		ArrayList<String> cate3List = new ArrayList<String>();
		if (pbList != null) {			
			for (ProBoard proBoard : pbList) {
				if (!cate2List.contains(proBoard.getCategory2())) {
					cate2List.add(proBoard.getCategory2());
				}
				if (!cate3List.contains(proBoard.getCategory3()))
					cate3List.add(proBoard.getCategory3());
			}
		}
		String[] chkboxCate2 = cate2List.toArray(new String[0]);
		String[] chkboxCate3 = cate3List.toArray(new String[0]);
		
		paging.setChkboxCate2(chkboxCate2);
		paging.setChkboxCate3(chkboxCate3);
		
		Gson gson = new Gson();
		String arr = gson.toJson(paging.getOptionKwd());
		paging.setOptionKwd(arr);
		logger.info("optionKwd:"+arr);
		mav.addObject("paging", paging);
		mav.addObject("cate2List", cate2List);
		mav.addObject("cate3List", cate3List);
		mav.addObject("pbList", pbList);
		return mav;
	}	
}
