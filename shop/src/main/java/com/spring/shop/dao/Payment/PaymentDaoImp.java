package com.spring.shop.dao.Payment;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Cart;
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
	
}
