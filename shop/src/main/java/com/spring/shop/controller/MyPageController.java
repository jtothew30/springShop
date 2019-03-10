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
	public String myOrder(Model model, HttpServletRequest request) throws Exception{
		String tabs = request.getParameter("tabs");
		if(tabs == null || tabs.equals(""))
			tabs = "";
		
		
		String todate = request.getParameter("todate");
		String fromdate = request.getParameter("fromdate");
		
		if(todate == null || todate.equals("") || fromdate == null || fromdate.equals("")) {
			todate = "";
			fromdate = "";
		}
		
		model.addAttribute("tabs", tabs);
		model.addAttribute("todate", todate);
		model.addAttribute("fromdate", fromdate);
		return "MyPage/myorder";
	}
	
	@RequestMapping(value="myorderPayment.do")
	public String myorderPayment(Model model, Paging paging, HttpServletRequest request) throws Exception{
		String customer = "testID";
		paging.setCustomer(customer);
		
		String page = request.getParameter("pagePy");
		if(page != null) {
			paging.setPage(Integer.parseInt(page));
		}
		
		
		List<Payment> plist = new ArrayList<>();
		
		if(paging.getTodate() == null || paging.getTodate().equals("")) {
			logger.info("default");
			paging.setTotalCount(service.countMyOrder(customer));			
			plist = service.getMyOrderList(paging);
			
		}else {
			logger.info("searchdate");
			paging.setTotalCount(service.countSearchMyOrder(paging));			
			plist = service.searchOrderDate(paging);					
		}
		
		model.addAttribute("plist", plist);
		model.addAttribute("paging", paging);
		return "MyPage/myorderPayment";
	}
	
	@RequestMapping(value="myorderPayrequest.do")
	public String myorderPayrequest(Model model, Paging paging, HttpServletRequest request) throws Exception{
		String customer = "testID";
		paging.setCustomer(customer);
		
		String page = request.getParameter("pagePr");
		if(page != null) {
			paging.setPage(Integer.parseInt(page));
		}
		
		List<Payrequest> prlist = new ArrayList<>();
		
		if(paging.getTodate() == null || paging.getTodate().equals("")) {
			logger.info("default");
			paging.setTotalCount(service.countMyOrderPr(customer));		
			prlist = service.getMyOrderListPr(paging);		
			
		}else {
			logger.info("searchdate");
			paging.setTotalCount(service.countSearchMyClaimPr(paging));
			prlist = service.searchOrderDatePr(paging);			
		}
		
		model.addAttribute("plist", prlist);
		model.addAttribute("paging", paging);	
		return "MyPage/myorderPayrequest";
	}
	
	
	
	@RequestMapping(value="myclaim.do")
	public String myclaim(Model model, HttpServletRequest request) throws Exception{
		String tabs = request.getParameter("tabs");
		if(tabs == null || tabs.equals(""))
			tabs = "";
		
		
		String todate = request.getParameter("todate");
		String fromdate = request.getParameter("fromdate");
		
		if(todate == null || todate.equals("") || fromdate == null || fromdate.equals("")) {
			todate = "";
			fromdate = "";
		}
		
		model.addAttribute("tabs", tabs);
		model.addAttribute("todate", todate);
		model.addAttribute("fromdate", fromdate);	
		return "MyPage/myclaim";
	}
	
	
	@RequestMapping(value="myclaimPayment.do")
	public String myclaimPayment(Model model, Paging paging, HttpServletRequest request) throws Exception{
		String customer = "testID";
		paging.setCustomer(customer);
		
		String page = request.getParameter("pagePy");
		if(page != null) {
			paging.setPage(Integer.parseInt(page));
		}
		
		
		List<Payment> plist = new ArrayList<>();
		
		if(paging.getTodate() == null || paging.getTodate().equals("")) {
			logger.info("default");
			paging.setTotalCount(service.countMyClaim(customer));			
			plist = service.getMyClaimList(paging);
			
		}else {
			logger.info("searchdate");
			paging.setTotalCount(service.countSearchMyClaim(paging));			
			plist = service.searchClaimDate(paging);					
		}
		
		model.addAttribute("plist", plist);
		model.addAttribute("paging", paging);
		return "MyPage/myclaimPayment";
	}
	
	@RequestMapping(value="myclaimPayrequest.do")
	public String myclaimPayrequest(Model model, Paging paging, HttpServletRequest request) throws Exception{
		String customer = "testID";
		paging.setCustomer(customer);
		
		String page = request.getParameter("pagePr");
		if(page != null) {
			paging.setPage(Integer.parseInt(page));
		}
		
		List<Payrequest> prlist = new ArrayList<>();
		
		if(paging.getTodate() == null || paging.getTodate().equals("")) {
			logger.info("default");
			paging.setTotalCount(service.countMyClaimPr(customer));		
			prlist = service.getMyClaimListPr(paging);		
			
		}else {
			logger.info("searchdate");
			paging.setTotalCount(service.countSearchMyClaimPr(paging));
			prlist = service.searchClaimDatePr(paging);			
		}
		
		model.addAttribute("prlist", prlist);
		model.addAttribute("paging", paging);	
		return "MyPage/myclaimPayrequest";
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
