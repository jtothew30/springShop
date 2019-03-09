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

import com.google.gson.Gson;
import com.spring.shop.service.MyPage.MyPageService;
import com.spring.shop.service.Review.ReviewService;
import com.spring.shop.vo.Paging;
import com.spring.shop.vo.Payment;
import com.spring.shop.vo.Payrequest;
import com.spring.shop.vo.Qna;
import com.spring.shop.vo.Review;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	@Inject
	private MyPageService service;
	
	@Inject
	private ReviewService reviewservice;
	
	@Autowired
	private ServletContext application;

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@RequestMapping(value="myorder.do")
	public String myOrder(Model model) throws Exception{
		String customer = "testID"; // need to edit for getting login user's id from session later~
		
		List<Payment> plist = service.getMyOrderList(customer);
		List<Payrequest> prlist = service.getMyOrderListPr(customer);
		model.addAttribute("plist", plist);
		model.addAttribute("prlist", prlist);
		return "MyPage/myorder";
	}
	
	@RequestMapping(value="myclaim.do")
	public String myclaim(Paging paging, Model model) throws Exception{
		String customer = "testID"; // need to edit for getting login user's id from session later~
		paging.setCustomer(customer);
		
		Paging paging2 = paging;
		
		List<Payment> plist = new ArrayList<>();
		List<Payrequest> prlist = new ArrayList<>();
		
		if(paging.getTodate() == null || paging.getTodate().equals("")) {
			logger.info("default");
			paging.setTotalCount(service.countMyClaim(customer));
			paging2.setTotalCount(service.countMyClaimPr(customer));
			plist = service.getMyClaimList(paging);
			prlist = service.getMyClaimListPr(paging2);		
		}else {
			logger.info("searchdate");
			paging.setTotalCount(service.countSearchMyClaim(paging));
			paging2.setTotalCount(service.countSearchMyClaimPr(paging2));
			plist = service.searchClaimDate(paging);		
			prlist = service.searchClaimDatePr(paging2);
		}

		model.addAttribute("plist", plist);
		model.addAttribute("prlist", prlist);
		model.addAttribute("paging", paging);
		model.addAttribute("paging2", paging2);
		return "MyPage/myclaim";
	}
	
	@RequestMapping(value="myreview.do")
	public String myreview(Paging paging, Model model) throws Exception{
		String writer = "testID"; // need to edit for getting login user's id from session later~		
		paging.setCustomer(writer);
		
		List<Review> rvlist = new ArrayList<Review>();	
		if(paging.getTodate() == null || paging.getTodate().equals("")) {
			logger.info("default");
			paging.setTotalCount(service.countMyReview(writer));
			rvlist = service.getMyReviewList(paging);
		}else {
			logger.info("searchdate");
			paging.setTotalCount(service.countSearchMyReview(paging));
			rvlist = service.searchReviewDate(paging);
		}
		
		model.addAttribute("rvlist", rvlist);
		model.addAttribute("paging", paging);
		return "MyPage/myreview";
	}
	
	@RequestMapping(value="myqna.do")
	public String myqna(Paging paging, Model model) throws Exception{
		String writer = "testID"; // need to edit for getting login user's id from session later~
		paging.setCustomer(writer);
		
		logger.info("td:"+paging.getTodate()+"/fd:"+paging.getFromdate());
		
		List<Qna> qlist = new ArrayList<Qna>();
		if(paging.getTodate() == null || paging.getTodate().equals("")) {
			logger.info("default");
			paging.setTotalCount(service.countMyQna(writer));
			qlist = service.getMyQnaList(paging);
		}else {
			logger.info("searchdate");
			paging.setTotalCount(service.countSearchMyQna(paging));
			qlist = service.searchQnaDate(paging);
		}
					
		model.addAttribute("qlist", qlist);
		model.addAttribute("paging", paging);
		return "MyPage/myqna";
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
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("todate", todate);
		map.put("fromdate", fromdate);
		map.put("customer", customer);
		
		List<Payment> plist = service.searchOrderDate(map);
		List<Payrequest> prlist = service.searchOrderDatePr(map);
		
		model.addAttribute("plist", plist);
		model.addAttribute("prlist", prlist);
		return "MyPage/myorder";
	}
	
	
	@ResponseBody
	@RequestMapping(value="cancelReq.do", method=RequestMethod.POST)
	public void cancelReq(HttpServletRequest request) throws Exception{	
		int payno = Integer.parseInt(request.getParameter("payno"));
		System.out.println("cancelReq : " + payno);
		service.cancelReq(payno);	
	}
	
	
	@RequestMapping(value = "reviewWriteInMyorder.do", method = RequestMethod.POST)
	public String reviewWriteInMyorder(Model model, Review review, MultipartHttpServletRequest request) throws Exception {
		
		List<MultipartFile> filelist = request.getFiles("file");
		
		String inputPath = "/resources/upload/review/"+review.getPath();
		String writer = "testID";	
		review.setWriter(writer);
		review.setPath(inputPath);
		
		System.out.println(review.toString());
		int rno = reviewservice.reviewWirte(review);
				
		String path = application.getRealPath(reviewservice.getPath(rno));
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
		
		return "redirect:myorder.do";
	}
	
	@RequestMapping(value = "reviewWriteInMyclaim.do", method = RequestMethod.POST)
	public String reviewWriteInMyclaim(Model model, Review review, MultipartHttpServletRequest request) throws Exception {
		
		List<MultipartFile> filelist = request.getFiles("file");
		
		String inputPath = "/resources/upload/review/"+review.getPath();
		String writer = "testID";	
		review.setWriter(writer);
		review.setPath(inputPath);
		
		System.out.println(review.toString());
		int rno = reviewservice.reviewWirte(review);
				
		String path = application.getRealPath(reviewservice.getPath(rno));
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
		
		return "redirect:myclaim.do";
	}
	
	@ResponseBody
	@RequestMapping(value="deleteReview.do", method=RequestMethod.POST)
	public void deleteReview(HttpServletRequest request) throws Exception{	
		int rno = Integer.parseInt(request.getParameter("rno"));
		System.out.println("deleteReview : " + rno);
		service.deleteReview(rno);	
	}
	
	
}
