package com.spring.shop.service.MyPage;

import java.util.List;
import java.util.Map;

import com.spring.shop.vo.Paging;
import com.spring.shop.vo.Payment;
import com.spring.shop.vo.Payrequest;
import com.spring.shop.vo.Qna;
import com.spring.shop.vo.Review;

public interface MyPageService {
	public List<Payment> getMyOrderList(String customer) throws Exception;
	public List<Payment> getMyClaimList(String customer) throws Exception;
	public List<Payrequest> getMyOrderListPr(String customer) throws Exception;
	public List<Payrequest> getMyClaimListPr(String customer) throws Exception;
	public List<Review> getMyReviewList(Paging paging) throws Exception;
	public List<Qna> getMyQnaList(String writer) throws Exception;
	public List<Payrequest> getPayrequestList(int payno) throws Exception;
	public void cancelReq(int payno) throws Exception;
	public int countMyReview(String writer) throws Exception;
	public List<Payment> searchOrderDate(Map<String, String> map) throws Exception;
	public List<Payment> searchClaimDate(Map<String, String> map) throws Exception;
	public List<Payrequest> searchOrderDatePr(Map<String, String> map) throws Exception;
	public List<Payrequest> searchClaimDatePr(Map<String, String> map) throws Exception;
	public List<Review> searchReviewDate(Map<String, String> map) throws Exception;
	public List<Qna> searchQnaDate(Map<String, String> map) throws Exception;
	public void deleteReview(int rno) throws Exception;
}
