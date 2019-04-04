package com.spring.shop.dao.Address;

import java.util.List;

import com.spring.shop.vo.Address;

public interface AddressDao {
	public List<Address> getAddressList(String customer) throws Exception;
	public void registAddr(Address address) throws Exception;
	public boolean checkBase(String customer) throws Exception;
	public void deleteAddr(int addrno) throws Exception;
	public void setBase(Address address) throws Exception;
}
