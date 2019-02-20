package com.spring.shop.dao;

import java.util.List;

import com.spring.shop.vo.Production;

public interface ProBoardDao {
	public List<Production> getprolist(int pbno) throws Exception;
}
