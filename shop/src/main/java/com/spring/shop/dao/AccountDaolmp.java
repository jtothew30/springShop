package com.spring.shop.dao;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Account;

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
}
