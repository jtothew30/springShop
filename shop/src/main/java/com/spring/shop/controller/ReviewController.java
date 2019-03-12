package com.spring.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.shop.service.Review.ReviewService;
import com.spring.shop.vo.Paging;
import com.spring.shop.vo.Production;
import com.spring.shop.vo.Qna;
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
	public String review(Model model, Paging paging, HttpServletRequest request) throws Exception{
		System.out.println("review.do check pbno:"+paging.getPbno());
		
		HttpSession session = request.getSession();	
		String writer = "";
		if(session.getAttribute("account") != null)
			writer = (String)session.getAttribute("account");
			
		
		String page = request.getParameter("pageR");
		if(page != null) {
			paging.setPage(Integer.parseInt(page));
		}
		
		paging.setTotalCount(service.countReviewList(paging.getPbno()));	
		List<Review> rlist = service.getReviewList(paging);
		
		List<Production> prolist = service.getOptions(paging.getPbno());
		model.addAttribute("prolist", prolist);
		model.addAttribute("rlist", rlist);
		model.addAttribute("paging", paging);
		model.addAttribute("session", writer);
		return "review";
	}
	
	@RequestMapping("qna.do")
	public String qna(Model model, Paging paging, HttpServletRequest request) throws Exception{		
		System.out.println("qna.do check pbno:"+paging.getPbno());
		
		HttpSession session = request.getSession();	
		String writer = "";
		if(session.getAttribute("account") != null)
			writer = (String)session.getAttribute("account");
			
		
		
		String page = request.getParameter("pageQ");
		if(page != null) {
			paging.setPage(Integer.parseInt(page));
		}
		
		paging.setTotalCount(service.countQnaList(paging.getPbno()));	
		List<Qna> qlist = service.getQnaList(paging);
		
		model.addAttribute("qlist", qlist);
		model.addAttribute("paging", paging);
		model.addAttribute("session", writer);
		return "qna";
	}
	
	@RequestMapping(value = "reviewWirte.do", method = RequestMethod.POST)
	public String reviewWirte(Model model, Review review, MultipartHttpServletRequest request) throws Exception {
		
		List<MultipartFile> filelist = request.getFiles("file");
		
		String inputPath = "/resources/upload/review/"+review.getPath();
		HttpSession session = request.getSession();	
		String writer = "";
		if(session.getAttribute("account") != null)
			writer = (String)session.getAttribute("account");
				
		review.setWriter(writer);
		review.setPath(inputPath);
		
		System.out.println(review.toString());
		int rno = service.reviewWirte(review);
				
		String path = application.getRealPath(service.getPath(rno));
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
		
		return "redirect:../proboard/product.do?pbno="+review.getPbno()+"&tabs=review";
	}
	
	
	@RequestMapping(value = "qnaWirte.do", method = RequestMethod.POST)
	public String qnaWirte(Model model, Qna qna, MultipartHttpServletRequest request) throws Exception {
		
		List<MultipartFile> filelist = request.getFiles("file");
		
		String inputPath = "/resources/upload/qna/"+qna.getPath();
		HttpSession session = request.getSession();	
		String writer = "";
		if(session.getAttribute("account") != null)
			writer = (String)session.getAttribute("account");
				
		qna.setWriter(writer);
		qna.setPath(inputPath);
		
		System.out.println(qna.toString());
		int qno = service.qnaWirte(qna);
				
		String path = application.getRealPath(service.getQnaPath(qno));
		
		System.out.println("path:" + path);
		
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
		
		return "redirect:../proboard/product.do?pbno="+qna.getPbno()+"&tabs=qna";
	}
	
	
	@ResponseBody
	@RequestMapping(value="getImgs.do", method=RequestMethod.POST)
	public List<String> getImgs(HttpServletRequest request) {
		System.out.println("getImgs 접근 체크");
		
		List<String> imgs = new ArrayList<String>();
		
		String path = request.getParameter("path");		
		
		try {
			File[] files = new File(application.getRealPath(path)).listFiles();
			//If this pathname does not denote a directory, then listFiles() returns null. 

			for (File file : files) {
			    if (file.isFile()) {
			    	imgs.add(file.getName());
			    }
			}
			
		}catch(Exception e) {
			logger.info("Exception : " + e);
		}
			
		return imgs;
	}
	
	
	@ResponseBody
	@RequestMapping(value="reactCheck.do", method=RequestMethod.POST)
	public boolean reactCheck(HttpServletRequest request) throws Exception {
		System.out.println("reactCheck 접근 체크");
		
		HttpSession session = request.getSession();	
		String id = "";
		if(session.getAttribute("account") != null)
			id = (String)session.getAttribute("account");
			
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("rno", rno);
		
		return service.reactCheck(map);
	}
	
	
	@ResponseBody
	@RequestMapping(value="react.do", method=RequestMethod.POST)
	public int react(HttpServletRequest request) throws Exception {
		System.out.println("react 접근 체크");
		
		HttpSession session = request.getSession();	
		String id = "";
		if(session.getAttribute("account") != null)
			id = (String)session.getAttribute("account");
			
		int rno = Integer.parseInt(request.getParameter("rno"));
		String react = request.getParameter("react");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("rno", rno);
		map.put("react", react);
		map.put("good", 0);
		map.put("bad", 0);
		
		int result = service.react(map);
		return result;
	}
}
