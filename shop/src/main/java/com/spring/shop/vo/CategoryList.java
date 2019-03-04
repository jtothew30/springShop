package com.spring.shop.vo;

import java.util.Arrays;

public class CategoryList {
	private String[] listCate2;
	private String[] listCate3;
	public String[] getListCate2() {
		return listCate2;
	}
	public void setListCate2(String[] listCate2) {
		this.listCate2 = listCate2;
	}
	public String[] getListCate3() {
		return listCate3;
	}
	public void setListCate3(String[] listCate3) {
		this.listCate3 = listCate3;
	}
	@Override
	public String toString() {
		return "CategoryList [listCate2=" + Arrays.toString(listCate2) + ", listCate3=" + Arrays.toString(listCate3)
				+ "]";
	}
	
	
}
