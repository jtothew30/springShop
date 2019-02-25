package com.spring.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class modifyController {
	
	@RequestMapping("info.do")
	public String Mypage() {
		return "/Mypage/InfoChange";
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
}
