package com.spring.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.shop.service.Review.ReviewService;
import com.spring.shop.vo.Production;
import com.spring.shop.vo.Review;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Inject
	private ReviewService service;
	
	@Autowired
	private ServletContext application;
	
	@RequestMapping("review.do")
	public String review(Model model, HttpServletRequest request) throws Exception{
		String customer = "testID"; // need to edit for getting login user's id from session later~
		int pbno = Integer.parseInt(request.getParameter("pbno"));
		
		System.out.println("review.do check pbno:"+pbno);
		
		List<Production> prolist = service.getOptions(pbno);
		
		model.addAttribute("prolist", prolist);
		return "review";
	}
	
	@RequestMapping(value = "reviewWirte.do", method = RequestMethod.POST)
	public String reviewWirte(Model model, Review review, MultipartHttpServletRequest request) throws Exception {
		
		List<MultipartFile> filelist = request.getFiles("file");
		String inputPath = "/resources/upload/"+review.getPath();
		
		String writer = "testID";	
		review.setWriter(writer);
		review.setQna("review");
		
		System.out.println(review.toString());
		
		String path = application.getRealPath(inputPath);
		File dir = new File(path);
		if (!dir.isDirectory()) { dir.mkdirs(); }
		for(MultipartFile file : filelist) {
			String originFileName = file.getOriginalFilename().toLowerCase(); // 원본 파일 명(소문자강제처리)
	        long fileSize = file.getSize(); // 파일 사이즈
	       
	        logger.info("originFileName : " + originFileName);
	        logger.info("fileSize : " + fileSize);
	        
	        try {
	        	file.transferTo(new File(path, originFileName));
	        }catch(IllegalStateException e) {
	        	e.printStackTrace();
	        }catch(IOException e) {
	        	e.printStackTrace();
	        }
		}	
		
		service.reviewWirte(review);
		
		return "redirect:../proboard/product.do?pbno="+review.getPbno();
	}
}