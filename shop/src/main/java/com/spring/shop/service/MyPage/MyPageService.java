package com.spring.shop.service.MyPage;

import java.util.List;
import java.util.Map;

import com.spring.shop.vo.Payment;
import com.spring.shop.vo.Payrequest;

public interface MyPageService {
	public List<Payment> getMyOrderList(String customer) throws Exception;
	public List<Payment> getMyClaimList(String customer) throws Exception;
	public List<Payrequest> getPayrequestList(int payno) throws Exception;
	public void cancelReq(int payno) throws Exception;
	public List<Payment> searchOrderDate(Map<String, String> map) throws Exception;
	public List<Payment> searchClaimDate(Map<String, String> map) throws Exception;
}
