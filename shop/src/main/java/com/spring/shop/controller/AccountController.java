package com.spring.shop.controller;

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

import com.spring.shop.service.Account.AccountService;
import com.spring.shop.vo.Account;


@Controller
@RequestMapping("/account/*")
public class AccountController {
	
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	@Inject
	private AccountService service;
	
	// 마이페이지 - 개인정보 수정페이지 오픈
	@RequestMapping("infoChange.do")
	public String InfoChange(String id, Model model) throws Exception {
		Account account = service.viewmem(id);
		model.addAttribute("dto",account);
		return "MyPage/InfoChange";
	}	
	
	// 마이페이지 - 개인정보 수정 요청
	@RequestMapping("acct_InfoChange.do")
	public String InfoChange(Account account) throws Exception {
		service.dbUpdate(account);
		return "redirect:/main.do";
	}
	
	// 마이페이지 - 페이지 오픈
	@RequestMapping("mymain.do")
	public String Main() {
		return "MyPage/InfoMain";
	}
	// 마이페이지 - 회원정보수정 전 확인페이지 열기
	@RequestMapping("change.do")
	public String Change() {
		return "MyPage/change";
	}
	
	// ajax 로그인
	@ResponseBody
	@RequestMapping(value="loginAjax.do", method=RequestMethod.POST)
	public String loginAjax(HttpServletRequest request) throws Exception{
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		Account account = new Account();
		account.setId(id);
		account.setPw(pw);
		if(account!=null) logger.info("input:"+account.toString());
		HttpSession session = request.getSession();
		Account login = service.login(account);
		if(login!=null)logger.info("output:"+login.toString());
		String result = "";
		if(session.getAttribute("account") == null) {
			if(login == null) {
				session.setAttribute("account", null);
				result ="false";
			} else {
				session.setAttribute("account", login.getId());
				result ="true";
			}		
		}else {
			result = "overlap";
		}
		return result;		
	}
	// ajax 로그아웃
	@ResponseBody
	@RequestMapping(value="logoutAjax.do", method=RequestMethod.POST)
	public String logoutAjax(HttpServletRequest request) throws Exception{
		String result = "";
		if(request.getParameter("result") != null) {		
			HttpSession session = request.getSession();
			session.invalidate();
			result="true";
		}
		return result;		
	}
	
//	// old
//	@RequestMapping(value="login.do", method = RequestMethod.POST)
//	public String login(Account account, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
//		logger.info("post login");
//		System.out.println("로그인한ID: " +account.getId());
//		HttpSession session = req.getSession();
//		Account login = service.login(account);
//		
//		if(login == null) {
//			session.setAttribute("account", null);
//			rttr.addFlashAttribute("msg", false);
//			System.out.println("로그인실패");
//		} else {
//			session.setAttribute("account", login);
//			System.out.println("로그인성공");
//		}
//		return "redirect:/index.jsp";
//	}
//	//old
//	@RequestMapping(value="logout.do", method = RequestMethod.GET)
//	public String logout(HttpSession session) throws Exception {
//		logger.info("get logout");
//		session.invalidate();
//		return "redirect:/index.jsp";
//	}
	
	
	// 회원탈퇴 확인 페이지 오픈
	@RequestMapping("exitPage.do")
	public String exitPage() {
		return "MyPage/AccountExit";
	}
	
	// Ajax 회원탈퇴
	@ResponseBody
	@RequestMapping(value="accountDeleteAjax.do" , method= RequestMethod.POST)
	public String accountDeleteAjax(HttpServletRequest request, HttpSession session) throws Exception {
		String result = "";
		Account account = new Account();
		account.setId(request.getParameter("id"));
		account.setPw(request.getParameter("pw"));
		Account checkAccount = service.login(account);
		if(checkAccount == null) {
			result = "false";
		} else {
			service.dbDelete(account);
			session.invalidate();
			result = "true";
		}
		return result;
	}
	
//	//old
//	@RequestMapping(value="AccountDelete", method = RequestMethod.GET)
//	public void GetDelete(Account account) throws Exception {
//	 logger.info("GET delete");
//	 System.out.println("시도중인name: " + account.getName());
//	}
//	//old
//	@RequestMapping(value="AccountDelete", method= RequestMethod.POST)
//	public String PostDelete(HttpSession session, Account vo, RedirectAttributes rttr) throws Exception {
//		logger.info("POST delete");
//		
//		Account acc = (Account)session.getAttribute("account");
//		
//		String oldId = acc.getId();
//		String newId = vo.getId();
//		String oldPass = acc.getPw();
//		String newPass = vo.getPw();
//		
//		logger.info("oldpass!!: " + oldPass);
//		logger.info("newpass!!: " + newPass);
//		
//		if(!oldPass.equals(newPass) || !oldId.equals(newId)) {
//			rttr.addFlashAttribute("msg", false);
//			return "redirect:/account/AccountDelete";
//		} 
//		
//			logger.info("탈퇴한 이름: " + vo.getName());
//			logger.info("탈퇴한 아이디: " + vo.getId());
//			service.dbDelete(vo);
//			session.invalidate();
//			logger.info("delete success");
//			
//		return "redirect:/index.jsp";
//	}
	
//	@RequestMapping("refer.do")
//	public String Reference() {
//		return "MyPage/reference";
//	}
	
//	@RequestMapping("orderList.do")
//	public String orderList() {
//		return "MyPage/orderList";
//	}
	
//	@RequestMapping("list.do")
//	public String memlist(Account account, Model model) throws Exception {
//		
//		List<Account> list = service.memlist(account);
//		model.addAttribute("list", list);
//		
//		return "memList";
//	}
}
