package com.spring.shop.service.Reply;

import java.util.List;

import com.spring.shop.vo.Reply;

public interface ReplyService {
	public void replyWirte(Reply reply) throws Exception;
	public List<Reply> getReplyList(Reply reply) throws Exception;
	public void replyEdit(Reply reply) throws Exception;
	public void replyDelete(int rpno) throws Exception;
}
