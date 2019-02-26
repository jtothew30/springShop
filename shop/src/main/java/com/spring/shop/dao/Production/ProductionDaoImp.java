package com.spring.shop.dao.Production;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Production;

@Repository
public class ProductionDaoImp implements ProductionDao {
	
	@Inject
	SqlSession sqlSession;
	
	private final static String ProductionMapper = "com.spring.shop.mapper.ProductionMapper";
	
	@Override
	public List<Production> selectProductionList() {
		return sqlSession.selectList(ProductionMapper + ".selectProductAll");
	}

	@Override
	public void insertProduction(Production production) {
		sqlSession.insert(ProductionMapper+".insertProduct", production);
		
	}

	@Override
	public void resetProductionCount(Production production) {
		sqlSession.insert(ProductionMapper+".resetProductCount", production);
		
	}

	@Override
	public void updateProductionCount(Production production) {
		sqlSession.update(ProductionMapper+".updateProductCount", production);
	}

	@Override
	public Production selectProductionOne(Production production) {
		return sqlSession.selectOne(ProductionMapper + ".selectProductForCount", production);
	}

}
