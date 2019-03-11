package com.spring.shop.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.shop.service.Reply.ReplyService;
import com.spring.shop.vo.Reply;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	private ReplyService service;
	
	@ResponseBody
	@RequestMapping(value="reply.do", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String replyPage(HttpServletRequest request) throws Exception{
		System.out.println("replyPage ccc");
		
		Reply reply = new Reply();
		String flag = request.getParameter("flag");
		reply.setFlag(flag);
		
		if(flag.equals("review")) {
			int rno = Integer.parseInt(request.getParameter("rno"));
			reply.setNo(rno);
		}else {
			int qno = Integer.parseInt(request.getParameter("qno"));
			reply.setNo(qno);
		}

		System.out.println("flag:"+flag+"/no:"+reply.getNo());
		
		List<Reply> rplist = service.getReplyList(reply);
		
		Gson gson = new Gson();
		String str = gson.toJson(rplist);
		
		return str;
	}	
	
	
	
	@ResponseBody
	@RequestMapping(value="replyWirte.do", method=RequestMethod.POST)
	public void replyWirte(HttpServletRequest request) throws Exception{
		System.out.println("replyWirte check");
		
		Reply reply = new Reply();
		
		String writer = "testID";
		String rno = request.getParameter("rno");
		String qno = request.getParameter("qno");
		String content = request.getParameter("content");
						
		if(rno == null || rno.equals("")) {
			reply.setFlag("qna");
			reply.setNo(Integer.parseInt(qno));
		}else if(qno == null || qno.equals("")) {
			reply.setFlag("review");
			reply.setNo(Integer.parseInt(rno));
		}	
		reply.setWriter(writer);
		reply.setContent(content);
		
		System.out.println("replyWirte tostring:"+reply.toString());
		
		service.replyWirte(reply);
	}	
	
	
	@ResponseBody
	@RequestMapping(value="replyEdit.do", method=RequestMethod.POST)
	public void replyEdit(HttpServletRequest request) throws Exception{
		System.out.println("replyEdit check");
		
		Reply reply = new Reply();
		
		int rpno = Integer.parseInt(request.getParameter("rpno"));
		String content = request.getParameter("content");
		
		reply.setRpno(rpno);
		reply.setContent(content);	
		
		service.replyEdit(reply);
	}	
	
	
	@ResponseBody
	@RequestMapping(value="replyDelete.do", method=RequestMethod.POST)
	public void replyDelete(HttpServletRequest request) throws Exception{
		System.out.println("replyDelete check");
	
		int rpno = Integer.parseInt(request.getParameter("rpno"));
		
		service.replyDelete(rpno);
	}
	
}
