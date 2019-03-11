package com.spring.shop.dao.Account;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Account;
import com.spring.shop.vo.Paging;

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
	
	@Override
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
	
	public Account login(Account account) {
		return sqlSession.selectOne(AccountMapper+".login", account);
	}
	
	public void dbUpdate(Account account) {
		sqlSession.update(AccountMapper+".update",account);
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
	
	//==================== 190308 kim 추가
	@Override
	public List<Account> selectAccountListAll(Paging paging) {
		return sqlSession.selectList(AccountMapper+".selectAccountListAll",paging);
	}

	@Override
	public int selectAccountListCountAll(Paging paging) {
		return sqlSession.selectOne(AccountMapper+".selectAccountListCountAll",paging);
	}
}
