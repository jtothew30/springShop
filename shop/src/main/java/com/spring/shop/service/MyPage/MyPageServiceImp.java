package com.spring.shop.service.MyPage;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.MyPage.MyPageDao;
import com.spring.shop.vo.Payment;
import com.spring.shop.vo.Payrequest;

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
	public List<Payment> getMyClaimList(String customer) throws Exception{
		return mypageDao.getMyClaimList(customer);
	}
	
	@Override
	public List<Payrequest> getMyClaimListPr(String customer) throws Exception{
		return mypageDao.getMyClaimListPr(customer);
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
	public List<Payment> searchClaimDate(Map<String, String> map) throws Exception{
		return mypageDao.searchClaimDate(map);
	}
	
	@Override
	public List<Payrequest> searchClaimDatePr(Map<String, String> map) throws Exception{
		return mypageDao.searchClaimDatePr(map);
	}
}
