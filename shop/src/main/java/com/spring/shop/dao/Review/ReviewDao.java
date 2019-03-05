package com.spring.shop.dao.Review;

import java.util.List;

import com.spring.shop.vo.Production;
import com.spring.shop.vo.Review;

public interface ReviewDao {
	public int reviewWirte(Review review) throws Exception;
	public List<Production> getOptions(int pbno) throws Exception;
	public List<Review> getReviewList(int pbno) throws Exception;
	public String getPath(int rno) throws Exception;
}
