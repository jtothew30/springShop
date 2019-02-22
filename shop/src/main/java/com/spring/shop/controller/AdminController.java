package com.spring.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.shop.service.ProBoard.ProBoardService;
import com.spring.shop.service.Production.ProductionService;
import com.spring.shop.vo.ProBoard;
import com.spring.shop.vo.Production;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	ProBoardService proBoardService;

	@Inject
	ProductionService productionService;

	@Autowired
	private ServletContext application;

	@RequestMapping("main.do")
	public String adminMainpage() {
		return "admin/admin";
	}

	@RequestMapping("productInsert.do")
	public String adminInsertPage() {
		return "admin/productInsert";
	}

	// 재고관리 - 상품등록
	@RequestMapping(value = "productInsert.do", method = RequestMethod.POST)
	public String productInsert(Production production) {
		// 제품등록
		productionService.insertProductionService(production);
		logger.info(production.toString());
		// 등록후 고유번호 가져오기
		Production pro = productionService.selectProductionOne(production);

		// 재고량초기화
		logger.info(pro.toString());
		productionService.resetProductionCount(pro);
		return "redirect:productList.do";
	}

	// 재고관리 - 리스트 출력
	@RequestMapping("productList.do")
	public ModelAndView productList() {
		ModelAndView mav = new ModelAndView("admin/productList");
		List<Production> list = productionService.productionSelectAllService();
		mav.addObject("list", list);
		return mav;
	}

	// 재고관리 - 재고량 update
	@RequestMapping("proCountUpdate.do")
	public ModelAndView proCountUpdate(Production production) {
		ModelAndView mav = new ModelAndView("redirect:productList.do");
		logger.info(String.valueOf(production.getPno()));
		logger.info(String.valueOf(production.getCount()));
		productionService.updateProductionCount(production);
		return mav;
	}
	
	//------------------------------------------------------------------------
	
	// 게시글관리 - 게시글 등록 페이지 이동
	@RequestMapping(value = "boardInsert.do")
	public ModelAndView boardInsertPage() {
		ModelAndView mav = new ModelAndView("admin/boardInsert");
		// production 에서 목록을 받아옴
		List<Production> plist = productionService.productionSelectAllService();
		mav.addObject("plist",plist);
		
		HashSet<String> list = new HashSet();
		for (Production p  : plist) {
			list.add(String.valueOf(p.getPname()));
		}	
		mav.addObject("list",list);
		return mav;
	}

	// 게시글관리 - 게시글 등록
	@RequestMapping(value = "boardInsert.do", method = RequestMethod.POST)
	public String boardInsert(ProBoard proBoard) throws Exception {
		logger.info(proBoard.toString());
		//proBoardService.insertProBoardService(proBoard);
		return "redirect:boardList.do";
	}
	
	

	// 게시글관리 - 리스트 출력
	@RequestMapping("boardList.do")
	public ModelAndView boardList() throws Exception {
		ModelAndView mav = new ModelAndView("admin/boardList");
		List<ProBoard> list = proBoardService.getlist();
		mav.addObject("list", list);
		return mav;
	}

}
