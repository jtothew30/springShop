package com.spring.shop.vo;

public class ProBoard {
	private int rn;
	private int pbno;
	private String title;
	private java.util.Date pbdate;
	private int price;
	private int event;
	private int totalsales;
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
	
}
