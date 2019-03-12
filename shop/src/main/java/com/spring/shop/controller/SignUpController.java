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
		logger.info("id:"+id);
		String result = service.dbCheck(id);
		logger.info("idcheck result:"+result);
		return result;
	}
	
	@RequestMapping("/acct_insert.do")
	public String acct_insert(Account account) throws Exception {
		logger.info("acct_insert 넘어온 id="+account.getId());
		logger.info("acct_insert 넘어온 pw="+account.getPw());
		logger.info("acct_insert 넘어온 name="+account.getName());
		logger.info("acct_insert 넘어온 age="+account.getAge());
		logger.info("acct_insert 넘어온 gender="+account.getGender());
		logger.info("acct_insert 넘어온 email="+account.getEmail());
		logger.info("acct_insert 넘어온 phone="+account.getPhone());		
		service.dbInsert(account);
		return "redirect:/main.do" ;
  }
}
