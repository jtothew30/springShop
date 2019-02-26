package com.spring.shop.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.shop.dao.AccountDao;
import com.spring.shop.service.AccountService;
import com.spring.shop.vo.Account;

@Controller
public class modifyController {
	
	private static final Logger logger = LoggerFactory.getLogger(SignUpController.class);
	
	@Inject
	private AccountService service;
	@Autowired
	AccountDao dao;
	
	@RequestMapping("infoChange.do")
	public String InfoChange() {
		return "/Mypage/InfoChange";
	}	
	
	@RequestMapping("acct_InfoChange.do")
	public String InfoChange(Account account) throws Exception {
		System.out.println("acct_InfoChange 넘어온 pw="+account.getPw());
		System.out.println("acct_InfoChange 넘어온 email="+account.getEmail());
		System.out.println("acct_InfoChange 넘어온 phone="+account.getPhone());
		service.dbUpdate(account);
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("change.do")
	public String Change() {
		return "/Mypage/change";
	}
	
	@RequestMapping("refer.do")
	public String Reference() {
		return "/Mypage/reference";
	}
	
	@RequestMapping("orderList.do")
	public String orderList() {
		return "/Mypage/orderList";
	}
	
	@RequestMapping("claimRequest.do")
	public String claim() {
		return "/Mypage/claim/ClaimRequest";
	}
	
	@RequestMapping("cancel.do")
	public String cancelStat() {
		return "/Mypage/claim/CancelStat";
	}
	
	@RequestMapping("rtnexch.do")
	public String rtnexch() {
		return "/Mypage/claim/RtnExchStat";
	}
	
	@RequestMapping("list.do")
	public String memlist(Account account, Model model) throws Exception {
		
		List<Account> list = service.memlist(account);
		model.addAttribute("list", list);
		
		return "memList";
	}
}
