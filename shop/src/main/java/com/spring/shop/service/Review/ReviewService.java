package com.spring.shop.service.Review;

import java.util.List;
import java.util.Map;

import com.spring.shop.vo.Paging;
import com.spring.shop.vo.Production;
import com.spring.shop.vo.Qna;
import com.spring.shop.vo.Review;

public interface ReviewService {
	public int reviewWirte(Review review) throws Exception;
	public int qnaWirte(Qna qna) throws Exception;
	public List<Production> getOptions(int pbno) throws Exception;
	public List<Review> getReviewList(Paging paging) throws Exception;
	public int countReviewList(int pbno) throws Exception;
	public List<Qna> getQnaList(Paging paging) throws Exception;
	public int countQnaList(int pbno) throws Exception;
	public String getPath(int rno) throws Exception;
	public String getQnaPath(int qno) throws Exception;
	public boolean reactCheck(Map<String, Object> map) throws Exception;
	public int react(Map<String, Object> map) throws Exception;
}
