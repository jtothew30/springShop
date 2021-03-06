package com.spring.shop.vo;

public class Production {
	private int rn;
	private int pno;
	private String pname;
	private String brand;
	private int inprice;
	private int outprice;
	private String category1;
	private String category2;
	private String category3;
	private String options;
	private String script;
	private int sales;
	private int count; // 1. 재고 -> procontain TABLE
					   // 2. production count for payment or adding in cart
					   // 충돌사항 없는지 check / view에서 주의할것
	
	public int getCount() {
		return count;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getInprice() {
		return inprice;
	}
	public void setInprice(int inprice) {
		this.inprice = inprice;
	}
	public int getOutprice() {
		return outprice;
	}
	public void setOutprice(int outprice) {
		this.outprice = outprice;
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
	public String getScript() {
		return script;
	}
	public void setScript(String script) {
		this.script = script;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	@Override
	public String toString() {
		return "Production [pno=" + pno + ", pname=" + pname + ", brand=" + brand + ", inprice=" + inprice
				+ ", outprice=" + outprice + ", category1=" + category1 + ", category2=" + category2 + ", category3="
				+ category3 + ", options=" + options + ", script=" + script + ", sales=" + sales + ", count=" + count
				+ "]";
	}
	
	
	
}