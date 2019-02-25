package com.spring.shop.service.Address;

import java.util.List;

import com.spring.shop.vo.Address;

public interface AddressService {
	public List<Address> getAddressList(String customer) throws Exception;
}