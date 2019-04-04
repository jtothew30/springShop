package com.spring.shop.dao.Address;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Address;

@Repository
public class AddressDaoImp implements AddressDao {
	@Inject
	SqlSession sqlSession;
	
	private final static String AddressMapper = "com.spring.shop.mapper.AddressMapper";
	
	@Override
	public List<Address> getAddressList(String customer){
		List<Address> addrlist = sqlSession.selectList(AddressMapper+".getAddressList", customer);
		return addrlist;
	}
	
	@Override
	public void registAddr(Address address) {
		sqlSession.insert(AddressMapper+".registAddr", address);
	}
	
	@Override
	public boolean checkBase(String customer) {
		 int cnt = sqlSession.selectOne(AddressMapper+".checkBase", customer);
		 if(cnt > 0)
			 return false;
		 else
			 return true;
	}
	
	@Override
	public void deleteAddr(int addrno) {
		sqlSession.delete(AddressMapper+".deleteAddr", addrno);
	}
	
	@Override
	public void setBase(Address address) {
		sqlSession.update(AddressMapper+".setBaseFalse", address.getCustomer());
		sqlSession.update(AddressMapper+".setBaseTrue", address.getAddrno());
	}
	
}
