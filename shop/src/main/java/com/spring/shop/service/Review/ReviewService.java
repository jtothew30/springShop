package com.spring.shop.service.Review;

import java.util.List;

import com.spring.shop.vo.Production;
import com.spring.shop.vo.Review;

public interface ReviewService {
	public List<Production> getOptions(int pbno) throws Exception;
	public void reviewWirte(Review review) throws Exception;
}
