package com.spring.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.shop.vo.Product;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
			
	@RequestMapping("main.do")
	public String adminMainpage() {
		return "admin/admin";
	}	
	
	@RequestMapping("productInsert.do")
	public String adminInsertPage() {
		return "admin/productInsert";
	}
	@RequestMapping(value="productInsert.do",method = RequestMethod.POST)
	public String productInsert(Product product) {
		logger.info(product.getPname());		
		logger.info(product.getBrand());		
		return "redirect:/admin/main.do";		
	}
	
	@RequestMapping(value="boardInsert.do")
	public String boardInsertPage() {
		return "admin/boardInsert";
	}
	
	@RequestMapping(value="boardInsert.do", method=RequestMethod.POST)
	public String boardInsert() {
		return "admin/main";
	}
	
	// 재고관리
	@RequestMapping("productList.do")
	public String productList() {
		ModelAndView mav = new ModelAndView("admin/productList");
		return "admin/productList";
	}
	// 게시글관리
	@RequestMapping("boardList.do")
	public String boardList() {
		return "admin/boardList";
	}
	
}
