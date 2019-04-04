package com.spring.shop.service.Address;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.Address.AddressDao;
import com.spring.shop.vo.Address;

@Service("AddressService")
public class AddressServiceImp implements AddressService {
	@Inject
	AddressDao addressDao;
	
	@Override
	public List<Address> getAddressList(String customer) throws Exception{
		return addressDao.getAddressList(customer);
	}
	
	@Override
	public void registAddr(Address address) throws Exception{
		addressDao.registAddr(address);
	}
	
	@Override
	public boolean checkBase(String customer) throws Exception{
		return addressDao.checkBase(customer);
	}
	
	@Override
	public void deleteAddr(int addrno) throws Exception{
		addressDao.deleteAddr(addrno);
	}
	
	@Override
	public void setBase(Address address) throws Exception{
		addressDao.setBase(address);
	}
}
