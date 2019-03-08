package com.spring.shop.vo;

public class Review {
	private int rno;  
	private String options; 
	private String writer;
	private String content; 
	private String path; 
	private int stars;
	private String rdate;
	private int pbno;
	private int good;
	private int bad;
	
	private String title;
	
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
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
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getPbno() {
		return pbno;
	}
	public void setPbno(int pbno) {
		this.pbno = pbno;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	@Override
	public String toString() {
		return "Review [rno=" + rno + ", options=" + options + ", writer=" + writer + ", content=" + content + ", path="
				+ path + ", stars=" + stars + ", rdate=" + rdate + ", pbno=" + pbno + ", good=" + good + ", bad=" + bad
				+ "]";
	}
	
}
