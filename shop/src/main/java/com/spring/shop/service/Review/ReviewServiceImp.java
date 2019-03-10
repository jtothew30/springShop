package com.spring.shop.service.Review;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.Review.ReviewDao;
import com.spring.shop.vo.Paging;
import com.spring.shop.vo.Production;
import com.spring.shop.vo.Qna;
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
	public List<Review> getReviewList(Paging paging) throws Exception{
		return reviewDao.getReviewList(paging);
	}
	
	@Override
	public int countReviewList(int pbno) throws Exception{
		return reviewDao.countReviewList(pbno);
	}
	
	@Override
	public List<Qna> getQnaList(Paging paging) throws Exception{
		return reviewDao.getQnaList(paging);
	}
	
	@Override
	public int countQnaList(int pbno) throws Exception{
		return reviewDao.countQnaList(pbno);
	}
	
	@Override
	public int reviewWirte(Review review) throws Exception{
		return reviewDao.reviewWirte(review);
	}
	
	@Override
	public int qnaWirte(Qna qna) throws Exception{
		return reviewDao.qnaWirte(qna);
	}
	
	@Override
	public String getPath(int rno) throws Exception{
		return reviewDao.getPath(rno);
	}
	
	@Override
	public String getQnaPath(int qno) throws Exception{
		return reviewDao.getQnaPath(qno);
	}
	
	@Override
	public boolean reactCheck(Map<String, Object> map) throws Exception{
		return reviewDao.reactCheck(map);
	}
	
	@Override
	public int react(Map<String, Object> map) throws Exception{
		return reviewDao.react(map);
	}
}
