package com.spring.shop.dao.Account;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Account;

@Repository
public class AccountDaoImp implements AccountDao{
	@Inject
	SqlSession sqlSession;
	
	private final static String AccountMapper = "com.spring.shop.mapper.AccountMapper";
	
	@Override
	public String dbCheck(String id) {
		System.out.println("AccountDaolmp check:"+id);
		int ck=(Integer)sqlSession.selectOne(AccountMapper+".idCheck",id);
		System.out.println("AccountDaolmp check2:"+id);
		return ck>0?"t":"f"; // t 중복 아이디 존재 / f 사용 가능 
	}
	
	public void dbInsert(Account account) {
		System.out.println("dbInsert 넘어온 id="+account.getId());
		System.out.println("dbInsert 넘어온 pw="+account.getPw());
		System.out.println("dbInsert 넘어온 name="+account.getName());
		System.out.println("dbInsert 넘어온 age="+account.getAge());
		System.out.println("dbInsert 넘어온 gender="+account.getGender());
		System.out.println("dbInsert 넘어온 email="+account.getEmail());
		System.out.println("dbInsert 넘어온 phone="+account.getPhone());
		sqlSession.insert(AccountMapper+".insert", account);
		System.out.println("dbInsert success");
	}
}
