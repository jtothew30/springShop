package com.spring.shop.service.Account;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.Account.AccountDao;
import com.spring.shop.vo.Account;
import com.spring.shop.vo.Paging;

@Service("AccountService")
public class AccountServiceImp implements AccountService{
	
	@Inject
	AccountDao accountDao;
	
	@Override
	public String dbCheck(String id) throws Exception{
		return accountDao.dbCheck(id);
	}
	
	@Override
	public void dbInsert(Account account) throws Exception {
		accountDao.dbInsert(account);
	}
	
	@Override
	public Account login(Account account) throws Exception {
		return accountDao.login(account);
	}
	
	@Override
	public void dbUpdate(Account account) throws Exception {
		accountDao.dbUpdate(account);
	}

	@Override
	public List<Account> memlist(Account account) throws Exception {
		return accountDao.memlist(account);
	}
	
	@Override
	public Account viewmem(String id) throws Exception {
		return accountDao.viewmem(id);
	}
	
	@Override
	public void dbDelete(Account account) throws Exception {
		accountDao.dbDelete(account);
	}

	@Override
	public List<Account> selectAccountListAll(Paging paging) {
		return accountDao.selectAccountListAll(paging);
	}

	@Override
	public int selectAccountListCountAll(Paging paging) {
		return accountDao.selectAccountListCountAll(paging);
	}

	@Override
	public List<Account> selectAccountAll() {
		return accountDao.selectAccountAll();
	}
}
