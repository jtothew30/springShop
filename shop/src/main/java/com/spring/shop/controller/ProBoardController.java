package com.spring.shop.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.shop.service.ProBoard.ProBoardService;
import com.spring.shop.vo.ProBoard;
import com.spring.shop.vo.Production;

@Controller
@RequestMapping("/proboard/*")
public class ProBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProBoardController.class);
	
	@Inject
	private ProBoardService service;
	
	@RequestMapping("product.do")
	public String product(Model model, HttpServletRequest request) throws Exception {
		int pbno = Integer.parseInt(request.getParameter("pbno"));	
		String tabs = request.getParameter("tabs");
		if(tabs == null || tabs.equals(""))
			tabs = "";
		
		List<Production> prolist = service.getprolist(pbno);
		
		String path = pbno+"/"+prolist.get(0).getPname();
		logger.info("img path:"+path);
		
		ProBoard proboard = service.selectProBoardDetail(pbno);
		
		
		for(Production pro : prolist) {
			logger.info("pno:"+pro.getPno()+"/pname:"+pro.getPname()+"/options:"+pro.getOptions());
		}	
		model.addAttribute("prolist", prolist);
		model.addAttribute("path", path);
		model.addAttribute("pbno", pbno);
		model.addAttribute("proboard", proboard);
		model.addAttribute("tabs", tabs);
		return "product";		
	}
	
	
	
	
}