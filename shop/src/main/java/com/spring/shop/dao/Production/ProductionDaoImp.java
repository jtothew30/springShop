package com.spring.shop.dao.Production;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Paging;
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

	@Override
	public Production selectProduction(int pno) {
		return sqlSession.selectOne(ProductionMapper + ".selectProductOne", pno);
	}

	@Override
	public int selectProductAllNum() {
		return sqlSession.selectOne(ProductionMapper+".selectProductAllNum");
	}

	@Override
	public List<Production> selectSearch(Paging paging) {
		return sqlSession.selectList(ProductionMapper+".selectSearch", paging);
	}

	@Override
	public int selectSearchCount(String kwd) {
		return sqlSession.selectOne(ProductionMapper+".selectSearchCount", kwd);
	}
	
	

}
