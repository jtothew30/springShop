package com.spring.shop.service.Production;

import java.util.List;

import com.spring.shop.vo.Production;

public interface ProductionService {
	List<Production> productionSelectAllService();
	void insertProductionService(Production production);
	void resetProductionCount(Production production);
	void updateProductionCount(Production production);
	Production selectProductionOne(Production production);
}
