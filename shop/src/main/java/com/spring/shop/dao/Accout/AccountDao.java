package com.spring.shop.dao.Accout;

import com.spring.shop.vo.Account;

public interface AccountDao {
	public String dbCheck(String id) throws Exception;
	public void dbInsert(Account account) throws Exception;
}