package com.spring.shop.controller.Cart;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.shop.vo.Production;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@ResponseBody
	@RequestMapping(value="addCart.do", method=RequestMethod.POST)
	public String addCart(HttpServletRequest request){
		System.out.println("addCart 집입 체크");
		
		String list = request.getParameter("list");
		Gson gson = new Gson();		
		Production[] proarray = gson.fromJson(list, Production[].class);
		List<Production> prolist = Arrays.asList(proarray);
	
		  for(Production pro : prolist) {
			  System.out.println("addCart pno:"+pro.getPno());
			  System.out.println("addCart options:"+pro.getOptions());
			  System.out.println("addCart outpirce:"+pro.getOutprice()); 
		  }
		 		
		return "ddd";
	}	
	
	
}
