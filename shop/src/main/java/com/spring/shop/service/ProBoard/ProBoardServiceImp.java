package com.spring.shop.service.ProBoard;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.ProBoard.ProBoardDao;
import com.spring.shop.vo.Paging;
import com.spring.shop.vo.ProBoard;
import com.spring.shop.vo.Production;

@Service("ProBoardService")
public class ProBoardServiceImp implements ProBoardService{
	@Inject
	ProBoardDao proboardDao;
	
	@Override
	public List<Production> getprolist(int pbno) throws Exception{
		return proboardDao.getprolist(pbno);
	}

	@Override
	public List<ProBoard> getlist() throws Exception {
		return proboardDao.getlist();
	}

	@Override
	public void insertProBoardService(ProBoard proBoard) throws Exception {
		proboardDao.insertProBoard(proBoard);
	}

	@Override
	public void insertPnameContain(HashMap<String, Object> pbnopname) {
		proboardDao.insertPnameContain(pbnopname);
	}

	@Override
	public ProBoard selectBoardForContain(ProBoard proBoard) {
		return proboardDao.selectBoardForContain(proBoard);
	}

	@Override
	public List<ProBoard> getpbList(String kwd) {		
		return proboardDao.getpbList(kwd);
	}

	@Override
	public int getAllCount(String kwd) {
		return proboardDao.getAllCount(kwd);
	}

	@Override
	public ProBoard selectProBoardDetail(int pbno) {
		return proboardDao.selectProBoardDetail(pbno);
	}

	@Override
	public void deleteProBoard(int pbno) {
		proboardDao.deleteProBoard(pbno);
	}

	@Override
	public int selectSearchCount(String kwd) {
		return proboardDao.selectSearchCount(kwd);
	}

	@Override
	public List<ProBoard> selectSearchList(Paging paging) {
		return proboardDao.selectSearchList(paging);
	}

	@Override
	public List<ProBoard> selectProboardListPaging(Paging paging) {
		return proboardDao.selectProboardListPaging(paging);
	}

	@Override
	public int getAllCount(Paging paging) {
		return proboardDao.getAllCount(paging);
	}

	@Override
	public void updateBoard(ProBoard proBoard) {
		proboardDao.updateBoard(proBoard);
	}

	@Override
	public void deleteProcontain(int pbno) {
		proboardDao.deleteProcontain(pbno);
	}

	@Override
	public List<ProBoard> selectProboardForCategory(Paging paging) {
		return proboardDao.selectProboardForCategory(paging);
	}

	@Override
	public List<ProBoard> selectProBoardAll() {
		return proboardDao.selectProBoardAll();
	}
}