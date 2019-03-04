package com.spring.shop.dao.Review;

import java.util.List;

import com.spring.shop.vo.Production;
import com.spring.shop.vo.Review;

public interface ReviewDao {
	public void reviewWirte(Review review) throws Exception;
	public List<Production> getOptions(int pbno) throws Exception;
}
