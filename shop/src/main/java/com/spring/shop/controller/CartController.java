package com.spring.shop.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.shop.service.Cart.CartService;
import com.spring.shop.vo.Cart;
import com.spring.shop.vo.Paging;
import com.spring.shop.vo.Production;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Inject
	private CartService service;
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	
	@RequestMapping(value="cart.do")
	public String cart(Model model, Paging paging, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();	
		String customer = "";
		if(session.getAttribute("account") != null)
			customer = (String)session.getAttribute("account");
		
		paging.setCustomer(customer);		
		paging.setTotalCount(service.countCartList(customer));		
		List<Cart> cartlist = service.getCartList(paging);
		
		model.addAttribute("cartlist", cartlist);
		model.addAttribute("paging", paging);
		return "Cart/cart";
	}
	
	
	@ResponseBody
	@RequestMapping(value="addCart.do", method=RequestMethod.POST)
	public String addCart(HttpServletRequest request) throws Exception{		
		int pbno = Integer.parseInt(request.getParameter("pbno"));
		String list = request.getParameter("list");
		System.out.println("addCart 집입 체크, pbno : " + pbno);
		
		
		HttpSession session = request.getSession();	
		String customer = "";
		if(session.getAttribute("account") != null)
			customer = (String)session.getAttribute("account");
		
		List<Cart> mycart = service.getTotalCartList(customer); // for duplicate check
		
		
		Gson gson = new Gson();		
		Production[] proarray = gson.fromJson(list, Production[].class);
		List<Production> prolist = Arrays.asList(proarray);
		List<Cart> cartlist = new ArrayList<Cart>();		
	
		  for(Production pro : prolist) {
			  System.out.println("addCart pno:"+pro.getPno());
			  System.out.println("addCart options:"+pro.getOptions());
			  System.out.println("addCart outpirce:"+pro.getOutprice()); 
			  System.out.println("addCart count:"+pro.getCount());
			  
			  for(Cart c :mycart) {
				  if(c.getPno() == pro.getPno()) {
					  System.out.println("장바구니 상품과 중복");
					  return "false"; 
				  }
			  }
			  
			  Cart cart = new Cart();
			  cart.setPno(pro.getPno());
			  cart.setPbno(pbno);
			  cart.setCustomer(customer);
			  cart.setCount(pro.getCount());
			  cart.setPrice(pro.getOutprice());
			  cartlist.add(cart);
		  }
	  
		  service.addCart(cartlist);	
		  System.out.println("장바구니에 담음");
		  
		return "true";
	}	
	
	@ResponseBody
	@RequestMapping(value="deleteCart.do", method=RequestMethod.POST)
	public void deleteCart(HttpServletRequest request) throws Exception{		
		int pno = Integer.parseInt(request.getParameter("pno"));
		HttpSession session = request.getSession();	
		String customer = "";
		if(session.getAttribute("account") != null)
			customer = (String)session.getAttribute("account");
		
		Cart cart = new Cart();
		cart.setPno(pno);
		cart.setCustomer(customer);
		
		service.deleteCart(cart);	
	}
	
	
	@ResponseBody
	@RequestMapping(value="getOptions.do", method=RequestMethod.POST,  produces = "application/text; charset=utf8")
	public String getOptions(HttpServletRequest request) throws Exception{		
		int pbno = Integer.parseInt(request.getParameter("pbno"));
		
		List<Production> prolist = service.getOptions(pbno);
		Gson gson = new Gson();	
		String str = gson.toJson(prolist);
		System.out.println(str);
		
		return str;
	}
	
	
	@ResponseBody
	@RequestMapping(value="changeOption.do", method=RequestMethod.POST)
	public Boolean changeOption(HttpServletRequest request) throws Exception{		
		int lastpno = Integer.parseInt(request.getParameter("lastpno"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		int price = Integer.parseInt(request.getParameter("price"));
		int count = Integer.parseInt(request.getParameter("count"));
		boolean eq = Boolean.parseBoolean(request.getParameter("eq"));
		
		HttpSession session = request.getSession();	
		String customer = "";
		if(session.getAttribute("account") != null)
			customer = (String)session.getAttribute("account");
		
		if(!eq) {
			List<Cart> mycart = service.getTotalCartList(customer); // for duplicate check
			
			for(Cart c :mycart) {
				  if(c.getPno() == pno) {
					  System.out.println("장바구니 상품과 중복");
					  return false; 
				  }
			  }
		}		

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customer", customer);
		map.put("lastpno", lastpno);
		map.put("pno", pno);
		map.put("price", price);
		map.put("count", count);
		
		service.changeOption(map);
		return true;
	}
}
