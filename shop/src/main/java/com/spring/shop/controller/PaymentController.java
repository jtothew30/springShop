package com.spring.shop.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
import com.spring.shop.service.Account.AccountService;
import com.spring.shop.service.Address.AddressService;
import com.spring.shop.service.Payment.PaymentService;
import com.spring.shop.vo.Account;
import com.spring.shop.vo.Address;
import com.spring.shop.vo.Cart;
import com.spring.shop.vo.Payment;
import com.spring.shop.vo.Payrequest;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {
	
	@Inject
	private PaymentService service;
	
	@Inject
	private AddressService addrservice;
	
	@Inject
	private AccountService acctservice;
	
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@RequestMapping(value="paymentPage.do")
	public String paymentPage(Model model, HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();	
		String customer = "";
		if(session.getAttribute("account") != null)
			customer = (String)session.getAttribute("account");
		
		Account account = acctservice.viewmem(customer);		
				
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
			System.out.println("getPayrequestList stock : " + preq.getStock());
			
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
		model.addAttribute("account", account);
		return "Payment/payment";
	}
	
	
	
	@RequestMapping(value="paymentResult.do")
	public String paymentResultPage(Model model, HttpServletRequest request) throws Exception{
		int payno = Integer.parseInt(request.getParameter("payno"));		
		Payment payment = service.getPaymentResult(payno);
		
		model.addAttribute("payment", payment);
		return "Payment/paymentResult";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/payrequest.do", method=RequestMethod.POST)
	public void cart(HttpServletRequest request) throws Exception{
		System.out.println("payRequest.do 진입 체크");		
		HttpSession session = request.getSession();	
		
		String customer = "";
		if(session.getAttribute("account") != null)
			customer = (String)session.getAttribute("account");
		
		String delflag = request.getParameter("del");
		if(delflag.equals("true"))
			service.deletePayment(customer);
			
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
	
	@ResponseBody
	@RequestMapping(value="/checkStock.do", method=RequestMethod.POST)
	public String checkStock(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();	
		String customer = "";
		if(session.getAttribute("account") != null)
			customer = (String)session.getAttribute("account");
		
		String flag = "true";
		
		System.out.println("checkStock 진입 체크");
		
		List<Payrequest> stocklist = service.getPayrequestList(customer);
		for(Payrequest preq : stocklist) {
			System.out.println(preq.getCount() + " / " + preq.getStock());
			if(preq.getCount() > preq.getStock()) {
				flag="false"; // request count > stock!!!			
				break;
			}
		}
		System.out.println("checkStock flag 체크 : " + flag);
		return flag;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/checkPayment.do", method=RequestMethod.POST)
	public boolean checkPayment(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();	
		String customer = "";
		if(session.getAttribute("account") != null)
			customer = (String)session.getAttribute("account");
		 		
		System.out.println("checkPayment 진입 체크");
		
		int chk = service.checkPayment(customer);
		
		if(chk == 0)
			return true;	// 진행 중인 결제건 없음.
		else
			return false;  // 이미 진행 중인 결제건이 존재.
	}
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/deletePayment.do", method=RequestMethod.POST)
	public void deletePayment(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();	
		String customer = "";
		if(session.getAttribute("account") != null)
			customer = (String)session.getAttribute("account");
						
		System.out.println("deletePayment check");
		
		service.deletePayment(customer);	
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/payment.do", method=RequestMethod.POST)
	public int payment(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();	
		String customer = "";
		if(session.getAttribute("account") != null)
			customer = (String)session.getAttribute("account");
			
		String getpayment = request.getParameter("payment");

		Gson gson = new Gson();
		Payment payment = gson.fromJson(getpayment, Payment.class);
		payment.setCustomer(customer);
		
		System.out.println("payment.do getPayno : " + payment.getPayno());
		System.out.println("payment.do getCustomer : " + payment.getCustomer());
		System.out.println("payment.do getRecipient : " + payment.getRecipient());
		System.out.println("payment.do getPayname : " + payment.getPayname());
		System.out.println("payment.do getAddress1 : " + payment.getAddress1());
		System.out.println("payment.do getAddress2 : " + payment.getAddress2());
		System.out.println("payment.do getMemo : " + payment.getMemo());
		System.out.println("payment.do getPaydate : " + payment.getPaydate());
		System.out.println("payment.do getStatus : " + payment.getStatus());
		System.out.println("payment.do getTotal : " + payment.getTotal());
		
		service.payment(payment);
		
		return payment.getPayno();
	}
	
	
	@ResponseBody
	@RequestMapping(value="/registAddr.do", method=RequestMethod.POST)
	public void registAddr(HttpServletRequest request, Address address) throws Exception{
		HttpSession session = request.getSession();	
		String customer = "";
		if(session.getAttribute("account") != null)
			customer = (String)session.getAttribute("account");
		
		address.setCustomer(customer);
			
		boolean chkbase = addrservice.checkBase(customer);		
		if(chkbase)
			address.setBase("true");
		else
			address.setBase("false");
				
		System.out.println(address.toString());
		addrservice.registAddr(address);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/deleteAddr.do", method=RequestMethod.POST)
	public void deleteAddr(HttpServletRequest request) throws Exception{
		int addrno = Integer.parseInt(request.getParameter("addrno"));		
		addrservice.deleteAddr(addrno);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/setBase.do", method=RequestMethod.POST)
	public void setBase(HttpServletRequest request, Address address) throws Exception{	
		HttpSession session = request.getSession();	
		String customer = "";
		if(session.getAttribute("account") != null)
			customer = (String)session.getAttribute("account");
		
		address.setCustomer(customer);
		
		addrservice.setBase(address);
	}
}
