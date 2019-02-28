package com.spring.shop.dao.Payment;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Payment;
import com.spring.shop.vo.Payrequest;

@Repository
public class PaymentDaoImp implements PaymentDao {
	@Inject
	SqlSession sqlSession;
	
	private final static String PaymentMapper = "com.spring.shop.mapper.PaymentMapper";
	
	@Override
	public void createPayment(String customer) {
		sqlSession.insert(PaymentMapper+".createPayment", customer);
		System.out.println("create new Payment.");
	}
	
	
	@Override
	public int getPayno(String customer) {
		int payno = sqlSession.selectOne(PaymentMapper+".getPayno", customer);
		return payno;
	}
	
	@Override
	public void createPayrequest(List<Payrequest> preqlist) {
		for(Payrequest preq : preqlist) {
			sqlSession.insert(PaymentMapper+".createPayrequest", preq);
		}
		System.out.println("create new pay requests");
	}
	
	
	@Override
	public List<Payrequest> getPayrequestList(String customer){
		List<Payrequest> preqlist = sqlSession.selectList(PaymentMapper+".getPayrequestList", customer);
		System.out.println("PaymentDaoImp check : getPayrequestList");
		return preqlist;
	}
	
	@Override
	public void payment(Payment payment) {
		sqlSession.update(PaymentMapper+".payment", payment);
		sqlSession.update(PaymentMapper+".updatePayrequest", payment);
		
		List<Payrequest> preqlist = sqlSession.selectList(PaymentMapper+".getPreq", payment.getPayno());
		
		for(Payrequest preq : preqlist) {
			sqlSession.update(PaymentMapper+".updateProstock", preq);
		}	
		System.out.println("payment success");
	}
	
	@Override
	public Payment getPaymentResult(int payno) {
		Payment result = sqlSession.selectOne(PaymentMapper+".getPaymentResult", payno);
		return result;
	}
	
	@Override
	public void deletePayment(String customer) {
		sqlSession.delete(PaymentMapper+".deletePayrequest", customer);
		sqlSession.delete(PaymentMapper+".deletePayment", customer);
	}
	
	@Override
	public int checkPayment(String customer) {
		int chk = sqlSession.selectOne(PaymentMapper+".checkPayment", customer);
		return chk;
	}
	
	
}
