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
}