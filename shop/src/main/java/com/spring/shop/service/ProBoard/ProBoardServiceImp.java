package com.spring.shop.service.ProBoard;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.ProBoard.ProBoardDao;
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
}