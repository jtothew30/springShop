package com.spring.shop.service.ProBoard;

import java.util.List;

import com.spring.shop.vo.ProBoard;
import com.spring.shop.vo.Production;

public interface ProBoardService {
	List<Production> getprolist(int pbno) throws Exception;
	List<ProBoard> getlist() throws Exception;
	void insertProBoardService(ProBoard proBoard) throws Exception;
}