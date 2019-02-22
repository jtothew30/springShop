package com.spring.shop.service.ProBoard;

import java.util.List;

import com.spring.shop.vo.Production;

public interface ProBoardService {
	public List<Production> getprolist(int pbno) throws Exception;
}
