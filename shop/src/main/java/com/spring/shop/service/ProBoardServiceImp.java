package com.spring.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.ProBoardDao;
import com.spring.shop.vo.Production;

@Service("ProBoardService")
public class ProBoardServiceImp implements ProBoardService{
	@Inject
	ProBoardDao proboardDao;
	
	@Override
	public List<Production> getprolist(int pbno) throws Exception{
		return proboardDao.getprolist(pbno);
	}
}
