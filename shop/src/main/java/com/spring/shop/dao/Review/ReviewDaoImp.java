package com.spring.shop.dao.Review;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Production;
import com.spring.shop.vo.Qna;
import com.spring.shop.vo.Review;

@Repository
public class ReviewDaoImp implements ReviewDao{
	@Inject
	SqlSession sqlSession;
	
	private final static String ReviewMapper = "com.spring.shop.mapper.ReviewMapper";
	
	
	@Override
	public List<Production> getOptions(int pbno){
		 List<Production> plist = sqlSession.selectList(ReviewMapper+".getOptions", pbno);
		 return plist;
	}
	
	@Override
	public List<Review> getReviewList(int pbno){
		List<Review> rlist = sqlSession.selectList(ReviewMapper+".getReviewList", pbno);
		return rlist;
	}
	
	@Override
	public List<Qna> getQnaList(int pbno){
		List<Qna> qlist = sqlSession.selectList(ReviewMapper+".getQnaList", pbno);
		return qlist;
	}
	
	@Override
	public int reviewWirte(Review review) {
		sqlSession.insert(ReviewMapper+".reviewWirte", review);
		System.out.println("review Wirte success, rno : "+ review.getRno());
		return review.getRno();
	}
	
	@Override
	public int qnaWirte(Qna qna) {
		sqlSession.insert(ReviewMapper+".qnaWirte", qna);
		System.out.println("qnaWirte success, qno : "+ qna.getQno());
		return qna.getQno();
	}
	
	@Override
	public String getPath(int rno) {
		String path = sqlSession.selectOne(ReviewMapper+".getPath", rno);
		return path;
	}
	
	@Override
	public String getQnaPath(int qno) {
		String path = sqlSession.selectOne(ReviewMapper+".getQnaPath", qno);
		return path;
	}
	
	
	@Override
	public boolean reactCheck(Map<String, Object> map) {
		int chk = sqlSession.selectOne(ReviewMapper+".reactCheck", map);
		
		if(chk > 0)
			return false; //이미 선택함
		else
			return true; // 선택 가능
	}
	
	@Override
	public int react(Map<String, Object> map) {
		sqlSession.insert(ReviewMapper+".reactlog", map);
		if(map.get("react").equals("good")) {
			sqlSession.update(ReviewMapper+".reactgood", map);
			return sqlSession.selectOne(ReviewMapper+".getgood", map);
		}else {
			sqlSession.update(ReviewMapper+".reactbad", map);
			return sqlSession.selectOne(ReviewMapper+".getbad", map);
		}
	}
}
