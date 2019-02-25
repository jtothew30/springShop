package com.spring.shop.dao.Address;

import java.util.List;

import com.spring.shop.vo.Address;

public interface AddressDao {
	public List<Address> getAddressList(String customer) throws Exception;
}