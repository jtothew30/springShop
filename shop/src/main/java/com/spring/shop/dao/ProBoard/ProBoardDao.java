package com.spring.shop.dao.ProBoard;

import java.util.HashMap;
import java.util.List;

import com.spring.shop.vo.ProBoard;
import com.spring.shop.vo.Production;

public interface ProBoardDao {
	List<Production> getprolist(int pbno) throws Exception;
	List<ProBoard> getlist() throws Exception;
	void insertProBoard(ProBoard preBoard) throws Exception;
	void insertPnameContain(HashMap<String, Object> pbnopname);
	ProBoard selectBoardForContain(ProBoard proBoard);
	List<ProBoard> getpbList(String kwd);
	int getAllCount(String kwd);
}