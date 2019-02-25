package com.spring.shop.vo;

public class ProBoard {
	private int rn;
	private int pbno;
	private String title;
	private java.util.Date pbdate;
	private int price;
	private int event;
	private int totalsales;
	private String options; 
	
	private String pname;
	private String category1;
	private String category2;
	private String category3;
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getCategory3() {
		return category3;
	}
	public void setCategory3(String category3) {
		this.category3 = category3;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public int getPbno() {
		return pbno;
	}
	public void setPbno(int pbno) {
		this.pbno = pbno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public java.util.Date getPbdate() {
		return pbdate;
	}
	public void setPbdate(java.util.Date pbdate) {
		this.pbdate = pbdate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getEvent() {
		return event;
	}
	public void setEvent(int event) {
		this.event = event;
	}
	public int getTotalsales() {
		return totalsales;
	}
	public void setTotalsales(int totalsales) {
		this.totalsales = totalsales;
	}
	@Override
	public String toString() {
		return "ProBoard [rn=" + rn + ", pbno=" + pbno + ", title=" + title + ", pbdate=" + pbdate + ", price=" + price
				+ ", event=" + event + ", totalsales=" + totalsales + ", options=" + options + ", pname=" + pname
				+ ", category1=" + category1 + ", category2=" + category2 + ", category3=" + category3 + "]";
	}
	
	
}
