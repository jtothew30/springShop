package com.spring.shop.dao.MyPage;

import java.util.List;
import java.util.Map;

import com.spring.shop.vo.Paging;
import com.spring.shop.vo.Payment;
import com.spring.shop.vo.Payrequest;
import com.spring.shop.vo.Qna;
import com.spring.shop.vo.Review;

public interface MyPageDao {
	public List<Payment> getMyOrderList(String customer) throws Exception;
	public List<Payment> getMyClaimList(Paging paging) throws Exception;
	public List<Payrequest> getMyOrderListPr(String customer) throws Exception;
	public List<Payrequest> getMyClaimListPr(Paging paging) throws Exception;
	public List<Review> getMyReviewList(Paging paging) throws Exception;
	public List<Qna> getMyQnaList(Paging paging) throws Exception;
	public List<Payrequest> getPayrequestList(int payno) throws Exception;
	public int countMyClaim(String customer) throws Exception;
	public int countMyClaimPr(String customer) throws Exception;
	public int countMyReview(String writer) throws Exception;
	public int countMyQna(String writer) throws Exception;
	public int countSearchMyClaim(Paging paging) throws Exception;
	public int countSearchMyClaimPr(Paging paging) throws Exception;
	public int countSearchMyReview(Paging paging) throws Exception;
	public int countSearchMyQna(Paging paging) throws Exception;
	public void cancelReq(int payno) throws Exception;
	public List<Payment> searchOrderDate(Map<String, String> map) throws Exception;
	public List<Payment> searchClaimDate(Paging paging) throws Exception;
	public List<Payrequest> searchOrderDatePr(Map<String, String> map) throws Exception;
	public List<Payrequest> searchClaimDatePr(Paging paging) throws Exception;
	public List<Review> searchReviewDate(Paging paging) throws Exception;
	public List<Qna> searchQnaDate(Paging paging) throws Exception;
	public void deleteReview(int rno) throws Exception;
}
