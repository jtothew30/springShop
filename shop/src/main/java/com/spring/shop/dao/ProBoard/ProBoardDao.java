package com.spring.shop.dao.ProBoard;

import java.util.List;

import com.spring.shop.vo.Production;

public interface ProBoardDao {
	public List<Production> getprolist(int pbno) throws Exception;
}
