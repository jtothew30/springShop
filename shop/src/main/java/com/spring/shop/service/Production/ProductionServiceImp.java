package com.spring.shop.service.Production;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.Production.ProductionDao;
import com.spring.shop.vo.Production;

@Service
public class ProductionServiceImp implements ProductionService {
	@Inject
	ProductionDao productionDao;
	
	@Override
	public List<Production> productionSelectAllService() {
		return productionDao.selectProductionList();
	}

	@Override
	public void insertProductionService(Production production) {
		productionDao.insertProduction(production);
		
	}

	@Override
	public void resetProductionCount(Production production) {
		productionDao.resetProductionCount(production);
	}

	@Override
	public void updateProductionCount(Production production) {
		productionDao.updateProductionCount(production);		
	}

}
