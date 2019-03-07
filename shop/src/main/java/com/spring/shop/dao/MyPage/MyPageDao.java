package com.spring.shop.dao.MyPage;

import java.util.List;
import java.util.Map;

import com.spring.shop.vo.Payment;
import com.spring.shop.vo.Payrequest;

public interface MyPageDao {
	public List<Payment> getMyOrderList(String customer) throws Exception;
	public List<Payment> getMyClaimList(String customer) throws Exception;
	public List<Payrequest> getMyOrderListPr(String customer) throws Exception;
	public List<Payrequest> getMyClaimListPr(String customer) throws Exception;
	public List<Payrequest> getPayrequestList(int payno) throws Exception;
	public void cancelReq(int payno) throws Exception;
	public List<Payment> searchOrderDate(Map<String, String> map) throws Exception;
	public List<Payment> searchClaimDate(Map<String, String> map) throws Exception;
	public List<Payrequest> searchOrderDatePr(Map<String, String> map) throws Exception;
	public List<Payrequest> searchClaimDatePr(Map<String, String> map) throws Exception;
}
