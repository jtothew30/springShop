package com.spring.shop.dao.MyPage;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Paging;
import com.spring.shop.vo.Payment;
import com.spring.shop.vo.Payrequest;
import com.spring.shop.vo.Qna;
import com.spring.shop.vo.Review;

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
	public List<Payment> getMyClaimList(Paging paging){
		List<Payment> plist = sqlSession.selectList(MyPageMapper+".getMyClaimList", paging);
		return plist;
	}
	
	@Override
	public List<Payrequest> getMyClaimListPr(Paging paging){
		List<Payrequest> prlist = sqlSession.selectList(MyPageMapper+".getMyClaimListPr", paging);
		return prlist;
	}
	
	@Override
	public int countMyClaim(String customer) {
		int count = sqlSession.selectOne(MyPageMapper+".countMyClaim", customer);
		return count;
	}
	
	@Override
	public int countMyClaimPr(String customer) {
		int count = sqlSession.selectOne(MyPageMapper+".countMyClaimPr", customer);
		return count;
	}
	
	@Override
	public int countSearchMyClaim(Paging paging) {
		int count = sqlSession.selectOne(MyPageMapper+".countSearchMyClaim", paging);
		return count;
	}
	
	@Override
	public int countSearchMyClaimPr(Paging paging) {
		int count = sqlSession.selectOne(MyPageMapper+".countSearchMyClaimPr", paging);
		return count;
	}
	
	
	@Override
	public List<Review> getMyReviewList(Paging paging){
		List<Review> rvlist = sqlSession.selectList(MyPageMapper+".getMyReviewList", paging);
		return rvlist;
	}
	
	@Override
	public int countMyReview(String writer) {
		int count = sqlSession.selectOne(MyPageMapper+".countMyReview", writer);
		return count;
	}
	
	@Override
	public int countSearchMyReview(Paging paging) {
		int count = sqlSession.selectOne(MyPageMapper+".countSearchMyReview", paging);
		return count;
	}
	
	@Override
	public int countMyQna(String writer) {
		int count = sqlSession.selectOne(MyPageMapper+".countMyQna", writer);
		return count;
	}
	
	@Override
	public int countSearchMyQna(Paging paging) {
		int count = sqlSession.selectOne(MyPageMapper+".countSearchMyQna", paging);
		return count;
	}
	
	@Override
	public List<Qna> getMyQnaList(Paging paging){
		List<Qna> qlist = sqlSession.selectList(MyPageMapper+".getMyQnaList", paging);
		return qlist;
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
	public List<Payment> searchClaimDate(Paging paging){
		List<Payment> plist = sqlSession.selectList(MyPageMapper+".searchClaimDate", paging);
		return plist;
	}
	
	@Override
	public List<Payrequest> searchClaimDatePr(Paging paging){
		List<Payrequest> prlist = sqlSession.selectList(MyPageMapper+".searchClaimDatePr", paging);
		return prlist;
	}
	
	@Override
	public List<Review> searchReviewDate(Paging paging){
		List<Review> rvlist = sqlSession.selectList(MyPageMapper+".searchReviewDate", paging);
		return rvlist;
	}
	
	@Override
	public List<Qna> searchQnaDate(Paging paging){
		List<Qna> qlist = sqlSession.selectList(MyPageMapper+".searchQnaDate", paging);
		return qlist;
	}
	
	
	@Override
	public void cancelReq(int payno) {
		sqlSession.update(MyPageMapper+".cancelReq", payno);
		sqlSession.update(MyPageMapper+".cancePay", payno);
		System.out.println("cancelReq success");
	}
	
	@Override
	public void deleteReview(int rno) {
		sqlSession.delete(MyPageMapper+".deleteReviewReply", rno);
		sqlSession.delete(MyPageMapper+".deleteReview", rno);
		System.out.println("deleteReview success");
	}
	
}