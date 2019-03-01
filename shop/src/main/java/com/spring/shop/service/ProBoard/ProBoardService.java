package com.spring.shop.service.ProBoard;

import java.util.HashMap;
import java.util.List;

import com.spring.shop.vo.Paging;
import com.spring.shop.vo.ProBoard;
import com.spring.shop.vo.Production;

public interface ProBoardService {
	List<Production> getprolist(int pbno) throws Exception;
	List<ProBoard> getlist() throws Exception;
	void insertProBoardService(ProBoard proBoard) throws Exception;
	void insertPnameContain(HashMap<String, Object> pbnopname);
	ProBoard selectBoardForContain(ProBoard proBoard);
	
	List<ProBoard> getpbList(String kwd);
	List<ProBoard> selectProboardListPaging(Paging paging);
	
	int getAllCount(String kwd);
	ProBoard getProBoardDetail(int pbno);
	void deleteProBoard(int pbno);
	int selectSearchCount(String kwd);
	List<ProBoard> selectSearchList(Paging paging);
	int getAllCount(Paging paging);
}