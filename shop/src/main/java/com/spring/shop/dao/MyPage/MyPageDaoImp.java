package com.spring.shop.dao.MyPage;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Payment;
import com.spring.shop.vo.Payrequest;

@Repository
public class MyPageDaoImp implements MyPageDao{
	@Inject
	SqlSession sqlSession;
	
	private final static String MyPageMapper = "com.spring.shop.mapper.MyPageMapper";
	
	@Override
	public List<Payment> getMyOrderList(String customer){
		List<Payment> plist = sqlSession.selectList(MyPageMapper+".getMyOrderList", customer);
		return plist;
	}
	
	@Override
	public List<Payrequest> getMyOrderListPr(String customer){
		List<Payrequest> prlist = sqlSession.selectList(MyPageMapper+".getMyOrderListPr", customer);
		return prlist;
	}
	
	@Override
	public List<Payment> getMyClaimList(String customer){
		List<Payment> plist = sqlSession.selectList(MyPageMapper+".getMyClaimList", customer);
		return plist;
	}
	
	@Override
	public List<Payrequest> getMyClaimListPr(String customer){
		List<Payrequest> prlist = sqlSession.selectList(MyPageMapper+".getMyClaimListPr", customer);
		return prlist;
	}
	
	@Override
	public List<Payrequest> getPayrequestList(int payno){
		List<Payrequest> preqlist = sqlSession.selectList(MyPageMapper+".getPayrequestList", payno);
		return preqlist;
	}
	
	@Override
	public List<Payment> searchOrderDate(Map<String, String> map){
		List<Payment> plist = sqlSession.selectList(MyPageMapper+".searchOrderDate", map);
		return plist;
	}
	
	@Override
	public List<Payrequest> searchOrderDatePr(Map<String, String> map){
		List<Payrequest> prlist = sqlSession.selectList(MyPageMapper+".searchOrderDatePr", map);
		return prlist;
	}
	
	@Override
	public List<Payment> searchClaimDate(Map<String, String> map){
		List<Payment> plist = sqlSession.selectList(MyPageMapper+".searchClaimDate", map);
		return plist;
	}
	
	@Override
	public List<Payrequest> searchClaimDatePr(Map<String, String> map){
		List<Payrequest> prlist = sqlSession.selectList(MyPageMapper+".searchClaimDatePr", map);
		return prlist;
	}
	
	
	@Override
	public void cancelReq(int payno) {
		sqlSession.update(MyPageMapper+".cancelReq", payno);
		sqlSession.update(MyPageMapper+".cancePay", payno);
		System.out.println("cancelReq success");
	}
}
