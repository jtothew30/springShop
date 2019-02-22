package com.spring.shop.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.shop.service.ProBoardService;
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
		List<Production> prolist = service.getprolist(pbno);
		
		String path = prolist.get(0).getCategory1()+"/"+prolist.get(0).getCategory2()+ "/"+prolist.get(0).getCategory3()+"/"+prolist.get(0).getPname();
		System.out.println("img path:"+path);
		
		
		for(Production pro : prolist) {
			System.out.println("pno:"+pro.getPno()+"/pname:"+pro.getPname()+"/options:"+pro.getOptions());
		}	
		model.addAttribute("prolist", prolist);
		model.addAttribute("path", path);
		model.addAttribute("pbno", pbno);
		return "product";		
	}	
	
	
}
