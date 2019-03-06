package com.spring.shop.vo;

public class Event {
	private int eno;
	private String tag;
	private String etitle;
	private String escript;
	private int xpath;
	private int ypath;
	private int pbno;
	private String imgpath;
	private String link;
	private int flag;
	
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getEtitle() {
		return etitle;
	}
	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}
	public String getEscript() {
		return escript;
	}
	public void setEscript(String escript) {
		this.escript = escript;
	}
	public int getXpath() {
		return xpath;
	}
	public void setXpath(int xpath) {
		this.xpath = xpath;
	}
	public int getYpath() {
		return ypath;
	}
	public void setYpath(int ypath) {
		this.ypath = ypath;
	}
	public int getPbno() {
		return pbno;
	}
	public void setPbno(int pbno) {
		this.pbno = pbno;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	@Override
	public String toString() {
		return "Event [eno=" + eno + ", tag=" + tag + ", etitle=" + etitle + ", escript=" + escript + ", xpath=" + xpath
				+ ", ypath=" + ypath + ", pbno=" + pbno + ", imgpath=" + imgpath + ", link=" + link + ", flag=" + flag
				+ "]";
	}
	
	
}
