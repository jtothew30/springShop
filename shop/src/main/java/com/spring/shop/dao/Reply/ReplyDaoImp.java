package com.spring.shop.dao.Reply;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Reply;

@Repository
public class ReplyDaoImp implements ReplyDao {
	
	@Inject
	SqlSession sqlSession;
	
	private final static String ReplyMapper = "com.spring.shop.mapper.ReplyMapper";
	
	@Override
	public List<Reply> getReplyList(Reply reply){
		List<Reply> rplist = sqlSession.selectList(ReplyMapper+".getReplyList", reply);
		return rplist;
	}
	
	@Override
	public void replyWirte(Reply reply) {
		sqlSession.insert(ReplyMapper+".replyWirte", reply);
		System.out.println("replyWirte success");
	}
	
	@Override
	public void replyEdit(Reply reply) {
		sqlSession.update(ReplyMapper+".replyEdit", reply);
		System.out.println("replyEdit success");
	}
	
	@Override
	public void replyDelete(int rpno) {
		sqlSession.delete(ReplyMapper+".replyDelete", rpno);
		System.out.println("replyDelete success");
	}
}
