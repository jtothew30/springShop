package com.spring.shop.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.shop.service.Review.ReviewService;
import com.spring.shop.vo.Review;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Inject
	private ReviewService service;
	
	@RequestMapping("review.do")
	public String review(Model model, HttpServletRequest request) throws Exception{
		String customer = "testID"; // need to edit for getting login user's id from session later~
		int pbno = Integer.parseInt(request.getParameter("pbno"));
		
		System.out.println("review.do check pbno:"+pbno);
		
		
		
		return "review";
	}
	
	@RequestMapping("reviewWirte.do")
	public String reviewWirte(Model model, Review review) throws Exception {
		
		String writer = "testID";	
		review.setWriter(writer);
		review.setQna("review");
		
		System.out.println("options:"+review.getOptions()+"/stars:"+review.getStars()+"/content:"+review.getContent()+"/pbno:"+review.getPbno());
		
		service.reviewWirte(review);
		
		return "redirect:../proboard/product.do?pbno="+review.getPbno();
	}
}