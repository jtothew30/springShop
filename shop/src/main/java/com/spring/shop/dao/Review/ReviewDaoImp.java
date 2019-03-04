package com.spring.shop.dao.Review;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Production;
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
	public void reviewWirte(Review review) {
		sqlSession.insert(ReviewMapper+".reviewWirte", review);
		System.out.println("reviewWirte success");
	}
}
