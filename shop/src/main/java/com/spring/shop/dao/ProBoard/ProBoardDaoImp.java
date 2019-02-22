package com.spring.shop.dao.ProBoard;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.ProBoard;
import com.spring.shop.vo.Production;

@Repository
public class ProBoardDaoImp implements ProBoardDao{
	@Inject
	SqlSession sqlSession;
	
	private final static String ProBoardMapper = "com.spring.shop.mapper.ProBoardMapper";
	
	@Override
	public List<Production> getprolist(int pbno){
		List<Production> prolist = sqlSession.selectList(ProBoardMapper+".selectProductions", pbno);
		return prolist;
	}

	@Override
	public List<ProBoard> getlist() throws Exception {		
		return sqlSession.selectList(ProBoardMapper+".selectListAll");
	}

	@Override
	public void insertProBoard(ProBoard preBoard) throws Exception {
		sqlSession.insert(ProBoardMapper+".insertProBoard", preBoard);
	}
	

}