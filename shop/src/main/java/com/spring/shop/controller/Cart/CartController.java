package com.spring.shop.controller.Cart;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
import com.spring.shop.vo.Production;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Inject
	private CartService service;
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	
	@RequestMapping(value="cart.do")
	public String cart(Model model) throws Exception{
		String customer = "testID"; // need to edit for getting login user's id from session later~
		
		List<Cart> cartlist = service.getCartList(customer);
		model.addAttribute("cartlist", cartlist);
		return "Cart/cart";
	}
	
	
	@ResponseBody
	@RequestMapping(value="addCart.do", method=RequestMethod.POST)
	public String addCart(HttpServletRequest request) throws Exception{		
		int pbno = Integer.parseInt(request.getParameter("pbno"));
		String list = request.getParameter("list");
		String customer = "testID";
		
		System.out.println("addCart 집입 체크, pbno : " + pbno);
		
		Gson gson = new Gson();		
		Production[] proarray = gson.fromJson(list, Production[].class);
		List<Production> prolist = Arrays.asList(proarray);
		List<Cart> cartlist = new ArrayList<Cart>();
		
		  for(Production pro : prolist) {
			  System.out.println("addCart pno:"+pro.getPno());
			  System.out.println("addCart options:"+pro.getOptions());
			  System.out.println("addCart outpirce:"+pro.getOutprice()); 
			  System.out.println("addCart count:"+pro.getCount());
			  
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
		  
		return "ddd";
	}	
	
	
}
