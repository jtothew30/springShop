package com.spring.shop.service.MyPage;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.MyPage.MyPageDao;
import com.spring.shop.vo.Paging;
import com.spring.shop.vo.Payment;
import com.spring.shop.vo.Payrequest;
import com.spring.shop.vo.Qna;
import com.spring.shop.vo.Review;

@Service("MyPageService")
public class MyPageServiceImp implements MyPageService{
	@Inject
	MyPageDao mypageDao;
	
	@Override
	public List<Payment> getMyOrderList(String customer) throws Exception{
		return mypageDao.getMyOrderList(customer);
	}
	
	@Override
	public List<Payrequest> getMyOrderListPr(String customer) throws Exception{
		return mypageDao.getMyOrderListPr(customer);
	}
	
	@Override
	public List<Payment> getMyClaimList(Paging paging) throws Exception{
		return mypageDao.getMyClaimList(paging);
	}
	
	@Override
	public List<Payrequest> getMyClaimListPr(Paging paging) throws Exception{
		return mypageDao.getMyClaimListPr(paging);
	}
	
	@Override
	public int countMyClaim(String customer) throws Exception{
		return mypageDao.countMyClaim(customer);
	}
	
	@Override
	public int countMyClaimPr(String customer) throws Exception{
		return mypageDao.countMyClaimPr(customer);
	}
	
	@Override
	public int countSearchMyClaim(Paging paging) throws Exception{
		return mypageDao.countSearchMyClaim(paging);
	}
	
	@Override
	public int countSearchMyClaimPr(Paging paging) throws Exception{
		return mypageDao.countSearchMyClaimPr(paging);
	}
	
	@Override
	public List<Review> getMyReviewList(Paging paging) throws Exception{
		return mypageDao.getMyReviewList(paging);
	}
	
	@Override
	public int countMyReview(String writer) throws Exception{
		return mypageDao.countMyReview(writer);
	}
	
	@Override
	public List<Qna> getMyQnaList(Paging paging) throws Exception{
		return mypageDao.getMyQnaList(paging);
	}
	
	@Override
	public int countSearchMyReview(Paging paging) throws Exception{
		return mypageDao.countSearchMyReview(paging);
	}
	
	@Override
	public int countMyQna(String writer) throws Exception{
		return mypageDao.countMyQna(writer);
	}
	
	@Override
	public int countSearchMyQna(Paging paging) throws Exception{
		return mypageDao.countSearchMyQna(paging);
	}
	
	@Override
	public List<Payrequest> getPayrequestList(int payno) throws Exception{
		return mypageDao.getPayrequestList(payno);
	}
	
	@Override
	public void cancelReq(int payno) throws Exception{
		mypageDao.cancelReq(payno);
	}
	
	@Override
	public List<Payment> searchOrderDate(Map<String, String> map) throws Exception{
		return mypageDao.searchOrderDate(map);
	}
	
	@Override
	public List<Payrequest> searchOrderDatePr(Map<String, String> map) throws Exception{
		return mypageDao.searchOrderDatePr(map);
	}
	
	@Override
	public List<Payment> searchClaimDate(Paging paging) throws Exception{
		return mypageDao.searchClaimDate(paging);
	}
	
	@Override
	public List<Payrequest> searchClaimDatePr(Paging paging) throws Exception{
		return mypageDao.searchClaimDatePr(paging);
	}
	
	@Override
	public List<Review> searchReviewDate(Paging paging) throws Exception{
		return mypageDao.searchReviewDate(paging);
	}
	
	@Override
	public List<Qna> searchQnaDate(Paging paging) throws Exception{
		return mypageDao.searchQnaDate(paging);
	}
	
	@Override
	public void deleteReview(int rno) throws Exception{
		mypageDao.deleteReview(rno);
	}

}
