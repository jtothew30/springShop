package com.spring.shop.vo;

public class Reply {
	private int rpno;
	private String writer;
	private String content;
	private String rpdate;
	private String flag;
	private int no;
	
	
	
	public int getRpno() {
		return rpno;
	}
	public void setRpno(int rpno) {
		this.rpno = rpno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRpdate() {
		return rpdate;
	}
	public void setRpdate(String rpdate) {
		this.rpdate = rpdate;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	@Override
	public String toString() {
		return "Reply [rpno=" + rpno + ", writer=" + writer + ", content=" + content + ", rpdate=" + rpdate + ", flag="
				+ flag + ", no=" + no + "]";
	}
	
	
}
