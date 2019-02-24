package com.spring.shop.service.Payment;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.Payment.PaymentDao;
import com.spring.shop.vo.Payrequest;

@Service("PaymentService")
public class PaymentServiceImp implements PaymentService {
	@Inject
	PaymentDao paymentDao;
	
	@Override
	public void createPayment(String customer) throws Exception {
		paymentDao.createPayment(customer);
	}
	
	@Override
	public int getPayno(String customer) throws Exception {
		return paymentDao.getPayno(customer);
	}
	
	@Override
	public void createPayrequest(List<Payrequest> preqlist) throws Exception {
		paymentDao.createPayrequest(preqlist);
	}
	
	@Override
	public List<Payrequest> getPayrequestList(String customer) throws Exception{
		return paymentDao.getPayrequestList(customer);
	}
}
