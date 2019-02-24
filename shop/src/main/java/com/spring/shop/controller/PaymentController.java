package com.spring.shop.controller;

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
import com.spring.shop.service.Address.AddressService;
import com.spring.shop.service.Payment.PaymentService;
import com.spring.shop.vo.Address;
import com.spring.shop.vo.Cart;
import com.spring.shop.vo.Payrequest;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {
	
	@Inject
	private PaymentService service;
	
	@Inject
	private AddressService addrservice;
	
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@RequestMapping(value="paymentPage.do")
	public String cart(Model model) throws Exception{
		String customer = "testID"; 
		List<Payrequest> preqlist = service.getPayrequestList(customer);
		
		int total = 0;
		
		for(Payrequest preq : preqlist) {
			System.out.println("getPayrequestList pno : " + preq.getPno());
			System.out.println("getPayrequestList pbno : " + preq.getPbno());
			System.out.println("getPayrequestList options : " + preq.getOptions());
			System.out.println("getPayrequestList category1 : " + preq.getCategory1());
			System.out.println("getPayrequestList category2 : " + preq.getCategory2());
			System.out.println("getPayrequestList category3 : " + preq.getCategory3());
			System.out.println("getPayrequestList pname : " + preq.getPname());
			
			total += preq.getPrice() * preq.getCount();
		}
		
		List<Address> addrlist = addrservice.getAddressList(customer); // my delivery address list
		Address addr = new Address(); // get my base address from addrlist
		
		if(!addrlist.isEmpty()) {
			for(Address a : addrlist) {
				if(a.getBase().equals("true")) {
					addr = a;
					break;
				}
			}
			model.addAttribute("base", addr);
		}
		
		model.addAttribute("preqlist", preqlist);
		model.addAttribute("addrlist", addrlist);
		model.addAttribute("total", total);
		model.addAttribute("customer", customer);
		return "Payment/payment";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/payrequest.do", method=RequestMethod.POST)
	public void cart(HttpServletRequest request) throws Exception{
		System.out.println("payRequest.do 진입 체크");		
		String customer = "testID"; 
		
		service.createPayment(customer); // create new payment
		int payno = service.getPayno(customer); // get payno from payment table for create new payrequest datas
		
		
		String list = request.getParameter("list");	// get selected productions from cart page
		Gson gson = new Gson();		
		Cart[] cartarray = gson.fromJson(list, Cart[].class);		
		List<Cart> cartlist = Arrays.asList(cartarray);
		List<Payrequest> preqlist = new ArrayList<Payrequest>();	
		
		for(Cart cart : cartlist) {
			System.out.println("check pno : " + cart.getPno());
			System.out.println("check pbno : " + cart.getPbno());
			System.out.println("check count : " + cart.getCount());
			System.out.println("check price : " + cart.getPrice());
			
			Payrequest preq = new Payrequest();
			preq.setCustomer(customer);
			preq.setPno(cart.getPno());
			preq.setPbno(cart.getPbno());
			preq.setCount(cart.getCount());
			preq.setPrice(cart.getPrice());
			preq.setPayno(payno);
			preqlist.add(preq);
		}		
		service.createPayrequest(preqlist); // create new payrequest datas
		
	}
}
