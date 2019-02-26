package com.spring.shop.dao;

import java.util.List;

import com.spring.shop.vo.Account;

public interface AccountDao {
	public String dbCheck(String id) throws Exception;
	public void dbInsert(Account account) throws Exception;
	public void dbUpdate(Account account) throws Exception;
	public List<Account> memlist(Account account) throws Exception;
}
