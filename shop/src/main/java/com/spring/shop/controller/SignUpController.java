package com.spring.shop.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.shop.service.Account.AccountService;
import com.spring.shop.vo.Account;

@Controller
@RequestMapping("/signUp/*")
public class SignUpController {
	
	private static final Logger logger = LoggerFactory.getLogger(SignUpController.class);
	
	@Inject
	private AccountService service;
	
	@RequestMapping("signUp.do")
	public String signUpPage() {
		return "SignUp/signUp";
	}	
	
	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idCheck(HttpServletRequest request) throws Exception {
		String id = request.getParameter("id");
		System.out.println("id:"+id);
		String result = service.dbCheck(id);
		System.out.println("idcheck result:"+result);
		return result;
	}
	
	@RequestMapping("/acct_insert.do")
	public String acct_insert(Account account) throws Exception {
		System.out.println("acct_insert 넘어온 id="+account.getId());
		System.out.println("acct_insert 넘어온 pw="+account.getPw());
		System.out.println("acct_insert 넘어온 name="+account.getName());
		System.out.println("acct_insert 넘어온 age="+account.getAge());
		System.out.println("acct_insert 넘어온 gender="+account.getGender());
		System.out.println("acct_insert 넘어온 email="+account.getEmail());
		System.out.println("acct_insert 넘어온 phone="+account.getPhone());		
		service.dbInsert(account);
		return "redirect:/index.jsp" ;
  }
}