package com.spring.shop.service.Production;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.Production.ProductionDao;
import com.spring.shop.vo.Paging;
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

	@Override
	public Production selectProductionOne(Production production) {
		return productionDao.selectProductionOne(production);
	}

	@Override
	public Production selectProduction(int pno) {
		return productionDao.selectProduction(pno);
	}

	@Override
	public int selectProductAllNum() {
		return productionDao.selectProductAllNum();
	}

	@Override
	public List<Production> selectSearch(Paging paging) {
		return productionDao.selectSearch(paging);
	}

	@Override
	public int selectSearchCount(String kwd) {
		return productionDao.selectSearchCount(kwd);
	}

	@Override
	public void insertProcontainPnamePno(HashMap<String, Object> map) {
		productionDao.insertProcontainPnamePno(map);
	}

}
