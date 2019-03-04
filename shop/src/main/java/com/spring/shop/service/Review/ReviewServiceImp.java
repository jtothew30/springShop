package com.spring.shop.service.Review;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.Review.ReviewDao;
import com.spring.shop.vo.Production;
import com.spring.shop.vo.Review;

@Service("ReviewService")
public class ReviewServiceImp implements ReviewService{
	@Inject
	ReviewDao reviewDao;
	
	@Override
	public List<Production> getOptions(int pbno) throws Exception{
		return reviewDao.getOptions(pbno);
	}
	
	@Override
	public void reviewWirte(Review review) throws Exception{
		reviewDao.reviewWirte(review);
	}
}
