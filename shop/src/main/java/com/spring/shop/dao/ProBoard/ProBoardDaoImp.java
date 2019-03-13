package com.spring.shop.dao.ProBoard;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Paging;
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

	@Override
	public void insertPnameContain(HashMap<String, Object> pbnopname){	
		sqlSession.insert(ProBoardMapper+".insertPnameContain", pbnopname);
	}

	@Override
	public ProBoard selectBoardForContain(ProBoard proBoard) {		
		return sqlSession.selectOne(ProBoardMapper+".selectBoardForContain", proBoard);
	}
	// ------- old
	@Override
	public List<ProBoard> getpbList(String kwd) {		
		return sqlSession.selectList(ProBoardMapper+".selectForSearch", kwd);
	}
	// ------- old
	@Override
	public int getAllCount(String kwd) {
		return sqlSession.selectOne(ProBoardMapper+".selectAllCount", kwd);
	}

	@Override
	public ProBoard selectProBoardDetail(int pbno) {
		return sqlSession.selectOne(ProBoardMapper+".selectProBoardDetail", pbno);
	}

	@Override
	public void deleteProBoard(int pbno) {
		sqlSession.delete(ProBoardMapper+".deleteProBoard", pbno);
	}

	@Override
	public int selectSearchCount(String kwd) {
		return sqlSession.selectOne(ProBoardMapper+".selectSearchCount", kwd);
	}

	@Override
	public List<ProBoard> selectSearchList(Paging paging) {
		return sqlSession.selectList(ProBoardMapper+".selectSearchList", paging);
	}

	@Override
	public List<ProBoard> selectProboardListPaging(Paging paging) {
		return sqlSession.selectList(ProBoardMapper+".searchForPaging", paging);
	}

	@Override
	public int getAllCount(Paging paging) {
		return sqlSession.selectOne(ProBoardMapper+".selectAllCountP",paging);
	}

	@Override
	public void updateBoard(ProBoard proBoard) {
		sqlSession.update(ProBoardMapper+".updateBoard",proBoard);
	}

	@Override
	public void deleteProcontain(int pbno) {
		sqlSession.delete(ProBoardMapper+".deleteProcontain", pbno);
	}

	@Override
	public List<ProBoard> selectProboardForCategory(Paging paging) {
		return sqlSession.selectList(ProBoardMapper+".selectProboardForCategory",paging);
	}

	@Override
	public List<ProBoard> selectProBoardAll() {
		return sqlSession.selectList(ProBoardMapper+".selectProBoardAll");
	}

	@Override
	public void deleteProContain(int pbno) {
		sqlSession.delete(ProBoardMapper+".deleteProContain",pbno);
	}
	
	
}