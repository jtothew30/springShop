package com.spring.shop.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String InfoChange(String id, Model model) throws Exception {
		model.addAttribute("dto",service.viewmem(id));
		logger.info("클릭한 id: " + id);
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
	
	@RequestMapping("main.do")
	public String Main() {
		return "/Mypage/InfoMain";
	}
	
	@RequestMapping("change.do")
	public String Change() {
		return "/Mypage/change";
	}
	
	@RequestMapping(value="login.do", method = RequestMethod.POST)
	public String login(Account account, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post login");
		System.out.println("로그인한ID: " +account.getId());
		HttpSession session = req.getSession();
		Account login = service.login(account);
		
		if(login == null) {
			session.setAttribute("account", null);
			rttr.addFlashAttribute("msg", false);
			System.out.println("로그인실패");
		} else {
			session.setAttribute("account", login);
			System.out.println("로그인성공");
		}
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		logger.info("get logout");
		session.invalidate();
		return "redirect:/index.jsp";
	}

	@RequestMapping(value="/Mypage/AccountDelete", method = RequestMethod.GET)
	public void GetDelete(Account account) throws Exception {
	 logger.info("GET delete");
	 System.out.println("시도중인name: " + account.getName());
	}
	
	@RequestMapping(value="/Mypage/AccountDelete", method= RequestMethod.POST)
	public String PostDelete(HttpSession session, Account vo, RedirectAttributes rttr) throws Exception {
		logger.info("POST delete");
		
		Account acc = (Account)session.getAttribute("account");
		
		String oldId = acc.getId();
		String newId = vo.getId();
		String oldPass = acc.getPw();
		String newPass = vo.getPw();
		
		System.out.println("oldpass!!: " + oldPass);
		System.out.println("newpass!!: " + newPass);
		
		if(!oldPass.equals(newPass) || !oldId.equals(newId)) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/Mypage/AccountDelete";
		} 
		
			System.out.println("탈퇴한 아이디: " + vo.getId());
			service.dbDelete(vo);
			session.invalidate();
			System.out.println("delete success");
			
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("refer.do")
	public String Reference() {
		return "/Mypage/reference";
	}
	
	@RequestMapping("orderList.do")
	public String orderList() {
		return "/Mypage/orderList";
	}
	
	@RequestMapping("list.do")
	public String memlist(Account account, Model model) throws Exception {
		
		List<Account> list = service.memlist(account);
		model.addAttribute("list", list);
		
		return "memList";
	}
}
