package com.spring.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.spring.shop.service.MyPage.MyPageService;
import com.spring.shop.vo.Payment;
import com.spring.shop.vo.Payrequest;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	@Inject
	private MyPageService service;

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@RequestMapping(value="myorder.do")
	public String myOrder(Model model) throws Exception{
		String customer = "testID"; // need to edit for getting login user's id from session later~
		
		List<Payment> plist = service.getMyOrderList(customer);
		model.addAttribute("plist", plist);
		return "MyPage/myorder";
	}
	
	@RequestMapping(value="myclaim.do")
	public String myclaim(Model model) throws Exception{
		String customer = "testID"; // need to edit for getting login user's id from session later~
		
		List<Payment> plist = service.getMyClaimList(customer);
		model.addAttribute("plist", plist);
		return "MyPage/myclaim";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="getPayrequestList.do", method=RequestMethod.POST,  produces="text/plain;charset=UTF-8")
	public String getPayrequestList(HttpServletRequest request) throws Exception{
		int payno = Integer.parseInt(request.getParameter("payno"));
		System.out.println("check : " + payno);
		List<Payrequest> preqlist = service.getPayrequestList(payno);

		Gson gson = new Gson();
		String str = gson.toJson(preqlist);
		System.out.println(str);
		
		return str;
	}
	
	
	@RequestMapping(value="searchOrderDate.do", method=RequestMethod.GET)
	public String searchOrderDate(Model model,HttpServletRequest request) throws Exception{
		String todate = request.getParameter("todate");
		String fromdate = request.getParameter("fromdate");
		String customer = "testID"; // need to edit for getting login user's id from session later~
		
		System.out.println("searchDate.do todate:"+todate+"/fromdate:"+fromdate);
		
		Map<String, String> map = new HashMap();
		map.put("todate", todate);
		map.put("fromdate", fromdate);
		map.put("customer", customer);
		
		List<Payment> plist = service.searchOrderDate(map);

		Gson gson = new Gson();
		String str = gson.toJson(plist);
		System.out.println(str);
		
		
		model.addAttribute("plist", plist);
		return "MyPage/myorder";
	}
	
	
	@RequestMapping(value="searchClaimDate.do", method=RequestMethod.GET)
	public String searchClaimDate(Model model,HttpServletRequest request) throws Exception{
		String todate = request.getParameter("todate");
		String fromdate = request.getParameter("fromdate");
		String customer = "testID"; // need to edit for getting login user's id from session later~
		
		System.out.println("searchClaimDate.do todate:"+todate+"/fromdate:"+fromdate);
		
		Map<String, String> map = new HashMap();
		map.put("todate", todate);
		map.put("fromdate", fromdate);
		map.put("customer", customer);
		
		List<Payment> plist = service.searchClaimDate(map);

		Gson gson = new Gson();
		String str = gson.toJson(plist);
		System.out.println(str);
		
		
		model.addAttribute("plist", plist);
		return "MyPage/myclaim";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="cancelReq.do", method=RequestMethod.POST)
	public void cancelReq(HttpServletRequest request) throws Exception{	
		int payno = Integer.parseInt(request.getParameter("payno"));
		System.out.println("cancelReq : " + payno);
		service.cancelReq(payno);	
	}
}
