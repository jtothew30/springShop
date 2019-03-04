package com.spring.shop.dao.Cart;

import java.util.List;
import java.util.Map;

import com.spring.shop.vo.Cart;
import com.spring.shop.vo.Production;

public interface CartDao {
	public void addCart(List<Cart> cartlist) throws Exception;
	public List<Cart> getCartList(String customer) throws Exception;
	public void deleteCart(Cart cart) throws Exception;
	public List<Production> getOptions(int pbno) throws Exception;
	public void changeOption(Map<String, Object> map) throws Exception;
}
