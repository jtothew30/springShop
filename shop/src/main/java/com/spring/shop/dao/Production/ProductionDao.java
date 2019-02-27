package com.spring.shop.dao.Production;

import java.util.List;

import com.spring.shop.vo.Paging;
import com.spring.shop.vo.Production;

public interface ProductionDao {
	List<Production> selectProductionList();	
	void insertProduction(Production production);
	void resetProductionCount(Production production);
	void updateProductionCount(Production production);
	Production selectProductionOne(Production production);
	Production selectProduction(int pno);
	int selectProductAllNum();
	List<Production> selectSearch(Paging paging);
	int selectSearchCount(String kwd);
}
