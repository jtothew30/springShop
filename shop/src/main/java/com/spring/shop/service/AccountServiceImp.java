package com.spring.shop.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.AccountDao;
import com.spring.shop.vo.Account;

@Service("AccountService")
public class AccountServiceImp implements AccountService{
	
	@Inject
	AccountDao accountDao;
	
	@Override
	public String dbCheck(String id) throws Exception{
		return accountDao.dbCheck(id);
	}
	
	@Override
	public void dbInsert(Account account) throws Exception{
		accountDao.dbInsert(account);
	}
}
