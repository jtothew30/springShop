package com.spring.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@RequestMapping("main.do")
	public String adminMainpage() {
		return "admin/admin";
	}	
	
	@RequestMapping("productInsert.do")
	public String adminInsertpage() {
		return "admin/productInsert";
	}
}
