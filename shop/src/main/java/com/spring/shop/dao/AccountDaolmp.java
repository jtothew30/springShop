package com.spring.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Account;
import com.sun.mail.imap.protocol.Namespaces.Namespace;

@Repository
public class AccountDaolmp implements AccountDao{
	@Inject
	SqlSession sqlSession;
	
	private final static String AccountMapper = "com.spring.shop.mapper.AccountMapper";
	
	@Override
	public String dbCheck(String id) {
		System.out.println("AccountDaolmp check:"+id);
		int ck=(Integer)sqlSession.selectOne(AccountMapper+".idCheck",id);
		System.out.println("AccountDaolmp check2:"+id);
		return ck>0?"t":"f"; // t �ߺ� ���̵� ���� / f ��� ���� 
	}
	
	public void dbInsert(Account account) {
		System.out.println("dbInsert �Ѿ�� id="+account.getId());
		System.out.println("dbInsert �Ѿ�� pw="+account.getPw());
		System.out.println("dbInsert �Ѿ�� name="+account.getName());
		System.out.println("dbInsert �Ѿ�� age="+account.getAge());
		System.out.println("dbInsert �Ѿ�� gender="+account.getGender());
		System.out.println("dbInsert �Ѿ�� email="+account.getEmail());
		System.out.println("dbInsert �Ѿ�� phone="+account.getPhone());
		sqlSession.insert(AccountMapper+".insert", account);
		System.out.println("dbInsert success");
	}
	
	public Account login(Account account) {
		return sqlSession.selectOne(AccountMapper+".login", account);
	}
	
	public void dbUpdate(Account account) {
		System.out.println("dbUpdate �Ѿ�� pw ="+account.getPw());
		System.out.println("dbUpdate �Ѿ�� email="+account.getEmail());
		System.out.println("dbUpdate �Ѿ�� phone="+account.getPhone());
		sqlSession.update(AccountMapper+".update",account);
		System.out.println("dbUpdate success");
	}
	
	@Override
	public List<Account> memlist(Account account) {
		return sqlSession.selectList(AccountMapper+".select", account);
	}
	
	@Override
	public Account viewmem(String id) {
		return sqlSession.selectOne(AccountMapper+".view", id);
	}
	
	@Override
	public void dbDelete(Account account) throws Exception {
		sqlSession.delete(AccountMapper+".delete", account);
	}
}
