package com.spring.shop.service.Reply;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.shop.dao.Reply.ReplyDao;
import com.spring.shop.vo.Reply;

@Service("ReplyService")
public class ReplyServiceImp implements ReplyService {
	
	@Inject
	ReplyDao replyDao;
	
	@Override
	public List<Reply> getReplyList(Reply reply) throws Exception{
		return replyDao.getReplyList(reply);
	}
	
	@Override
	public void replyWirte(Reply reply) throws Exception {
		replyDao.replyWirte(reply);
	}
}
