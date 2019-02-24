package com.spring.shop.service.Payment;

import java.util.List;

import com.spring.shop.vo.Payrequest;

public interface PaymentService {
	public void createPayment(String customer) throws Exception;
	public int getPayno(String customer) throws Exception;
	public void createPayrequest(List<Payrequest> preqlist) throws Exception;
	public List<Payrequest> getPayrequestList(String customer) throws Exception;
}
