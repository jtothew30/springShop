package com.spring.shop.dao.Payment;

import java.util.List;

import com.spring.shop.vo.Payment;
import com.spring.shop.vo.Payrequest;

public interface PaymentDao {
	public void createPayment(String customer) throws Exception;
	public int getPayno(String customer) throws Exception;
	public void createPayrequest(List<Payrequest> preqlist) throws Exception;
	public List<Payrequest> getPayrequestList(String customer) throws Exception;
	public void payment(Payment payment) throws Exception;
	public Payment getPaymentResult(int payno) throws Exception;
	public void deletePayment(String customer) throws Exception;
	public int checkPayment(String customer) throws Exception;
}
