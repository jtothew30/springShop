package com.spring.shop.dao.Cart;

import java.util.List;

import com.spring.shop.vo.Cart;

public interface CartDao {
	public void addCart(List<Cart> cartlist) throws Exception;
	public List<Cart> getCartList(String customer) throws Exception;
}
