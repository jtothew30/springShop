package com.spring.shop.service.Account;

import org.springframework.transaction.annotation.Transactional;

import com.spring.shop.vo.Account;


public interface AccountService {
	public String dbCheck(String id) throws Exception;
	public void dbInsert(Account account) throws Exception;
}
