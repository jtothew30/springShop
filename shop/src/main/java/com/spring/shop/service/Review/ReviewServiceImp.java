package com.spring.shop.service.Review;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.Review.ReviewDao;
import com.spring.shop.vo.Review;

@Service("ReviewService")
public class ReviewServiceImp implements ReviewService{
	@Inject
	ReviewDao reviewDao;
	
	@Override
	public void reviewWirte(Review review) throws Exception{
		reviewDao.reviewWirte(review);
	}
}
