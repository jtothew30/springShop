package com.spring.shop.dao.ProBoard;

import java.util.HashMap;
import java.util.List;

import com.spring.shop.vo.Paging;
import com.spring.shop.vo.ProBoard;
import com.spring.shop.vo.Production;

public interface ProBoardDao {
	List<Production> getprolist(int pbno) throws Exception;
	List<ProBoard> getlist() throws Exception;
	void insertProBoard(ProBoard preBoard) throws Exception;
	void insertPnameContain(HashMap<String, Object> pbnopname);
	ProBoard selectBoardForContain(ProBoard proBoard);

	List<ProBoard> getpbList(String kwd);
	List<ProBoard> selectProboardListPaging(Paging paging);
	
	int getAllCount(String kwd);
	int getAllCount(Paging paging);
	
	ProBoard selectProBoardDetail(int pbno);
	void deleteProBoard(int pbno);
	int selectSearchCount(String kwd);
	List<ProBoard> selectSearchList(Paging paging);
	void updateBoard(ProBoard proBoard);
	void deleteProcontain(int pbno);
	List<ProBoard> selectProboardForCategory(Paging paging);
	List<ProBoard> selectProBoardAll();
}