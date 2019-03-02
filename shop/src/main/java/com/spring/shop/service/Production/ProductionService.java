package com.spring.shop.service.Production;

import java.util.HashMap;
import java.util.List;

import com.spring.shop.vo.Paging;
import com.spring.shop.vo.Production;

public interface ProductionService {
	List<Production> productionSelectAllService();
	void insertProductionService(Production production);
	void resetProductionCount(Production production);
	void updateProductionCount(Production production);
	Production selectProductionOne(Production production);
	Production selectProduction(int pno);
	int selectProductAllNum();
	List<Production> selectSearch(Paging paging);
	int selectSearchCount(String kwd);
	void insertProcontainPnamePno(HashMap<String, Object> map);
}
