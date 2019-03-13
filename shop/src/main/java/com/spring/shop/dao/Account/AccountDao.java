package com.spring.shop.dao.Account;

import java.util.List;

import com.spring.shop.vo.Account;
import com.spring.shop.vo.Paging;

public interface AccountDao {
	String dbCheck(String id) throws Exception;
	void dbInsert(Account account) throws Exception;
	public void dbUpdate(Account account) throws Exception;
	public List<Account> memlist(Account account) throws Exception;
	public Account viewmem(String id) throws Exception;
	public Account login(Account account) throws Exception;
	public void dbDelete(Account account) throws Exception;
	List<Account> selectAccountListAll(Paging paging);
	int selectAccountListCountAll(Paging paging);
	List<Account> selectAccountAll();
}
