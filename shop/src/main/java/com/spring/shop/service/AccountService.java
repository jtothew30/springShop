package com.spring.shop.service;

import java.util.List;

import com.spring.shop.vo.Account;

public interface AccountService {
	public String dbCheck(String id) throws Exception;
	public void dbInsert(Account account) throws Exception;
	public void dbUpdate(Account account) throws Exception;
	public List<Account> memlist(Account account) throws Exception;
	public Object viewmem(String name) throws Exception;
	public Account login(Account account) throws Exception;
	public void delete(Account account) throws Exception;
}
